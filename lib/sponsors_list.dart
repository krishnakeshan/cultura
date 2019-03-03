import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:async';

import 'package:cultura/list_view_items/sponsor_list_view_item.dart';

import 'package:cultura/model/sponsor.dart';

class SponsorsListScreen extends StatefulWidget {
  @override
  _SponsorsListScreenState createState() {
    return _SponsorsListScreenState();
  }
}

class _SponsorsListScreenState extends State<SponsorsListScreen> {
  //Properties
  List<Sponsor> sponsors = List();

  MethodChannel platformChannel = MethodChannel("in.ac.cmrit.cultura/main");

  //Methods
  @override
  void initState() {
    super.initState();

    //get sponsors list
    _getSponsors();
  }

  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text("Sponsors"),
        centerTitle: true,
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return Container(
            height: 1,
            margin: EdgeInsets.symmetric(vertical: 16),
            color: Colors.blueGrey,
          );
        },
        itemBuilder: (context, index) {
          return SponsorListViewItem(
            sponsor: sponsors[index],
          );
        },
        itemCount: sponsors.length,
      ),
    );
  }

  //method to get list of sponsors
  Future<void> _getSponsors() async {
    var result = await platformChannel.invokeListMethod("getSponsors");

    //add each item to list
    List<Sponsor> newSponsors = List();
    for (var map in result) {
      Sponsor sponsor = Sponsor.fromMap(map);
      newSponsors.add(sponsor);
    }

    //call setState
    if (mounted) {
      setState(() {
        sponsors = newSponsors;
      });
    }
  }
}
