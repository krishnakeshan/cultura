import 'package:flutter/material.dart';

import 'main.dart';

class AboutCulturaWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "About Cultura",
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          //Text View for Cultura Description
          Container(
            color: Color.fromARGB(255, 245, 245, 245),
            padding: EdgeInsets.all(32),
            child: Text(
              getCulturaDescription(),
              style: TextStyle(
                fontFamily: "JuliusSansOne",
                fontSize: 16,
              ),
            ),
          ),

          //Meet The Team Title
          Container(
            margin: EdgeInsets.only(top: 32),
            child: Text(
              "Meet the App Team",
              style: TextStyle(
                fontSize: 24,
                fontFamily: "Staatliches",
              ),
              textAlign: TextAlign.center,
            ),
          ),

          //Small Divider
          Divider(
            height: 40,
          ),

          //Align For Team Mate Image
          Align(
            child: ClipOval(
              child: Image.network(
                "https://crypticsocket.github.io/Cultura19/pics/Kaiwalya(APP%20TEAM).jpg",
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
          ),

          //Text for Team Mate name
          Container(
            margin: EdgeInsets.only(top: 16),
            child: Text(
              "Kaiwalya",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: "JuliusSansOne",
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          //Container for Team Mate Description
          Container(
            margin: EdgeInsets.only(top: 8),
            child: Text(
              "Backend Developer",
              style: TextStyle(
                fontSize: 12,
                color: Colors.blueGrey,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          //Small Divider
          Divider(
            height: 40,
          ),

          //Align For Team Mate Image
          Align(
            child: ClipOval(
              child: Image.network(
                "https://crypticsocket.github.io/Cultura19/pics/SAIPRIYA(APP%20TEAM)2.jpg",
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
          ),

          //Text for Team Mate name
          Container(
            margin: EdgeInsets.only(top: 16),
            child: Text(
              "Sai Priya",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: "JuliusSansOne",
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          //Container for Team Mate Description
          Container(
            margin: EdgeInsets.only(top: 8),
            child: Text(
              "UI/UX Design",
              style: TextStyle(
                fontSize: 12,
                color: Colors.blueGrey,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          //Small Divider
          Divider(
            height: 40,
          ),

          //Align For Team Mate Image
          Align(
            child: ClipOval(
              child: Image.network(
                "https://crypticsocket.github.io/Cultura19/pics/DYLAN(APP%20TEAM).jpg",
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
          ),

          //Text for Team Mate name
          Container(
            margin: EdgeInsets.only(top: 16),
            child: Text(
              "Dylan",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: "JuliusSansOne",
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          //Container for Team Mate Description
          Container(
            margin: EdgeInsets.only(top: 8),
            child: Text(
              "Android Engineer",
              style: TextStyle(
                fontSize: 12,
                color: Colors.blueGrey,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          //Small Divider
          Divider(
            height: 40,
          ),

          //Align For Team Mate Image
          Align(
            child: ClipOval(
              child: Image.network(
                "https://crypticsocket.github.io/Cultura19/pics/HARSHIT(APP%20TEAM)2.jpg",
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
          ),

          //Text for Team Mate name
          Container(
            margin: EdgeInsets.only(top: 16),
            child: Text(
              "Harshit",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: "JuliusSansOne",
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          //Container for Team Mate Description
          Container(
            margin: EdgeInsets.only(top: 8),
            child: Text(
              "Backend Developer",
              style: TextStyle(
                fontSize: 12,
                color: Colors.blueGrey,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          //Small Divider
          Divider(
            height: 40,
          ),

          //Align For Team Mate Image
          Align(
            child: ClipOval(
              child: Image.network(
                "https://crypticsocket.github.io/Cultura19/pics/KRISHNA(APP%20TEAM)2.jpg",
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
          ),

          //Text for Team Mate name
          Container(
            margin: EdgeInsets.only(top: 16),
            child: Text(
              "Krishna",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: "JuliusSansOne",
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          //Container for Team Mate Description
          Container(
            margin: EdgeInsets.only(top: 8, bottom: 20),
            child: Text(
              "Lead Developer\n(APP TEAM)",
              style: TextStyle(
                fontSize: 12,
                color: Colors.blueGrey,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          //Small Divider
          Divider(),

          //Meet The Team Title
          Container(
            margin: EdgeInsets.only(top: 24),
            child: Text(
              "Meet the Web Team",
              style: TextStyle(
                fontSize: 24,
                fontFamily: "Staatliches",
              ),
              textAlign: TextAlign.center,
            ),
          ),

          //Small Divider
          Divider(
            height: 40,
            color: Colors.transparent,
          ),

          //Align For Team Mate Image
          Align(
            child: ClipOval(
              child: Image.network(
                "https://crypticsocket.github.io/Cultura19/pics/SAKET(WEB%20TEAM).jpg",
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
          ),

          //Text for Team Mate name
          Container(
            margin: EdgeInsets.only(top: 16),
            child: Text(
              "Saket",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: "JuliusSansOne",
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          //Container for Team Mate Description
          Container(
            margin: EdgeInsets.only(top: 8),
            child: Text(
              "Lead Web Dev",
              style: TextStyle(
                fontSize: 12,
                color: Colors.blueGrey,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          //Small Divider
          Divider(
            height: 40,
          ),

          Align(
            child: ClipOval(
              child: Image.network(
                "https://crypticsocket.github.io/Cultura19/pics/DIP(WEB%20TEAM).jpg",
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
          ),

          //Text for Team Mate name
          Container(
            margin: EdgeInsets.only(top: 16),
            child: Text(
              "Dip",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: "JuliusSansOne",
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          //Container for Team Mate Description
          Container(
            margin: EdgeInsets.only(top: 8),
            child: Text(
              "Web Dev",
              style: TextStyle(
                fontSize: 12,
                color: Colors.blueGrey,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          //Small Divider
          Divider(
            height: 40,
          ),

          Align(
            child: ClipOval(
              child: Image.network(
                "https://crypticsocket.github.io/Cultura19/pics/GAUTHAM(WEB%20TEAM).jpg",
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
          ),

          //Text for Team Mate name
          Container(
            margin: EdgeInsets.only(top: 16),
            child: Text(
              "Gautham",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: "JuliusSansOne",
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          //Container for Team Mate Description
          Container(
            margin: EdgeInsets.only(top: 8),
            child: Text(
              "Web Dev",
              style: TextStyle(
                fontSize: 12,
                color: Colors.blueGrey,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          //Small Divider
          Divider(
            height: 40,
          ),

          Container(
            margin: EdgeInsets.only(top: 16, bottom: 24),
            child: Text(
              "She Does Something",
              style: TextStyle(
                fontSize: 24,
                fontFamily: "Staatliches",
              ),
              textAlign: TextAlign.center,
            ),
          ),

          Align(
            child: ClipOval(
              child: Image.network(
                "https://crypticsocket.github.io/Cultura19/pics/CHANDRAMA(OC)2.jpg",
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
          ),

          //Text for Team Mate name
          Container(
            margin: EdgeInsets.only(top: 16),
            child: Text(
              "Moon",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: "JuliusSansOne",
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          //Container for Team Mate Description
          Container(
            margin: EdgeInsets.only(top: 8),
            child: Text(
              "Tech. Sec.",
              style: TextStyle(
                fontSize: 12,
                color: Colors.blueGrey,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          //Small Divider
          Divider(
            height: 40,
            color: Colors.transparent,
          ),
        ],
      ),
    );
  }

  //method to get description string for cultura
  String getCulturaDescription() {
    return "The annual inter-collegiate-techno-cultural fest of CMRIT stands out for the past 11 years in showcasing it's skills, talents and charisma.\n\nThe two days of Cultura are more than just a festival, it is an experience beyond words. From our high-spirited pro nights to our action packed events, Cultura has it all !!\n\nCultura caters to every talent and has reached a milestone in celebrating a wide variety of interests.\n\nCome break the illusion !";
  }
}
