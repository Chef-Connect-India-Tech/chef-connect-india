import 'package:chef_connect_india/roles/chef/Booking.dart';
import 'package:chef_connect_india/roles/chef/chef_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Chef_dashboard extends StatefulWidget {
  Chef_dashboard({Key? key}) : super(key: key);

  @override
  State<Chef_dashboard> createState() => _Chef_dashboardState();
}

class _Chef_dashboardState extends State<Chef_dashboard> {
  int currentIndex = 0;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final screens = [
    Booking(),
    ProfilePageUser(FirebaseAuth.instance.currentUser!.uid),
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
