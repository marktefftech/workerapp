import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:worker_app/models/client.dart';

class ProjectList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProjectListState();
  }
}

class ProjectListState extends State<ProjectList> {
  final _clients = <Client>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    _clients.removeRange(0, _clients.length);
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection("projectlists").snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return Text('${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(child: LinearProgressIndicator());
          default:
            for (int i = 0; i < snapshot.data.documents.length; i++) {
           
              Client client = new Client();
              client.validateClientData(snapshot.data.documents[i].data);
              _clients.add(client);

            }
            return Scaffold(
              appBar: AppBar(
                title: Text('Moving Projects List'),
              ),
              body: ClientRows(clients: _clients),
            );
        }
      },
    );
  }
}

class ClientRows extends StatelessWidget {
  final List<Client> clients;

  ClientRows({this.clients});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: clients.length,
      padding: const EdgeInsets.all(10.0),
      itemBuilder: (context, i) {
        return ClientOrder(client: clients[i]);
      }
    );
  }
}

class ClientOrder extends StatelessWidget {
  final Client client;
  final _biggerFont = TextStyle(fontSize: 18.0);

  ClientOrder({this.client});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: client.getIcon(),
      title: Text(client.name, style: _biggerFont),
      subtitle: Text(client.getDateAsString()),
      onTap: (){},
    );
  }
}