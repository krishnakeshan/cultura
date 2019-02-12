import 'package:flutter/material.dart';

class VolunteerLoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Volunteer Login",
        ),
      ),
      body: Scaffold(
        body: Center(
          child: Container(
            padding: EdgeInsets.all(36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    hintText: "username",
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "password",
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: RaisedButton(
                    child: Text("Login"),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
