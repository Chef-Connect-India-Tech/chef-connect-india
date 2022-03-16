// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String uid = "";
  int city = 0;
  int chef_type = 0;

  Widget customRadio(IconData icon, String text, int index) {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(20.0),
      height: 150,
      width: 150,
      child: ElevatedButton(
          onPressed: () {
            setState(() {
              city = index;
            });
          },
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              icon,
              size: 30.0,
              color: (city == index)
                  ? Color.fromARGB(255, 18, 68, 138)
                  : Colors.black,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: (city == index)
                      ? Color.fromARGB(255, 18, 68, 138)
                      : Colors.black),
            ),
          ]),
          style: ElevatedButton.styleFrom(
            primary: (city == index) ? Color(0xFFC4C4C4) : Colors.white54,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            side: BorderSide(
              width: 2,
              color: (city == index) ? Colors.white : Colors.black26,
            ),
            padding: EdgeInsets.all(5.0),
          )),
    );
  }

  Widget custRadio(IconData icon, String text, int index) {
    return Container(
      margin: EdgeInsets.all(4.0),
      padding: EdgeInsets.all(4.0),
      height: 100,
      width: 100,
      child: ElevatedButton(
          onPressed: () {
            setState(() {
              chef_type = index;
            });
          },
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              icon,
              size: 20.0,
              color: (chef_type == index)
                  ? Color.fromARGB(255, 18, 68, 138)
                  : Colors.black,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: (chef_type == index)
                      ? Color.fromARGB(255, 18, 68, 138)
                      : Colors.black),
            ),
          ]),
          style: ElevatedButton.styleFrom(
            primary: (chef_type == index) ? Color(0xFFC4C4C4) : Colors.white54,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            side: BorderSide(
              width: 2,
              color: (chef_type == index) ? Colors.white : Colors.black26,
            ),
            padding: EdgeInsets.all(5.0),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Image.asset(
              "assets/CCI.jpg",
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              scale: 1,
            ),
            SafeArea(
              child: Center(
                child: GlassmorphicContainer(
                  width: 330,
                  height: 620,
                  borderRadius: 10,
                  blur: 0.1,
                  alignment: Alignment.bottomCenter,
                  border: 0,
                  linearGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFffffff).withOpacity(0.5),
                        Color(0xFFFFFFFF).withOpacity(0.5),
                      ],
                      stops: [
                        0.1,
                        1,
                      ]),
                  borderGradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFffffff).withOpacity(1.0),
                      Color((0xFFFFFFFF)).withOpacity(1.0),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 180,
                    ),
                    Text(
                      "Select City",
                      style: TextStyle(
                        color: Color.fromARGB(255, 18, 68, 138),
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      customRadio(Icons.location_city_outlined, "Banglore", 1),
                      customRadio(Icons.local_airport_sharp, "Jaipur", 2),
                    ]),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Select Hire Mode",
                      style: TextStyle(
                        color: Color.fromARGB(255, 18, 68, 138),
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      custRadio(Icons.person, "Private\nChef", 1),
                      custRadio(Icons.person, "Party\nChef", 2),
                      custRadio(Icons.person, "Permanent\nChef", 3),
                    ]),
                    SizedBox(
                      height: 60,
                    ),
                    SizedBox(
                      height: 50,
                      width: 250,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.white,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          primary: Colors.white54,
                          onPrimary: Color.fromARGB(255, 18, 68, 138),
                        ),
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => USer_login(),
                          //   ),
                          // );
                        },
                        child: Text(
                          'Proceed',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
