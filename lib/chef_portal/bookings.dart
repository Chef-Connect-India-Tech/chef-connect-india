// import 'dart:html';

import 'package:chef_connect_india/Drawers/chef_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:google_fonts/google_fonts.dart';

class chef_bookings extends StatelessWidget {
  chef_bookings({Key? key}) : super(key: key);
  bool check = false;
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: chef_navBar(),
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          'My Bookings',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("bookings")
                        .where('cid',
                            isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text('Something went wrong..'),
                        );
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Center(
                          child: Column(
                            children: const [
                              CircularProgressIndicator(),
                              Text('Loading data, please wait...'),
                            ],
                          ),
                        );
                      } else if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.data!.docs.isEmpty) {
                        return Center(
                          child: Text(
                            'No Bookings yet. Add your special menu to get more Bookings',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 18),
                          ),
                        );
                      }
                      return ListView(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(0.0),
                        scrollDirection: Axis.vertical,
                        primary: true,
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          print(document.data());
                          return Container(
                            child: GestureDetector(
                              child: listpredefined(
                                bookingId: document['bookingId'],
                                bookingTime: document['bookingTime'],
                                bookingDate: document['bookingDate'],
                                requirementDate: document['bookingDate'],
                                requirementTime: document['requirementTime'],
                                bookingSlot: document['bookingSlot'],
                                bookingType: document['bookingType'],
                                chefContact: document['chefContact'],
                                chefId: document['chefId'],
                                customerId: document['customerId'],
                                location: document['location'],
                                // preferedBudget: document['preferedBudget'],
                                customerPhone: document['customerPhone'],
                                numberOfPlates: document['numberOfPlates'],
                                selectedMenu: document['selectedMenu'],
                                withMaterial: document['withMaterial'],
                                address: document['address'],
                                bookingStatus: document['bookingStatus'],
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    },
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

class listpredefined extends StatefulWidget {
  late String bookingId;
  late String bookingTime;
  late String bookingDate;
  late String requirementDate;
  late String requirementTime;
  late String bookingSlot;
  late String bookingType;
  late String chefContact;
  late String chefId;
  late String customerId;
  late String location;
  //late String preferedBudget;
  late String customerPhone;
  late String numberOfPlates;
  late List selectedMenu;
  late bool withMaterial;
  late String address;
  late String bookingStatus;
  listpredefined({
    required this.bookingId,
    required this.bookingTime,
    required this.bookingDate,
    required this.requirementDate,
    required this.requirementTime, //
    required this.bookingSlot, //
    required this.bookingType, //
    required this.chefContact,
    required this.chefId,
    required this.customerId, //
    required this.location, //
    // required this.preferedBudget,
    required this.customerPhone,
    required this.numberOfPlates, //
    required this.selectedMenu,
    required this.withMaterial, //
    required this.address, //
    required this.bookingStatus, //
  });

  @override
  State<listpredefined> createState() => _listpredefinedState();
}

class _listpredefinedState extends State<listpredefined> {
  @override
  Widget build(BuildContext context) {
    var dishes =
        widget.selectedMenu.toString().replaceAll('[', '').replaceAll(']', '');
    var scwidth = MediaQuery.of(context).size.width;
    bool selected = false;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ExpandableNotifier(
        child: Column(
          children: [
            Expandable(
              theme: ExpandableThemeData(
                  inkWellBorderRadius: BorderRadius.circular(50)),
              collapsed: ExpandableButton(
                // theme: ExpandableThemeData(iconColor: Colors.blue),
                child: Card(
                  elevation: 5,
                  child: Container(
                    padding: const EdgeInsets.only(left: 10.0),
                    width: scwidth - 90,
                    height: 120.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(10.0),
                        right: Radius.circular(10.0),
                      ),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.16),
                          offset: Offset(0, 3.0),
                          blurRadius: 12.0,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${widget.bookingId}'s menu",
                              style: GoogleFonts.roboto(
                                fontSize: 20.0,
                                color: const Color(0xFF4A4B4D),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              expanded: Card(
                elevation: 5,
                child: Container(
                  padding: const EdgeInsets.only(left: 10.0),
                  width: scwidth - 90,
                  // height: 100.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(10.0),
                      right: Radius.circular(10.0),
                    ),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.1),
                        offset: Offset(0, 3),
                        blurRadius: 12.0,
                      ),
                    ],
                  ),
                  child: Column(children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "${widget.bookingId}",
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0,
                                  ),
                                ),
                                ExpandableButton(
                                  child: Icon(
                                    Icons.cancel_outlined,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'dishes:',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '${dishes}',
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Row(
                                children: [
                                  Text(
                                    'Requirement Date:',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '${widget.requirementDate}',
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Row(
                                children: [
                                  Text(
                                    'Requirement Time:',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '${widget.requirementTime}',
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Row(
                                children: [
                                  Text(
                                    'Booking slot:',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 10),
                                    width:
                                        MediaQuery.of(context).size.width - 300,
                                    child: Text(
                                      '${widget.bookingSlot}',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Row(
                                children: [
                                  Text(
                                    'Booking Type:',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '${widget.bookingType}',
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Row(
                                children: [
                                  Text(
                                    'Customer Id:',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '${widget.customerId}',
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Row(
                                children: [
                                  Text(
                                    'Location:',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '${widget.location}',
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Row(
                                children: [
                                  Text(
                                    'Number of plates:',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '${widget.numberOfPlates}',
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Row(
                                children: [
                                  Text(
                                    'With Material:',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '${widget.withMaterial}',
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Row(
                                children: [
                                  Text(
                                    'Address:',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: scwidth - 200,
                                      child: Text(
                                        '${widget.address}',
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Row(
                                children: [
                                  Text(
                                    'Booking Status:',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '${widget.bookingStatus}',
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // ElevatedButton(
                                //     onPressed: () {
                                //       // var url = widget.chefContact;
                                //       // var p = '+919876543210';
                                //       //launch("tel: ${widget.customerPhone}");
                                //       // const phonenumber = '9876543210';
                                //       // const url = 'tel:$phonenumber';
                                //       // if (await canLaunch(url)) {
                                //       //   await launch('9876543210');
                                //       // }
                                //       // //_launchURL(widget.customerPhone);
                                //     },
                                //     child: Text("call customer")),
                                // Spacer(),
                                // ElevatedButton(
                                //     onPressed: () {}, child: Text("call chef")),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
