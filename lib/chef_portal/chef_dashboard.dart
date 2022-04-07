import 'package:chef_connect_india/chef_portal/bookings.dart';
import 'package:chef_connect_india/chef_portal/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class chef_dashboard extends StatefulWidget {
  chef_dashboard({Key? key}) : super(key: key);

  @override
  State<chef_dashboard> createState() => _chef_dashboardState();
}

class _chef_dashboardState extends State<chef_dashboard> {
  int currentIndex = 0;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final screens = [
    chef_bookings(),
    // ProfilePageUser(FirebaseAuth.instance.currentUser!.uid),
    chef_profile()
  ];
  @override
  Widget build(BuildContext context) {
    User? user = _auth.currentUser;
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) => setState(() {
          currentIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.event_note_sharp,
            ),
            label: 'Booking',
            backgroundColor: Colors.amber,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_rounded,
            ),
            label: 'Profile',
            backgroundColor: Colors.deepOrange,
          ),
        ],
      ),
    );
  }
}
