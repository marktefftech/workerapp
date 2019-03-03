import 'package:flutter/material.dart';

class LaborLogin extends StatefulWidget {
  @override
  _LaborLoginState createState() => _LaborLoginState();
}

class _LaborLoginState extends State<LaborLogin> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Labor Login Page Title",
          style: TextStyle(color: Colors.cyan[900]),
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Text('TODO'),
      ),
    );
  }
}
