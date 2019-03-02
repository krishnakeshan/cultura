import 'package:flutter/material.dart';

class QRCodesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Select Payment Method",
        ),
      ),
      body: DefaultTabController(
        child: Column(
          children: <Widget>[
            //Tab Bar
            TabBar(
              tabs: <Widget>[
                Tab(
                  text: "UPI",
                ),
                Tab(
                  text: "Paytm",
                ),
              ],
            ),

            //TabBarView
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  Image.network(
                    "https://bit.ly/2LmfkUq",
                    height: 300,
                    width: 300,
                  ),
                  Image.network(
                    "https://bit.ly/2LmfkUq",
                    height: 300,
                    width: 300,
                  ),
                ],
              ),
            ),
          ],
        ),
        length: 2,
      ),
    );
  }
}
