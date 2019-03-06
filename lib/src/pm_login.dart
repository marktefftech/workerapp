import 'package:flutter/material.dart';

class PmLogin extends StatefulWidget {
  @override
  _PmLoginState createState() => _PmLoginState();
}

class _PmLoginState extends State<PmLogin> {
  final formKey = GlobalKey<FormState>();
  final workOrderController = TextEditingController();

  @override
  void initState() {
    super.initState();
    workOrderController.addListener(_printLatestValue());
  }

  // clean up controller when the Widget is removed from the Widget tree
  @override
  void dispose() {
    workOrderController.dispose();
    super.dispose();
  }

  _printLatestValue() {
    String currentText = workOrderController.text;
    print("Form text field: $text");
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
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
          key: formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: workOrderController,
                keyboardType: TextInputType.emailAddress, // Use email input type for emails.
                decoration: InputDecoration(
                  hintText: 'name@example.com',
                  labelText: "Client's Contact Email",
                )
              ),
              new TextFormField(
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  hintText: 'mm/dd/yyyy',
                  labelText: 'Date'
                ),
              ),
              new TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Location'
                ),
              ),
              new TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Number of Movers Needed'
                ),
              ),
              new TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Number of Installers Needed'
                ),
              ),
              
              new TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  labelText: 'Scope of Work'
                ),
              ),
              Container(
                child: RaisedButton(
                  child: Text(
                    'Submit',
                    style: new TextStyle(
                      color: Colors.white 
                    ),
                  ),
                  onPressed: () {
                    // take data from form
                    // send post request
                    // 
                  },
                  color: Colors.deepOrange,
                ),
                margin: EdgeInsets.only(
                  top: 20.0
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
