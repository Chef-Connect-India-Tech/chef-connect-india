import 'package:chef_connect_india/user_portal/user_home.dart';
import 'package:flutter/material.dart';

class Select_mode_new extends StatefulWidget {
  Select_mode_new({Key? key}) : super(key: key);

  @override
  State<Select_mode_new> createState() => _Select_mode_newState();
}

class _Select_mode_newState extends State<Select_mode_new> {
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.white38,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: InkWell(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Jaipur',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Image.asset(
                                    'assets/jaipur_1.png',
                                    height: 119,
                                    width: 150,
                                    scale: 1,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 150,
                            width: 150,
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
                                  Text(
                                    'Banglore',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Image.asset(
                                    'assets/banglore_1.png',
                                    height: 119,
                                    width: 160,
                                    scale: 1,
                                    fit: BoxFit.fitHeight,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(
                      //   height: 15,
                      // ),
                      // Text(
                      //   'Select Chef Mode',
                      //   style: TextStyle(
                      //     fontFamily: 'Roboto',
                      //     fontWeight: FontWeight.w600,
                      //     color: Colors.white,
                      //     backgroundColor: Colors.black.withOpacity(0.5),
                      //     fontSize: 30,
                      //   ),
                      // ),
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
                          // Text(
                          //   'Special occasions \nshould be savoured \n Book a party chef\n with Chef Connect India ',
                          //   style: TextStyle(
                          //     fontFamily: 'Roboto',
                          //     fontSize: 15,
                          //     backgroundColor: Colors.black.withOpacity(
                          //       0.5,
                          //     ),
                          //     color: Colors.white,
                          //     fontWeight: FontWeight.w500,
                          //   ),
                          // )
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
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => user_home(),
                                ),
                                (route) => false);
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
}
