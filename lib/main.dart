import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:worker_app/PmLogin.dart';
import 'package:worker_app/SignUp.dart';
import 'package:worker_app/LaborLogin.dart';

import 'src/homepage.dart';

void main() => runApp(App());

class App extends StatelessWidget {

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



