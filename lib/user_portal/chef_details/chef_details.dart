// ignore_for_file: must_be_immutable

import 'package:chef_connect_india/user_portal/chef_details/menu/customiseduser.dart';
import 'package:chef_connect_india/user_portal/chef_details/menu/menu.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class chef_pro extends StatelessWidget {
  String chefid;
  String cheflevel;
  String experience;
  String cuisine;
  String city;
  String profilepic;
  String specialities;
  String rating;
  String cid;

  chef_pro({
    Key? key,
    required this.chefid,
    required this.cheflevel,
    required this.experience,
    required this.cuisine,
    required this.city,
    required this.profilepic,
    required this.rating,
    required this.specialities,
    required this.cid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String cuisine_exp =
        cuisine.replaceAll(new RegExp(r"\p{P}", unicode: true), "");
    return Scaffold(
      //drawer: NavBar(),
      appBar: AppBar(title: Text('Chef Details')),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment(0.0, -0.88),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  SizedBox(
                    width: 370.0,
                    height: 235.0,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: <Widget>[
                        SizedBox(
                          width: 370.0,
                          height: 235.0,
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: <Widget>[
                              Positioned(
                                bottom: 0,
                                child: Container(
                                  width: 370.0,
                                  height: 181.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(38.0),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.16),
                                        offset: Offset(0, 3.0),
                                        blurRadius: 12.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: 110.0,
                                height: 115.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.elliptical(55.0, 57.5)),
                                  image: DecorationImage(
                                    image: NetworkImage('${profilepic}'),
                                    fit: BoxFit.contain,
                                  ),
                                  border: Border.all(
                                    width: 3.0,
                                    color: Colors.indigo,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 89.0,
                          child: Text(
                            'username: ${chefid}',
                            style: GoogleFonts.roboto(
                              fontSize: 20.0,
                              color: const Color(0xFF4A4B4D),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 167.0,
                          bottom: 55.0,
                          child: Text(
                            '$city',
                            style: GoogleFonts.roboto(
                              fontSize: 20.0,
                              color: const Color(0xFF4A4B4D),
                              // fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 61.0,
                          bottom: 19.0,
                          child: Text(
                            'level: $cheflevel',
                            style: GoogleFonts.roboto(
                              fontSize: 20.0,
                              color: const Color(0xFF4A4B4D),
                              // fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 52.0,
                          bottom: 19.0,
                          child: Text(
                            'rating: $rating',
                            style: GoogleFonts.roboto(
                              fontSize: 20.0,
                              color: const Color(0xFF4A4B4D),
                              // fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment(0.0, 0.8),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  SizedBox(
                    width: 370.0,
                    height: 100.0,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: <Widget>[
                        Positioned(
                          top: 0,
                          child: Container(
                            width: 370.0,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.16),
                                  offset: Offset(0, 3.0),
                                  blurRadius: 12.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 20,
                          left: 15,
                          child: Text(
                            'Exp: $experience',
                            style: GoogleFonts.roboto(
                              fontSize: 20.0,
                              color: const Color(0xFF4A4B4D),
                              // fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 15,
                          top: 60.0,
                          child: Text(
                            '$cuisine_exp',
                            style: GoogleFonts.roboto(
                              fontSize: 14.0,
                              color: const Color(0xFF4A4B4D),
                              // fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment(0.0, 0.0),
              child: Text(
                'spec: $specialities',
                style: GoogleFonts.roboto(
                  fontSize: 20.0,
                  color: const Color(0xFF4A4B4D),
                  fontWeight: FontWeight.w700,
                  height: 2.0,
                ),
              ),
            ),
            // SizedBox(
            //   height: 10,
            // ),
            Align(
              alignment: Alignment(0.0, 0.0),
              // child: Stack(
              //   alignment: Alignment.topCenter,
              //   children: [
              //     SizedBox(
              //       width: 370.0,
              //       height: 235.0,
              //       child: Stack(
              //         alignment: Alignment.topCenter,
              //         children: <Widget>[

              // Positioned(
              //   top: 0,
              //   child: Container(
              //     width: 370.0,
              //     height: 100,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(20.0),
              //       color: Colors.white,
              //       boxShadow: [
              //         BoxShadow(
              //           color: Colors.black.withOpacity(0.16),
              //           offset: Offset(0, 3.0),
              //           blurRadius: 12.0,
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // Positioned(
              //   top: 20,
              //   left: 35,
              //   child: Text(
              //     'Chef ID',
              //     style: GoogleFonts.roboto(
              //       fontSize: 20.0,
              //       color: const Color(0xFF4A4B4D),
              //       fontWeight: FontWeight.w700,
              //     ),
              //   ),
              // ),
              // Positioned(
              //   left: 35,
              //   top: 60.0,
              //   child: Text(
              //     'City',
              //     style: GoogleFonts.roboto(
              //       fontSize: 20.0,
              //       color: const Color(0xFF4A4B4D),
              //       fontWeight: FontWeight.w700,
              //     ),
              //   ),
              // ),
              //   ],
              // ),
              // ),
              // ],
              // ),
              child: Container(
                height: 160,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Row(
                        children: [
                          Container(
                            height: 120,
                            width: 160,
                            decoration: BoxDecoration(
                              // border: Border.all(color: Colors.grey.shade400, width: 5),
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  10,
                                ),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade300,
                                  blurRadius: 10,
                                  offset: Offset(0, 3),
                                  spreadRadius: 5,
                                )
                              ],
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  // Colors.green,
                                  // Colors.blue,

                                  Colors.purple.shade700,
                                  Colors.purple.shade600,
                                ],
                              ),
                            ),
                            child: InkWell(
                              onTap: () {
                                print('Button Pressed');
                              },
                              child: Align(
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/CCI1.png',
                                      height: 100,
                                      width: 100,
                                      color: Colors.black,
                                    ),
                                    Text(
                                      'CCI',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontFamily: 'Roboto',
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 120,
                            width: 160,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    10,
                                  ),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 10,
                                    offset: Offset(0, 3),
                                    spreadRadius: 5,
                                  ),
                                ],
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.purple.shade700,
                                    Colors.purple.shade600,
                                  ],
                                )),
                            child: InkWell(
                              onTap: () {
                                print('Button Pressed');
                              },
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/CCI1.png',
                                    height: 100,
                                    width: 100,
                                    color: Colors.black,
                                  ),
                                  Text(
                                    'CCI',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontFamily: 'Roboto',
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 120,
                            width: 160,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    10,
                                  ),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 10,
                                    offset: Offset(0, 3),
                                    spreadRadius: 5,
                                  ),
                                ],
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.purple.shade700,
                                    Colors.purple.shade600,
                                  ],
                                )),
                            child: InkWell(
                              onTap: () {
                                print('Button Pressed');
                              },
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/CCI1.png',
                                    height: 100,
                                    width: 100,
                                    color: Colors.black,
                                  ),
                                  Text(
                                    'CCI',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontFamily: 'Roboto',
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 120,
                            width: 160,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    10,
                                  ),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 10,
                                    offset: Offset(0, 3),
                                    spreadRadius: 5,
                                  ),
                                ],
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.purple.shade700,
                                    Colors.purple.shade600,
                                  ],
                                )),
                            child: InkWell(
                              onTap: () {
                                print('Button Pressed');
                              },
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/CCI1.png',
                                    height: 100,
                                    width: 100,
                                    color: Colors.black,
                                  ),
                                  Text(
                                    'CCI',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontFamily: 'Roboto',
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 120,
                            width: 160,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    10,
                                  ),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 10,
                                    offset: Offset(0, 3),
                                    spreadRadius: 5,
                                  ),
                                ],
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.purple.shade700,
                                    Colors.purple.shade600,
                                  ],
                                )),
                            child: InkWell(
                              onTap: () {
                                print('Button Pressed');
                              },
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/CCI1.png',
                                    height: 100,
                                    width: 100,
                                    color: Colors.black,
                                  ),
                                  Text(
                                    'CCI',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontFamily: 'Roboto',
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // SizedBox(
            //   height: 10,
            // ),
            Align(
              alignment: Alignment(0.0, 0.0),
              child: Text(
                'Menus',
                style: GoogleFonts.roboto(
                  fontSize: 20.0,
                  color: const Color(0xFF4A4B4D),
                  fontWeight: FontWeight.w700,
                  height: 2.0,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment(0.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 100,
                    width: 160,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        print(cid);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MenuTab(
                                      cid: cid,
                                    )));
                      },
                      child: Text(
                        'Pre-Defined\nMenu',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    height: 100,
                    width: 160,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MenuTab(
                                      cid: cid,
                                    )));
                      },
                      child: Text(
                        'Customized\nMenu',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
