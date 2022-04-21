// ignore_for_file: must_be_immutable

import 'package:chef_connect_india/Drawers/navigation_drawer.dart';
import 'package:chef_connect_india/user_portal/chef_details/menu/menu.dart';
import 'package:chef_connect_india/user_portal/user_home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';
import 'package:url_launcher/url_launcher.dart';

class chef_detail extends StatefulWidget {
  var chefid;
  var cheflevel;
  int experience;
  List cuisine = [];
  var city;
  var profilepic;
  var specialities;
  double rating;
  var cid;
  var chefContact;

  chef_detail({
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
    required this.chefContact,
  }) : super(key: key);

  @override
  State<chef_detail> createState() => _chef_detailState();
}

class _chef_detailState extends State<chef_detail> {
  var cuisine_name;
  var customised_items;

  @override
  Widget build(BuildContext context) {
    Future showToast(String message) async {
      await Fluttertoast.cancel();

      Fluttertoast.showToast(msg: message, fontSize: 18);
    }

    final isDialOpen = ValueNotifier(false);
    var width = MediaQuery.of(context).size.width;
    // String cuisine_exp = widget.cuisine.replaceAll('[', '').replaceAll(']', '');
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => user_home(),
                  ),
                  (route) => false);
            },
            icon: Icon(
              Icons.arrow_back,
            ),
          )
        ],
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: Text(widget.chefid),
      ),
      floatingActionButton: SpeedDial(
        child: Image(
          image: AssetImage('assets/customer-service.png'),
          height: 100,
        ),
        // animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Colors.black,
        overlayColor: Colors.black,
        overlayOpacity: 0.4,
        spacing: 10,
        spaceBetweenChildren: 10,
        closeManually: true,
        openCloseDial: isDialOpen,
        children: [
          SpeedDialChild(
              child: Image(
                image: AssetImage('assets/socialicons/gmail.png'),
                height: 35,
              ),
              backgroundColor: Colors.transparent,
              label: 'Mail',
              onTap: () {
                launch('mailto:info@chefconnect.co.in');
              }),
          // SpeedDialChild(
          //     child:
          //         Image(image: AssetImage('assets/socialicons/facebook.png')),
          //     // backgroundColor: Colors.blue,
          //     label: 'Facebook',
          //     onTap: () => () {
          //           launch("https://www.facebook.com/Chef-Connect");
          //         }),
          SpeedDialChild(
              child:
                  Image(image: AssetImage('assets/socialicons/whatsapp.png')),
              // backgroundColor: Colors.indigo,
              label: 'Whatsapp',
              onTap: () {
                launch("https://wa.me/+918107302002");
              }),
          SpeedDialChild(
            child: Image(image: AssetImage('assets/socialicons/instagram.png')),
            // backgroundColor: Colors.indigo,
            label: 'Instagram',
            onTap: () {
              launch("https://www.instagram.com/chefconnectindia");
            },
          ),
          SpeedDialChild(
              child: Image(image: AssetImage('assets/socialicons/twitter.png')),
              label: 'Twitter',
              onTap: () {
                launch("https://mobile.twitter.com/chefconnect_");
              }),
        ],
      ),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 48, left: 20, right: 20),
                        height: 200,
                        width: width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.16),
                              offset: Offset(0, 3.0),
                              blurRadius: 12.0,
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 60.0,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                  ),
                                  radius: 60.0,
                                  backgroundImage: NetworkImage(
                                    widget.profilepic,
                                  ),
                                ),
                              ),
                              Center(
                                child: Container(
                                  padding: EdgeInsets.only(top: 12),
                                  child: Text(
                                    '${widget.chefid}',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 24.0,
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: Container(
                                  padding: EdgeInsets.only(top: 8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'City: ',
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20.0,
                                        ),
                                      ),
                                      Text(
                                        '${widget.city}',
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 20.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Center(
                                    child: Container(
                                      padding: EdgeInsets.only(top: 16),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Chef Level: ',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                          Text(
                                            '${widget.cheflevel}',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Container(
                                      padding: EdgeInsets.only(top: 16),
                                      child: Row(
                                        children: [
                                          SmoothStarRating(
                                            borderColor: Colors.grey.shade200,
                                            rating: widget.rating,
                                            starCount: 1,
                                            allowHalfRating: false,
                                            filledIconData: Icons.star,
                                            color: Color.fromARGB(
                                                255, 255, 179, 0),
                                          ),
                                          Text(
                                            '${widget.rating}',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    height: 180,
                    width: width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.16),
                          offset: Offset(0, 3.0),
                          blurRadius: 12.0,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding:
                              EdgeInsets.only(top: 16, left: 16, right: 16),
                          child: Row(
                            // mainAxisAlignment:
                            //     MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Experience: ',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.0,
                                ),
                              ),
                              Text(
                                '${widget.experience}',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.0,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.only(top: 16, left: 16, right: 16),
                          child: Column(
                            // mainAxisAlignment:
                            //     MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Cuisine Expert : ',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Wrap(
                                spacing: 5.0,
                                children: widget.cuisine
                                    .map((e) => Chip(
                                          backgroundColor:
                                              Colors.purple.shade100,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          label: Text(
                                            e,
                                            style: TextStyle(
                                              color: Colors.purple.shade900,
                                            ),
                                          ),
                                        ))
                                    .toList(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Card(
                      elevation: 5,
                      child: SizedBox(
                        height: 50,
                        width: 250,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            primary: Colors.white,
                            onPrimary: Color.fromARGB(255, 18, 68, 138),
                          ),
                          onPressed: () async {
                            var cust_collection =
                                FirebaseFirestore.instance.collection('Menu');
                            var cust_docSnapshot =
                                await cust_collection.doc(widget.cid).get();
                            if (cust_docSnapshot.exists) {
                              Map<String, dynamic> cust_data =
                                  cust_docSnapshot.data()!;
                              customised_items = cust_data['customised menu'];
                              // print(name);
                            }
                            List<String> _cust_items =
                                customised_items.cast<String>();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MenuTab(
                                      chefContact: widget.chefContact,
                                      chefId: widget.chefid,
                                      cid: widget.cid,
                                      customisedmenu: _cust_items)),
                            );
                            print("button pressed");
                          },
                          child: Text(
                            'Select Menu',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
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
    );
  }
}
