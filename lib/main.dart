import 'package:flutter/material.dart';

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
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        //Container to give main list view a top margin
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: PageView(
          //main list view
          children: <Widget>[
            MainCategoryListViewItem(),
            MainCategoryListViewItem(),
            MainCategoryListViewItem(),
            MainCategoryListViewItem(),
          ],
        ),
      ),
    );
  }
}

class MainCategoryListViewItem extends StatelessWidget {
  //Methods
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(48),
      color: ColorObjects.primaryYellow,
    );
  }
}

class ColorObjects {
  static const primaryYellow = Color.fromARGB(255, 255, 255, 0);
}
