import 'package:flutter/material.dart';

import 'src/homepage.dart';

void main() => runApp(App());

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.cyan,
      ),
      home: HomePage(
        title: "Movers App POC",
      ),
    );
  }
}



