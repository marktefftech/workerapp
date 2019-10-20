import 'package:flutter/material.dart';
import 'package:worker_app/widgets/homepage.dart';

void main() => runApp(App());

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movers App',
      theme: ThemeData(
        primaryColor: Colors.cyan,
      ),
      home: HomePage(title: "Hu\$tle Up Movers App"),
    );
  }
}



