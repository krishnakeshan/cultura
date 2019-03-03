import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:async';

import 'package:cultura/model/event.dart';
import 'package:cultura/model/registration.dart';

import 'package:cultura/qr_codes.dart';

class RegisterParticipantWidget extends StatefulWidget {
  //Properties
  final Event event;

  //Constructors
  RegisterParticipantWidget({this.event});

  //Methods
  @override
  _RegisterParticipantWidget createState() {
    return _RegisterParticipantWidget(event: event);
  }
}

class _RegisterParticipantWidget extends State<RegisterParticipantWidget> {
  //Properties
  Event event;
  TextEditingController receiptController;
  TextEditingController nameController;
  TextEditingController phoneController;
  TextEditingController emailController;
  TextEditingController collegeController;
  static const platformChannel = MethodChannel("in.ac.cmrit.cultura/main");

  //Constructors
  _RegisterParticipantWidget({this.event});

  //Methods
  @override
  void initState() {
    super.initState();

    //initialize text controllers
    receiptController = TextEditingController();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    collegeController = TextEditingController();
  }

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
          //Receipt Text Field
          TextField(
            controller: receiptController,
            decoration: InputDecoration(
              hintText: "Receipt No.",
            ),
            maxLines: 1,
            keyboardType: TextInputType.number,
          ),

          //Participant Name Text Field
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              hintText: "Name",
            ),
            maxLines: 1,
            textCapitalization: TextCapitalization.words,
          ),

          //Participant Phone Text Field
          TextField(
            controller: phoneController,
            decoration: InputDecoration(
              hintText: "Phone",
            ),
            keyboardType: TextInputType.phone,
            maxLines: 1,
          ),

          //Participant Email Text Field
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              hintText: "Email",
            ),
            keyboardType: TextInputType.emailAddress,
            maxLines: 1,
          ),

          //Participant College Name Text Field
          TextField(
            controller: collegeController,
            decoration: InputDecoration(
              hintText: "College Name",
            ),
            maxLines: 1,
            textCapitalization: TextCapitalization.words,
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
            color: Colors.green,
            child: Text(
              "CASH",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              //call platform method to register if all values entered
              if (receiptController.text.isEmpty ||
                  nameController.text.isEmpty ||
                  phoneController.text.isEmpty ||
                  emailController.text.isEmpty ||
                  collegeController.text.isEmpty) {
                return false;
              }

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
                      RaisedButton(
                        color: Colors.blue,
                        child: Text(
                          "Finish Registration",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          //call function to save registration
                          _registerParticipant(context);
                          Navigator.pop(buildContext);
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
            onPressed: () {
              //only open if none of the fields are empty
              if (receiptController.text.isNotEmpty &&
                  nameController.text.isNotEmpty &&
                  phoneController.text.isNotEmpty &&
                  emailController.text.isNotEmpty &&
                  collegeController.text.isNotEmpty) {
                //create a registration object
                Registration registration = Registration(
                  receipt: receiptController.text,
                  name: nameController.text,
                  phone: phoneController.text,
                  email: emailController.text,
                  college: collegeController.text,
                  eventId: event.objectId,
                  eventName: event.name,
                );

                //open qr codes screen and pass registration to it
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (buildContext) {
                      return QRCodesScreen(
                        registration: registration,
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  //method to register this participant
  Future<void> _registerParticipant(BuildContext buildContext) async {
    var success = await platformChannel.invokeMethod(
      "registerParticipant",
      {
        "receipt": receiptController.text,
        "name": nameController.text,
        "phone": phoneController.text,
        "email": emailController.text,
        "college": collegeController.text,
        "eventId": event.objectId,
        "eventName": event.name
      },
    );

    //registration was successful, show dialog
    if (success) {
      showDialog(
        context: buildContext,
        barrierDismissible: true,
        builder: (buildContext) {
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
        builder: (buildContext) {
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
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }
  }

  //method to open registration link for this event
  //method to open link
  Future<void> _openRegistrationLink(String link) async {
    await platformChannel.invokeMethod(
      "openRegistrationLink",
      {
        "regLink": link,
      },
    );
  }
}
