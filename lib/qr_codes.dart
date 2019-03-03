import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:async';

import 'package:cultura/model/registration.dart';

class QRCodesScreen extends StatelessWidget {
  //Properties
  final Registration registration;
  final MethodChannel platformChannel =
      MethodChannel("in.ac.cmrit.cultura/main");

  //Constructors
  QRCodesScreen({this.registration});

  //Methods
  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Select Payment Method",
        ),
      ),
      body: DefaultTabController(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //Tab Bar
            TabBar(
              tabs: <Widget>[
                Tab(
                  text: "BHIM UPI",
                ),
                Tab(
                  text: "Paytm",
                ),
              ],
              indicatorColor: Colors.black,
            ),

            //TabBarView
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  Image.asset(
                    "assets/bhim_upi.png",
                    height: 300,
                    width: 300,
                  ),
                  Image.asset(
                    "assets/paytm.png",
                    height: 300,
                    width: 300,
                  ),
                ],
              ),
            ),

            Divider(
              color: Colors.blueGrey,
            ),

            //Payment Alert Message
            Container(
              margin: EdgeInsets.only(left: 16, top: 12, right: 16),
              child: Text(
                "Please press this button after succesful payment",
                style: TextStyle(
                  color: Colors.blueGrey,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            //Button to finish registration
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: RaisedButton(
                color: Colors.black,
                child: Text(
                  "FINISH REGISTRATION",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  //call method to register this participant
                  _registerParticipant(buildContext);
                },
              ),
            ),
          ],
        ),
        length: 2,
      ),
    );
  }

  //method to register this participant
  Future<void> _registerParticipant(BuildContext buildContext) async {
    var success = await platformChannel.invokeMethod(
      "registerParticipant",
      {
        "receipt": registration.receipt,
        "name": registration.name,
        "phone": registration.phone,
        "email": registration.email,
        "college": registration.college,
        "eventId": registration.eventId,
        "eventName": registration.eventName,
      },
    );

    //registration was successful, show dialog
    if (success) {
      showDialog(
        context: buildContext,
        barrierDismissible: true,
        builder: (dialogContext) {
          return AlertDialog(
            title: Text(
              "Registration Successful",
              style: TextStyle(
                color: Colors.green,
              ),
            ),
            actions: <Widget>[
              RaisedButton(
                color: Colors.green,
                child: Text(
                  "OK",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  //close this
                  Navigator.pop(buildContext);
                },
              ),
            ],
          );
        },
      );
    }

    //registration unsuccessful, show dialog
    else {
      showDialog(
        context: buildContext,
        barrierDismissible: true,
        builder: (dialogContext) {
          return AlertDialog(
            title: Text(
              "Registration Not Successful",
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            content: Text("Please try again"),
            actions: <Widget>[
              RaisedButton(
                color: Colors.green,
                child: Text(
                  "OK",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  //close this
                  Navigator.pop(buildContext);
                },
              ),
            ],
          );
        },
      );
    }
  }
}
