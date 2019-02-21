import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  SignUpState createState() => new SignUpState();
}

class SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
            appBar: AppBar(
        title: Text(
          "Sign Up Page Title",
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
