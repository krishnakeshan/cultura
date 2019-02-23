import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterParticipantWidget extends StatefulWidget {
  //Properties

  //Methods
  @override
  _RegisterParticipantWidget createState() {
    return _RegisterParticipantWidget();
  }
}

class _RegisterParticipantWidget extends State<RegisterParticipantWidget> {
  //Properties
  static const platformChannel = MethodChannel("in.ac.cmrit.cultura/main");

  //Methods
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Register Participant",
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          //Participant Name Text Field
          TextField(
            decoration: InputDecoration(
              hintText: "Name",
            ),
            maxLines: 1,
          ),

          //Participant Phone Text Field
          TextField(
            decoration: InputDecoration(
              hintText: "Phone",
            ),
            keyboardType: TextInputType.phone,
            maxLines: 1,
          ),

          //Participant Email Text Field
          TextField(
            decoration: InputDecoration(
              hintText: "Email",
            ),
            keyboardType: TextInputType.emailAddress,
            maxLines: 1,
          ),

          //Participant Email Text Field
          TextField(
            decoration: InputDecoration(
              hintText: "College Name",
            ),
            maxLines: 1,
          ),

          //Payment Methods Title
          Container(
            margin: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Payment Method",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          //Cash Payment Button
          RaisedButton(
            child: Text(
              "CASH",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            color: Colors.black,
            onPressed: () {
              //show a dialog asking to receive cash
              return showDialog(
                context: context,
                barrierDismissible: true,
                builder: (buildContext) {
                  return AlertDialog(
                    title: Text(
                      "Receive Cash and Finish Registration",
                    ),
                    content: Text(
                      "Press the \"Finish Registration\" button once cash is received from participant.",
                    ),
                    actions: <Widget>[
                      //Cancel button
                      FlatButton(
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      //Finish Registration Flat Button
                      FlatButton(
                        child: Text(
                          "Finish Registration",
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {
                          //call function to save registration
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),

          //Other methods button
          RaisedButton(
            child: Text(
              "OTHER",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            color: Colors.black,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
