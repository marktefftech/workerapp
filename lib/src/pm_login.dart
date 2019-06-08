import 'package:flutter/material.dart';

class PmLogin extends StatefulWidget {
  @override
  _PmLoginState createState() => _PmLoginState();
}

class _PmLoginState extends State<PmLogin> {
  final _formKey = GlobalKey<FormState>();
  String _email;
  @override
  Widget build(BuildContext context) {
    //ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Project Manager Page Title",
          style: TextStyle(color: Colors.cyan[900]),
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
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'name@example.com',
                  labelText: "Client Email",
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
      print(_formKey.currentState);
      _formKey.currentState.save();
    }
  }

  String _validateEmail(String value) {
    if(value == '') {
      return 'Email must not be blank';
    } else if (!value.contains('@')) {
      return 'Email must contain an \'@\' symbol';
    }
    return null;
  }
}


