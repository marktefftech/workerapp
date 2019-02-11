import 'package:flutter/material.dart';
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
      ),
      body: Container(
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
