import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import 'package:cultura/event_list.dart';
import 'package:cultura/admin_panel.dart';

class VolunteerLoginWidget extends StatefulWidget {
  //Methods
  @override
  _VolunteerLoginWidgetState createState() {
    return _VolunteerLoginWidgetState();
  }
}

class _VolunteerLoginWidgetState extends State<VolunteerLoginWidget> {
  //Properties
  var usernameTextController = TextEditingController();
  var passwordTextController = TextEditingController();
  static const platformChannel = MethodChannel("in.ac.cmrit.cultura/main");

  //Methods
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Volunteer Login",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Scaffold(
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  hintText: "username",
                ),
                controller: usernameTextController,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "password",
                ),
                controller: passwordTextController,
              ),

              //Login Button
              Container(
                margin: EdgeInsets.only(top: 16),
                child: RaisedButton(
                  color: Colors.green,
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    //call method to log in user
                    if (usernameTextController.text.isNotEmpty &&
                        passwordTextController.text.isNotEmpty) {
                      _logInUser(context);
                    }
                  },
                ),
              ),

              //Log out Button
              Container(
                margin: EdgeInsets.only(top: 8),
                child: RaisedButton(
                  color: Colors.red,
                  child: Text(
                    "Log Out Current Account",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    //call method to log out user
                    _logOutUser(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //method to log in the user
  Future<void> _logInUser(BuildContext context) async {
    var result = await platformChannel.invokeMethod(
      "logInUser",
      <String, dynamic>{
        "username": usernameTextController.text,
        "password": passwordTextController.text
      },
    );

    print("logged in user $result");

    //open event categories widget if user is a volunteer
    if (result == "volunteer") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (buildContext) {
            return EventCategoriesWidget();
          },
        ),
      );
    }

    //open admin panel if user is an admin
    else if (result == "admin") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (buildContext) {
            return AdminPanelWidget();
          },
        ),
      );
    }
  }

  //method to log out user
  Future<void> _logOutUser(BuildContext buildContext) async {
    var result = await platformChannel.invokeMethod("logOutUser");

    //close this screen if user was logged out
    if (result) {
      Navigator.pop(buildContext);
    }
  }
}
