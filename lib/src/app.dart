import 'package:flutter/material.dart';

class App extends StatelessWidget {
  build(context) {
    return (
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Let\'s see some images!'),
          ),
          floatingActionButton: FloatingActionButton(
              child: Icon(
                Icons.add,
              ),
              onPressed: () {
                print('Button is pressed!');
              }
            ),
          ),
        ) 
    );
  }
}