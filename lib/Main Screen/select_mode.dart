// ignore_for_file: override_on_non_overriding_member

import 'package:chef_connect_india/Helper/model.dart';
import 'package:chef_connect_india/user_portal/user_home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum City { Jaipur, Banglore }

// enum Location1 {
//   banglore,
// }

class Select_mode_new extends StatefulWidget {
  Select_mode_new({Key? key}) : super(key: key);

  @override
  State<Select_mode_new> createState() => _Select_mode_newState();
}

class _Select_mode_newState extends State<Select_mode_new> {
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              Image.asset(
                "assets/CCI.jpg",
                height: double.infinity,
                width: double.infinity,
                scale: 1,
                fit: BoxFit.cover,
              ),
              SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 130,
                      ),
                      Text(
                        'Select City',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          fontSize: 30,
                          backgroundColor: Colors.black.withOpacity(
                            0.5,
                          ),
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      _buildCitySelection(context),
                      SizedBox(
                        height: 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 150,
                            width: 200,
                            decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: InkWell(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Image.asset(
                                    'assets/chefcap.png',
                                    height: 50,
                                    width: 100,
                                    scale: 1,
                                    fit: BoxFit.fitHeight,
                                  ),
                                  Text(
                                    'Party Chef',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w800,
                                      fontSize: 20,
                                    ),
                                  ),
                                  // Icon(
                                  //   Icons.person,
                                  //   size: 30,
                                  // ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'For your Parties or House Events',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        height: 50,
                        width: 250,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            primary: Color.fromARGB(255, 218, 218, 218),
                            side: BorderSide(
                              color: Colors.white70,
                              width: 2.5,
                            ),
                          ),
                          onPressed: () {
                            if (selectedCity == null) {
                              Fluttertoast.showToast(
                                  msg: "Please Select a City to Proceed",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.SNACKBAR,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else {
                              Fluttertoast.showToast(
                                  msg:
                                      "Selected City: ${selectedCity.toString().split('.')[1]}",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.SNACKBAR,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                              postDetailsToFirestore();
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => user_home(),
                                  ),
                                  (route) => false);
                            }
                            // print(selectedCity.toString().split('.')[1]);
                          },
                          child: Text(
                            'Proceed',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Color.fromARGB(255, 18, 68, 138)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // City? selectedCity = City.Banglore;
  City? selectedCity = null;

  @override
  Widget _buildCitySelection(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          //color: Colors.grey,
          height: 150,
          // width: 150,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedCity = City.Jaipur;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: selectedCity == City.Jaipur
                        ? Colors.white70
                        : Colors.white38,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  // height: 200,
                  // width: 150,
                  child: Container(
                      child: _buildAwesome(
                          context,
                          'assets/jaipur_1.png',
                          "Jaipur",
                          selectedCity == City.Jaipur
                              ? Colors.green
                              : Colors.white,
                          selectedCity == City.Jaipur)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedCity = City.Banglore;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: selectedCity == City.Banglore
                        ? Colors.white70
                        : Colors.white38,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                      child: _buildAwesome(
                          context,
                          'assets/banglore_1.png',
                          "Banglore",
                          selectedCity == City.Banglore
                              ? Colors.green
                              : Colors.white,
                          selectedCity == City.Banglore)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget _buildAwesome(BuildContext context, String image, String label,
      Color col, bool selected) {
    return Container(
      height: 150,
      width: 160,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 7.0,
          ),
          Text(
            label,
            style: TextStyle(
                fontSize: 18,
                color: col,
                fontWeight: selected ? FontWeight.bold : FontWeight.w400),
          ),
          SizedBox(
            height: 3.0,
          ),
          Image.asset(
            image,
            height: 119,
            width: 160,
            scale: 1,
            fit: BoxFit.cover,
          )
          // Image(
          //   height: 120,
          //   width: 160,
          //   fit: BoxFit.fitWidth,
          //   image: AssetImage(image),

          // ),
        ],
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
    userModel.selectedLocation = selectedCity.toString().split('.')[1];
    userModel.hiremode = 'Party Chef';

    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection("users");
    return _collectionRef.doc(FirebaseAuth.instance.currentUser!.uid).update({
      'selectedLocation': userModel.selectedLocation,
      'hiremode': userModel.hiremode
    }).then((value) => user_home());
  }
}
