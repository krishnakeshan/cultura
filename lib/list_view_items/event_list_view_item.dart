import 'package:flutter/material.dart';

import 'package:cultura/model/event.dart';

import 'package:cultura/view_event.dart';

class EventListViewItem extends StatelessWidget {
  //Properties
  final Event event;

  //Constructors
  EventListViewItem({this.event});

  //Methods
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
                event.name,
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
                  event.description,
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
              return ViewEventWidget(
                event: event,
              );
            },
          ),
        );
      },
    );
  }
}
