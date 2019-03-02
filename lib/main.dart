import 'package:flutter/material.dart';

import 'package:cultura/volunteer_login.dart';
import 'package:cultura/event_list.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cultura 2019',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  //Methods
  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  //Properties
  PageController pageController;

  //Methods
  @override
  void initState() {
    super.initState();

    //initialize page view
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();

    //dispose page controller
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorObjects.lightBackground,
      body: Container(
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Image.asset(
                "assets/background.png",
                fit: BoxFit.none,
                repeat: ImageRepeat.repeat,
              ),
            ),
            Positioned.fill(
              child: Container(
                child: PageView(
                  controller: pageController,
                  children: _getMainMenuItems(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //method to get list of main menu items
  List<Widget> _getMainMenuItems() {
    List<Widget> widgets = List();

    //create first widget which is welcome widget
    Widget welcomeWidget = Builder(
      builder: (buildContext) {
        return GestureDetector(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 8,
            margin: EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 50,
            ),
            color: Colors.yellow,
            child: Container(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(50),
                      child: Text(
                        "Welcome\nto\nCultura\n2019",
                        style: TextStyle(
                          fontFamily: 'MajorMonoDisplay',
                          fontSize: 36,
                          color: ColorObjects.primaryDark,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  //Swipe To Explore Button
                  GestureDetector(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 24),
                      child: Card(
                        elevation: 8,
                        color: ColorObjects.primaryDark,
                        shape: StadiumBorder(),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                "Swipe to Explore",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 4),
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      print("calling onTap");
                      pageController.animateToPage(
                        2,
                        curve: Curves.elasticIn,
                        duration: Duration(
                          seconds: 1,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          onDoubleTap: () {
            Navigator.push(
              buildContext,
              MaterialPageRoute(
                builder: (buildContext) {
                  return VolunteerLoginWidget();
                },
              ),
            );
          },
        );
      },
    );

    //Headliners Widget
    Widget headlinersWidget = Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 8,
      margin: EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 50,
      ),
      color: Colors.yellow,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 8,
                margin: EdgeInsets.all(24),
                child: Image.asset(
                  "assets/headliners.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              flex: 2,
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "HEADLINERS",
                          style: TextStyle(
                            fontFamily: 'Staatliches',
                            fontSize: 28,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 24),
                      child: Text(
                        "tap to know more",
                        style: TextStyle(
                          fontFamily: 'Staatliches',
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              flex: 1,
            ),
          ],
        ),
      ),
    );

    //Events Widget
    Widget eventsWidget = Builder(
      builder: (buildContext) {
        return GestureDetector(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 8,
            margin: EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 50,
            ),
            color: Colors.yellow,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 8,
                      margin: EdgeInsets.all(24),
                      child: Image.asset(
                        "assets/events.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    flex: 2,
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                "EVENTS",
                                style: TextStyle(
                                  fontFamily: 'Staatliches',
                                  fontSize: 28,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 24),
                            child: Text(
                              "tap to know more",
                              style: TextStyle(
                                fontFamily: 'Staatliches',
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    flex: 1,
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            //open event list widget
            Navigator.push(
              buildContext,
              MaterialPageRoute(
                builder: (buildContext) {
                  return EventCategoriesWidget();
                },
              ),
            );
          },
        );
      },
    );

    //Sponsors Widget
    Widget sponsorsWidget = Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 8,
      margin: EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 50,
      ),
      color: Colors.yellow,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Icon(
                Icons.monetization_on,
                size: 128,
                color: ColorObjects.primaryDark,
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "Sponsors",
                  style: TextStyle(
                    fontFamily: 'Staatliches',
                    fontSize: 28,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    //About Widget
    Widget aboutWidget = Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 8,
      margin: EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 50,
      ),
      color: Colors.yellow,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Icon(
                Icons.info,
                size: 128,
                color: ColorObjects.primaryDark,
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "About Cultura",
                  style: TextStyle(
                    fontFamily: 'Staatliches',
                    fontSize: 28,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    //add all created widgets to list
    widgets.add(welcomeWidget);
    widgets.add(headlinersWidget);
    widgets.add(eventsWidget);
    widgets.add(sponsorsWidget);
    widgets.add(aboutWidget);

    //return list of widgets
    return widgets;
  }
}

class ColorObjects {
  static const primaryYellow = Color.fromARGB(255, 255, 255, 0);
  static const primaryDark = Color.fromARGB(255, 12, 12, 0);
  static const secondaryDark = Color.fromARGB(255, 67, 87, 113);
  static const primaryLight = Color.fromARGB(255, 186, 194, 200);
  static const secondaryLight = Color.fromARGB(255, 99, 121, 141);
  static const lightBackground = Color.fromARGB(255, 235, 245, 245);
}
