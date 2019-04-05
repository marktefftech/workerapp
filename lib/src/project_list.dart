import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Projectlist extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ProjectlistState();
  }
}

class ProjectlistState extends State<Projectlist> {
  final _suggestions = <String>[];

  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection("projectlists").snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return new Text('${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Center(child: new LinearProgressIndicator());
          default:
            print("data start");
            print(snapshot.data.documents);
            for (int i = 0; i <= snapshot.data.documents.length - 1; i++) {
              if (snapshot.data.documents[i].data.containsKey("clientname")) {
                _suggestions.add(snapshot.data.documents[i].data["clientname"]);
              }
            }
            return Scaffold(
              appBar: AppBar(
                title: Text('Startup Name Generator 2.0'),
              ),
              body: _buildSuggestions(),
            );
        }
      },
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
      itemCount: _suggestions.length,
      padding: const EdgeInsets.all(10.0),
      itemBuilder: (context, i) {
        // If you've reached the end of the available word pairings...
        return _buildRow(_suggestions[i]);
      },
    );
  }

  Widget _buildRow(String pair) {
    return new ListTile(
      title: new Text(pair, style: _biggerFont),
    );
  }
}
