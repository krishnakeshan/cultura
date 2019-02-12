import 'package:flutter/material.dart';

import 'package:cultura/view_event.dart';

class EventListViewItem extends StatelessWidget {
  @override
  Widget build(buildContext) {
    return GestureDetector(
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            //Main Column to contain title and description
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //Event Title Text
              Text(
                "Improv",
                style: TextStyle(
                  fontFamily: 'Staatliches',
                  fontSize: 18,
                ),
              ),
              //Event Description Container
              Container(
                margin: EdgeInsets.only(top: 4),
                child: Text(
                  //Event Description Text
                  "There is nothing like preparation",
                  style: TextStyle(color: Colors.blueGrey),
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        //open ViewEventWidget
        Navigator.push(
          buildContext,
          MaterialPageRoute(
            builder: (buildContext) {
              return ViewEventWidget();
            },
          ),
        );
      },
    );
  }
}
