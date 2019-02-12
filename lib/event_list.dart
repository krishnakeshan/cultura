import 'package:flutter/material.dart';

import 'package:cultura/list_view_items/event_list_view_item.dart';

class EventCategoriesWidget extends StatefulWidget {
  _EventCategoriesWidgetState createState() {
    return _EventCategoriesWidgetState();
  }
}

class _EventCategoriesWidgetState extends State<EventCategoriesWidget> {
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
                    child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      padding: EdgeInsets.zero,
                      children: <Widget>[
                        EventCategoryItem(),
                        EventCategoryItem(),
                        EventCategoryItem(),
                        EventCategoryItem(),
                        EventCategoryItem(),
                        EventCategoryItem(),
                        EventCategoryItem(),
                        EventCategoryItem(),
                      ],
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

class EventCategoryItem extends StatelessWidget {
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
                "https://cdn.pixabay.com/photo/2017/08/01/14/51/concert-2566002_960_720.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                alignment: Alignment.center,
                color: Color.fromARGB(150, 0, 0, 0),
                child: Text(
                  "Theatre",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Staatliches',
                    fontSize: 26,
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
              return EventListWidget();
            },
          ),
        );
      },
    );
  }
}

class EventListWidget extends StatefulWidget {
  @override
  _EventListWidgetState createState() {
    return _EventListWidgetState();
  }
}

class _EventListWidgetState extends State<EventListWidget> {
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
              "Art\nEvents",
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
              itemCount: 10,
              itemBuilder: (buildContext, index) {
                return EventListViewItem();
              },
            ),
          ),
        ],
      ),
    );
  }
}
