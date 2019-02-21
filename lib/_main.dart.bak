import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:worker_app/PmLogin.dart';
import 'package:worker_app/SignUp.dart';
import 'package:worker_app/LaborLogin.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movers App',
      theme: ThemeData(
        primaryColor: Colors.cyan,
      ),
      home: HomePage(
        title: "Movers App POC",
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.cyan[900]),
        ),
        centerTitle: true,
      ),
      body: Container(
        stream: Firestore.instance.collection('flutter_data').snapshots(),
        builder: (BuildContext context, AsyncSnapShot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          return FirestoreListView(documents: snapshot.data.documents);
        }, // StreamBuilder
        decoration: BoxDecoration(
            image: DecorationImage(
          image: NetworkImage(
            'https://c.pxhere.com/photos/13/dd/buildings_city_cityscape_downtown_highway_lights_night_road-1269429.jpg!d',
          ),
          fit: BoxFit.cover,
        )),
        alignment: Alignment(0.0, 0.0),
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ButtonTheme(
                  height: 40.0,
                  child: RaisedButton(
                      child: const Text(
                        'Log in as Project Manager',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      color: Colors.white,
                      elevation: 4.0,
                      splashColor: Colors.blue,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PmLogin()),
                        );
                      },
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))),
                ),
                SizedBox(height: 24),
                ButtonTheme(
                  height: 40.0,
                  child: RaisedButton(
                      child: const Text(
                        'Log in as Mover/Installer',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      color: Colors.white,
                      elevation: 4.0,
                      splashColor: Colors.blue,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LaborLogin()),
                        );
                      },
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))),
                ),
                SizedBox(height: 94),
                Text("Don't have an account ?",
                  style: TextStyle(color: Colors.white), 
                ),
                SizedBox(height: 24),
                ButtonTheme(
                  height: 40.0,
                  child: RaisedButton(
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      color: Colors.white,
                      elevation: 4.0,
                      splashColor: Colors.blue,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUp()),
                        );
                      },
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FirestoreListView extends StatelessWidget {
  final List<DocumentSnapshot> documents;

  FirestoreListView({this.documents});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: documents.length,
      itemExtent: 90.0,
      itemBuilder: (BuildContext context, int index) {
        String title = documents[index].data['title'].toString();

        return ListTile(
          title: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(color: Colors.black),
            ),
            padding: EdgeInsert.all(5.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(title),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}