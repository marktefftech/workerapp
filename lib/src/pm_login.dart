import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PmLogin extends StatefulWidget {
  @override
  _PmLoginState createState() => _PmLoginState();
}

class _PmLoginState extends State<PmLogin> {
  final _formKey = GlobalKey<FormState>();
  String _name, _email;
  @override
  Widget build(BuildContext context) {
    //ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "New Project Submission",
          style: TextStyle(
            color: Colors.cyan[900],
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: Container(
        padding: EdgeInsets.all(20.0),
        child:  Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Client Name",
                ),
                validator: _validateName,
                onSaved: (input) => _name = input,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'name@example.com',
                  labelText: "Email",
                ),
                validator: _validateEmail,
                onSaved: (input) => _email = input,
              ),
              TextFormField(
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  labelText: 'Date'
                ),

              ),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Location'
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Number of Movers Needed'
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Number of Installers Needed'
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  labelText: 'Scope of Work'
                ),
              ),
              Container(
                child: RaisedButton(
                  onPressed: _submit,
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                  
                  color: Colors.deepOrange,
                ),
                margin: new EdgeInsets.only(
                  top: 20.0
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

void _submit() {
    if (_formKey.currentState.validate()) {
      print('INSIDE _formKey.currentState.validate()');
      _formKey.currentState.save();
      Firestore.instance
        .collection('projectlists')
        .add({
          "name": _name,
          "email": _email
        })
        .then((result) => {
          print('Added new document to Firestore')
        })
        .catchError((error) => print(error));
    }
  }

  String _validateName(String value) {
    if(value == '') {
      return 'Name must be entered';
    }
    return null;
  }

  String _validateEmail(String value) {
    if(value == '') {
      return 'Email must be entered';
    } else if (!value.contains('@')) {
      return 'Email must contain an \'@\' symbol';
    }
    return null;
  }
}


