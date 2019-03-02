import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:cultura/model/event.dart';

import 'package:cultura/register_participant.dart';

class EventListViewItem extends StatelessWidget {
  //Properties
  final bool gotVolunteerMode;
  final bool volunteerMode;
  final Event event;
  final MethodChannel platform = MethodChannel("in.ac.cmrit.cultura/main");

  //Constructors
  EventListViewItem({this.gotVolunteerMode, this.volunteerMode, this.event});

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
        //if it's volunteer mode, open registration screen
        if (gotVolunteerMode && volunteerMode) {
          Navigator.push(
            buildContext,
            MaterialPageRoute(
              builder: (buildContext) {
                return RegisterParticipantWidget(
                  event: event,
                );
              },
            ),
          );
        }

        //else open registration web view link
        else if (gotVolunteerMode && !volunteerMode) {
          _openRegistrationLink(
            event.regLink,
          );
        }
      },
    );
  }

  //method to open link
  Future<void> _openRegistrationLink(String link) async {
    await platform.invokeMethod(
      "openRegistrationLink",
      {
        "regLink": link,
      },
    );
  }
}
