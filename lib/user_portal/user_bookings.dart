import 'package:chef_connect_india/Drawers/navigation_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class user_bookings extends StatefulWidget {
  String customerId;
  user_bookings({Key? key, required this.customerId}) : super(key: key);

  @override
  State<user_bookings> createState() => _user_bookingsState();
}

class _user_bookingsState extends State<user_bookings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text(
          'My Bookings',
          style: TextStyle(
            fontFamily: 'Montserrat',
          ),
        ),
        centerTitle: true,
      ),
      // body: Center(child: Text('User Bookings')),
      body: SafeArea(
        child: Container(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("bookings")
                .where('customerId', isEqualTo: widget.customerId)
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: Text('No Bookings Found..'),
                );
              }
              return ListView(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.all(0.0),
                scrollDirection: Axis.vertical,
                primary: true,
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  print(document.data());
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Container(
                      color: Colors.green,
                      height: 50,
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ),
      ),
    );
  }
}
