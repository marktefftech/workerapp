import 'package:flutter/material.dart';
import 'package:worker_app/src/project_list.dart';
//import 'package:worker_app/src/homepage.dart';

void main() => runApp(App());

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movers App',
      theme: ThemeData(
        primaryColor: Colors.cyan,
      ),
      home: Projectlist(),
    );
  }
}



