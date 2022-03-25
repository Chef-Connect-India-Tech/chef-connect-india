// ignore_for_file: deprecated_member_use

import 'package:chef_connect_india/Helper/model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:chef_connect_india/home.dart';
import 'package:chef_connect_india/roles/user/user_home.dart';
import 'package:glassmorphism/glassmorphism.dart';

class Select_Mode extends StatefulWidget {
  const Select_Mode({Key? key}) : super(key: key);

  @override
  _Select_ModeState createState() => _Select_ModeState();
}

class CityList {
  String city;
  int index;
  ImageIcon icon;
  CityList({required this.city, required this.index, required this.icon});
}

class ChefList {
  String chef;
  int index;
  Icon icon;
  ChefList({required this.chef, required this.index, required this.icon});
}

class _Select_ModeState extends State<Select_Mode> {
  final _auth = FirebaseAuth.instance;
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
      icon: ImageIcon(AssetImage('assets/icons/Banglore.svg')),
    ),
    CityList(
      city: 'Jaipur',
      index: 2,
      icon: ImageIcon(AssetImage('assets/icons/Jaipur.svg')),
    ),
  ];

  Widget customRadio(
    String text,
    int index,
    IconData icon,
  ) {
    return Container(
      // margin: EdgeInsets.all(2.0),
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
      // margin: EdgeInsets.all(4.0),
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
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 80),
                    child: Center(
                      child: GlassmorphicContainer(
                        width: 330,
                        height: 500,
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
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Select City",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 18, 68, 138),
                                  fontSize: 30,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                        child: Container(
                                      // height: 350.0,
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: cityList
                                              .map((data) => customRadio(
                                                    data.city,
                                                    data.index,
                                                    Icons
                                                        .location_city_outlined,
                                                  ))
                                              .toList()),
                                    )),
                                  ]),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Looking For",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 18, 68, 138),
                                  fontSize: 30,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                        child: Container(
                                      // height: 350.0,
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                height: 30,
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
                                    postDetailsToFirestore();
                                    Navigator.pushAndRemoveUntil(
                                        (context),
                                        MaterialPageRoute(
                                          builder: (context) => user_home(),
                                        ),
                                        (route) => false);
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
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.uid = user!.uid;
    userModel.selectedLocation = cityholder;
    userModel.hiremode = chefholder;

    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection("users");
    return _collectionRef.doc(FirebaseAuth.instance.currentUser!.uid).update({
      'selectedLocation': userModel.selectedLocation,
      'hiremode': userModel.hiremode
    }).then((value) => user_home());
  }
}
