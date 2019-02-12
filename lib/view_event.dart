import 'package:flutter/material.dart';

import 'package:cultura/main.dart';

class ViewEventWidget extends StatefulWidget {
  @override
  _ViewEventWidget createState() {
    return _ViewEventWidget();
  }
}

class _ViewEventWidget extends State<ViewEventWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Positioned Widget for background
          // Positioned.fill(
          //   child: Container(
          //     color: Color.fromARGB(100, 255, 255, 255),
          //     child: Image.asset(
          //       "assets/background.png",
          //       fit: BoxFit.cover,
          //       repeat: ImageRepeat.repeat,
          //     ),
          //   ),
          // ),
          // Positioned Widget for Main Body
          Positioned.fill(
            child: Container(
              //Main Container for Status Bar Offset padding
              margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: ListView(
                padding: EdgeInsets.only(bottom: 8),
                children: <Widget>[
                  //Card View for Event Image
                  Card(
                    margin: EdgeInsets.zero,
                    elevation: 8,
                    child: Image.network(
                      "https://cdn.pixabay.com/photo/2018/06/30/09/29/music-3507317_960_720.jpg",
                      fit: BoxFit.cover,
                      height: 250,
                    ),
                  ),
                  //Event Name Text Container
                  Container(
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    color: ColorObjects.primaryDark,
                    //Event Name Text
                    child: Text(
                      "Improv",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Staatliches',
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Divider(
                    color: ColorObjects.primaryDark,
                    height: 0,
                    indent: 16,
                  ),
                  //Event Description Container
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    padding: EdgeInsets.all(16),
                    color: ColorObjects.primaryDark,
                    child: Text(
                      "The participants will be given a topic on the spot she will have to pull out an act accordingly. The judgement will be based on spontaneity, sense of humor on the stage and stage presence.",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'JuliusSansOne',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Divider(
                    height: 48,
                  ),
                  //Venue Title Container
                  Container(
                    margin: EdgeInsets.only(left: 16, right: 16),
                    child: Text(
                      "Venue:",
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  //Venue Text Container
                  Container(
                    margin: EdgeInsets.only(
                      top: 8,
                      left: 16,
                      right: 16,
                    ),
                    child: Text(
                      "Old CDX",
                      style: TextStyle(
                        fontFamily: 'Staatliches',
                        fontSize: 20,
                      ),
                    ),
                  ),
                  //Date and Time Title Container
                  Container(
                    margin: EdgeInsets.only(top: 16, left: 16, right: 16),
                    child: Text(
                      "Date and Time:",
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  //Date and Time Text Container
                  Container(
                    margin: EdgeInsets.only(
                      top: 8,
                      left: 16,
                      right: 16,
                    ),
                    child: Text(
                      "14th Feb, 6 PM",
                      style: TextStyle(
                        fontFamily: 'Staatliches',
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Divider(
                    height: 36,
                  ),
                  //Event Co-Ordinators Title Container
                  Container(
                    margin: EdgeInsets.only(left: 16, right: 16),
                    child: Text(
                      "Event Co-ordinators:",
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  //First EC Container
                  Container(
                    margin: EdgeInsets.fromLTRB(16, 8, 16, 0),
                    child: Text(
                      "Mike Tyson (+911)",
                      style: TextStyle(
                        fontFamily: 'Staatliches',
                        fontSize: 20,
                      ),
                    ),
                  ),
                  //Second EC Container
                  Container(
                    margin: EdgeInsets.fromLTRB(16, 8, 16, 0),
                    child: Text(
                      "Osama Yomama (+811)",
                      style: TextStyle(
                        fontFamily: 'Staatliches',
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Divider(
                    color: ColorObjects.primaryDark,
                    height: 24,
                  ),
                  //Register Button
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: RaisedButton.icon(
                      color: ColorObjects.primaryDark,
                      label: Text(
                        "Register",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      icon: Icon(
                        Icons.chrome_reader_mode,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
