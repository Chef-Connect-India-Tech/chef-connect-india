// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:glass_morphism/home.dart';
import 'package:glass_morphism/roles/user/user_home.dart';
import 'package:glassmorphism/glassmorphism.dart';

class Select_Mode extends StatefulWidget {
  const Select_Mode({Key? key}) : super(key: key);

  @override
  _Select_ModeState createState() => _Select_ModeState();
}

class CityList {
  String city;
  int index;
  Icon icon;
  CityList({required this.city, required this.index, required this.icon});
}

class ChefList {
  String chef;
  int index;
  Icon icon;
  ChefList({required this.chef, required this.index, required this.icon});
}

class _Select_ModeState extends State<Select_Mode> {
  String uid = "";
  String cityholder = '';
  String chefholder = '';
  int cityin = 0;
  int chef_type = 0;
  List<ChefList> chefList = [
    ChefList(
      chef: 'Party Chef',
      index: 1,
      icon: Icon(Icons.person),
    ),
    ChefList(
      chef: 'Private Chef',
      index: 2,
      icon: Icon(Icons.person),
    ),
    ChefList(
      chef: 'Kitchen Professional',
      index: 3,
      icon: Icon(Icons.person),
    ),
  ];
  List<CityList> cityList = [
    CityList(
      city: 'Banglore',
      index: 1,
      icon: Icon(Icons.location_city_outlined),
    ),
    CityList(
      city: 'Jaipur',
      index: 2,
      icon: Icon(Icons.location_city_outlined),
    ),
  ];
  Widget customRadio(
    String text,
    int index,
    IconData icon,
  ) {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(20.0),
      height: 150,
      width: 150,
      child: ElevatedButton(
          onPressed: () {
            setState(() {
              cityin = index;
              cityholder = text;
            });
          },
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              icon,
              size: 30.0,
              color: (cityin == index)
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
                  color: (cityin == index)
                      ? Color.fromARGB(255, 18, 68, 138)
                      : Colors.black),
            ),
          ]),
          style: ElevatedButton.styleFrom(
            primary: (cityin == index) ? Color(0xFFC4C4C4) : Colors.white54,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            side: BorderSide(
              width: 2,
              color: (cityin == index) ? Colors.white : Colors.black26,
            ),
            padding: EdgeInsets.all(5.0),
          )),
    );
  }

  Widget custRadio(String text, int index, IconData icon) {
    return Container(
      margin: EdgeInsets.all(4.0),
      padding: EdgeInsets.all(4.0),
      height: 100,
      width: 100,
      child: ElevatedButton(
          onPressed: () {
            setState(() {
              chef_type = index;
              chefholder = text;
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
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                              child: Container(
                            // height: 350.0,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: cityList
                                    .map((data) => customRadio(
                                          data.city,
                                          data.index,
                                          Icons.location_city_outlined,
                                        ))
                                    .toList()),
                          )),
                        ]),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Looking For",
                      style: TextStyle(
                        color: Color.fromARGB(255, 18, 68, 138),
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                              child: Container(
                            // height: 350.0,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: chefList
                                    .map((data) => custRadio(
                                          data.chef,
                                          data.index,
                                          Icons.person,
                                        ))
                                    .toList()),
                          ))
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
                          print('city name is:${cityholder}');
                          print('city name is:${chefholder}');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => user_home(
                                    // city: cityholder, hiremode: chefholder
                                    ),
                              ));
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
