import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

import 'main.dart';

class HeadlinerScreen extends StatefulWidget {
  @override
  _HeadlinerScreenState createState() {
    return _HeadlinerScreenState();
  }
}

class _HeadlinerScreenState extends State<HeadlinerScreen> {
  //Properties
  bool showFirst = true;
  Timer _timer;

  MethodChannel platformChannel = MethodChannel("in.ac.cmrit.cultura/main");

  //Methods
  @override
  void initState() {
    super.initState();

    //initialize timer
    _timer = Timer.periodic(
      Duration(
        seconds: 4,
      ),
      (timer) {
        //call setState
        setState(() {
          showFirst = !showFirst;
        });
      },
    );
  }

  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          //Image View For Backgronud
          Positioned.fill(
            child: Image.asset(
              "assets/dark_background.png",
              fit: BoxFit.none,
              repeat: ImageRepeat.repeat,
            ),
          ),

          //Main List View
          Positioned.fill(
            child: ListView(
              children: <Widget>[
                //Container for Notif Bar Padding
                // Container(
                //   color: Colors.white,
                //   height: MediaQuery.of(buildContext).padding.top,
                // ),

                //Little Back Button
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.only(top: 16, left: 16),
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(buildContext);
                  },
                ),

                //Card for Image
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 32, vertical: 18),
                  child: AnimatedCrossFade(
                    firstChild: Container(
                      height: 500,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        clipBehavior: Clip.antiAlias,
                        color: Colors.transparent,
                        elevation: 16,
                        child: Image.asset(
                          "assets/mbo_front.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    secondChild: Container(
                      height: 500,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        clipBehavior: Clip.antiAlias,
                        color: Colors.transparent,
                        elevation: 16,
                        child: Image.asset(
                          "assets/mbo_side.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    duration: Duration(
                      milliseconds: 600,
                    ),
                    crossFadeState: showFirst
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                  ),
                ),

                //Artist Name Text
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.yellow,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  margin: EdgeInsets.only(top: 16, left: 32, right: 32),
                  child: Text(
                    "Mariana Bo",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 32,
                      fontFamily: "JuliusSansOne",
                    ),
                  ),
                ),

                //Event Date Text
                Container(
                  margin: EdgeInsets.only(left: 32, right: 32, top: 32),
                  child: Text(
                    "March 23",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: "JuliusSansOne",
                    ),
                  ),
                ),

                //Sunburn Campus Logo
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 32),
                  child: Image.asset(
                    "assets/sb_campus_logo.png",
                  ),
                ),

                // //Chorus Logo
                // Container(
                //   margin: EdgeInsets.only(left: 32, right: 32),
                //   child: Image.asset(
                //     "assets/chorus_logo.png",
                //   ),
                // ),

                //Elements Logo
                Container(
                  margin: EdgeInsets.only(left: 32, right: 32),
                  child: Image.asset(
                    "assets/elements_logo.png",
                  ),
                ),

                //Buy Tickets Button
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                    color: Colors.yellow,
                    margin: EdgeInsets.only(
                        left: 32, right: 32, bottom: 32, top: 32),
                    alignment: Alignment.center,
                    child: Text(
                      "BUY PASSES",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: "JuliusSansOne",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  onTap: () {
                    //open registration link
                    platformChannel.invokeMethod("openHeadlinerLink");
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
