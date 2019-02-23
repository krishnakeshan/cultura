import 'package:flutter/material.dart';

class AdminPanelWidget extends StatefulWidget {
  @override
  _AdminPanelWidgetState createState() {
    return _AdminPanelWidgetState();
  }
}

class _AdminPanelWidgetState extends State<AdminPanelWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Panel"),
        centerTitle: true,
      ),
    );
  }
}
