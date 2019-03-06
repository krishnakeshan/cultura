import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import 'package:cultura/model/event_category.dart';
import 'package:cultura/model/event.dart';
import 'package:cultura/list_view_items/event_list_view_item.dart';

class EventCategoriesWidget extends StatefulWidget {
  //Properties

  //Methods
  _EventCategoriesWidgetState createState() {
    return _EventCategoriesWidgetState();
  }
}

class _EventCategoriesWidgetState extends State<EventCategoriesWidget> {
  //Properties
  List<EventCategory> eventCategories = List();
  static const platformChannel = MethodChannel("in.ac.cmrit.cultura/main");

  //Methods
  @override
  void initState() {
    super.initState();

    _getEventCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
              margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 36),
                    child: Text(
                      "Event\nCategories",
                      style: TextStyle(
                        fontFamily: 'MajorMonoDisplay',
                        fontSize: 36,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      itemBuilder: (buildContext, index) {
                        return EventCategoryItem(
                          eventCategory: eventCategories[index],
                        );
                      },
                      itemCount: eventCategories.length,
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

  //method to get event categories
  Future<void> _getEventCategories() async {
    //result contains the event category object maps
    var result = await platformChannel.invokeMethod("getEventCategories");

    //process each category event
    for (var categoryObjectMap in result) {
      print("processing event category");
      EventCategory eventCategory =
          EventCategory.fromMap(map: categoryObjectMap);

      //call setState
      setState(() {
        this.eventCategories.add(eventCategory);
      });
    }
  }
}

class EventCategoryItem extends StatelessWidget {
  //Properties
  final EventCategory eventCategory;

  //Constructors
  EventCategoryItem({this.eventCategory});

  //Methods
  @override
  Widget build(buildContext) {
    return GestureDetector(
      child: Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        elevation: 8,
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Image.network(
                eventCategory.imageURL,
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                alignment: Alignment.center,
                color: Color.fromARGB(150, 0, 0, 0),
                child: Text(
                  eventCategory.name,
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Staatliches',
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
          buildContext,
          MaterialPageRoute(
            builder: (buildContext) {
              return EventListWidget(
                eventCategory: eventCategory,
              );
            },
          ),
        );
      },
    );
  }
}

class EventListWidget extends StatefulWidget {
  //Properties
  final EventCategory eventCategory;

  //Constructors
  EventListWidget({this.eventCategory});

  //Methods
  @override
  _EventListWidgetState createState() {
    return _EventListWidgetState(
      eventCategory: this.eventCategory,
    );
  }
}

class _EventListWidgetState extends State<EventListWidget> {
  //Properties
  bool gotVolunteerMode = false;
  bool volunteerMode = false;
  EventCategory eventCategory;
  List<Event> events = List();
  static const platformChannel = MethodChannel("in.ac.cmrit.cultura/main");

  //Constructors
  _EventListWidgetState({this.eventCategory});

  //Methods
  @override
  void initState() {
    super.initState();

    //get a value for volunteerMode
    _getVolunteerMode();

    //get event objects for this category
    _getEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //Container to give spacing equal to status bar
          Container(
            height: MediaQuery.of(context).padding.top,
          ),
          //Event Category Text Container to give background
          Container(
            margin: EdgeInsets.all(16),
            color: Colors.yellow,
            padding: EdgeInsets.all(8),
            child: Text(
              "${eventCategory.name}\nEvents",
              style: TextStyle(
                fontFamily: 'MajorMonoDisplay',
                fontSize: 36,
              ),
            ),
          ),
          //ListView of events
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: events.length,
              itemBuilder: (buildContext, index) {
                return EventListViewItem(
                  gotVolunteerMode: gotVolunteerMode,
                  volunteerMode: volunteerMode,
                  event: events[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  //method to get event objects for a category
  Future<void> _getEvents() async {
    var eventMaps = await platformChannel.invokeMethod(
      "getEventsForCategory",
      <String, dynamic>{
        "categoryId": eventCategory.objectId,
      },
    );

    for (var eventMap in eventMaps) {
      Event event = Event.fromMap(map: eventMap);

      //call setState
      setState(() {
        this.events.add(event);
      });
    }
  }

  //method to check if a volunteer is logged in or not
  Future<void> _getVolunteerMode() async {
    print("getting volunteer mode");
    var loggedIn = await platformChannel.invokeMethod("getVolunteerMode");
    print("got volunteer mode $loggedIn");

    setState(() {
      this.gotVolunteerMode = true;
      this.volunteerMode = loggedIn;
    });
  }
}
