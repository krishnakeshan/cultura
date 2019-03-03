import 'package:flutter/material.dart';

import 'package:cultura/model/sponsor.dart';

class SponsorListViewItem extends StatelessWidget {
  //Properties
  final Sponsor sponsor;

  //Constructors
  SponsorListViewItem({this.sponsor});

  //Methods
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          //Sponsor Logo Image
          Image.network(
            sponsor.imageURL,
            height: 50,
            width: 50,
            fit: BoxFit.cover,
          ),

          //Sponsor Name Text
          Container(
            margin: EdgeInsets.only(top: 12),
            child: Text(
              sponsor.name,
            ),
          ),
        ],
      ),
    );
  }
}
