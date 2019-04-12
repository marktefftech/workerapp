import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Projectlist extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ProjectlistState();
  }
}

class ProjectlistState extends State<Projectlist> {
  final _clients = <Client>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    _clients.removeRange(0, _clients.length);
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection("projectlists").snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return new Text('${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Center(child: new LinearProgressIndicator());
          default:
            for (int i = 0; i <= snapshot.data.documents.length - 1; i++) {
           
              Client client = new Client();
              client.validateClientData(snapshot.data.documents[i].data);
              _clients.add(client);

            }
            return Scaffold(
              appBar: AppBar(
                title: Text('Moving Projects List'),
              ),
              body: _buildClientRows(),
            );
        }
      },
    );
  }

  Widget _buildClientRows() {
    return new ListView.builder(
      itemCount: _clients.length,
      padding: const EdgeInsets.all(10.0),
      itemBuilder: (context, i) {
        // If you've reached the end of the available word pairings...
        return _buildRow(_clients[i]);
      },
    );
  }

  Widget _buildRow(Client clientOrder) {
    return new ListTile(
      leading: clientOrder.getIcon(),
      title: new Text(clientOrder.name, style: _biggerFont),
      subtitle: new Text(clientOrder.getDateAsString()),
      onTap: (){},
    );
  }
}

class Client {
  String name;
  Timestamp date;
  int installers;
  int movers;
  String iconUrl;

  dynamic getIcon() {
    if(this.iconUrl == null) {
       return new Icon(Icons.event_seat);
    }
    return Container(
          child: Center(
            child: Image.network(this.iconUrl)),
          width: 35,
          height: 35,
        );
  }

  String getDateAsString() {
    if(this.date == null) {
      return "Missing";
    }
    Timestamp timestamp = this.date;
    var d = new DateFormat.yMMMd().format(
              new DateTime.fromMillisecondsSinceEpoch(
              timestamp.millisecondsSinceEpoch));
    return d;
  }

  validateClientData(Map<String, dynamic> data) {
    if (data.containsKey("clientname")) {
      name = data["clientname"];
    }
    if (data.containsKey("date")) {
      date = data["date"];
    }

    if (data.containsKey("iconUrl")) {
      iconUrl = data["iconUrl"];
    }

    installers = data["installers"];
    movers = data["movers"];
  }
}
