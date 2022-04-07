import 'package:chef_connect_india/Main%20Screen/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class chef_bookings extends StatefulWidget {
  const chef_bookings({Key? key}) : super(key: key);

  @override
  State<chef_bookings> createState() => _chef_bookingsState();
}

class _chef_bookingsState extends State<chef_bookings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.purple.shade600,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            Navigator.pushAndRemoveUntil(
                (context),
                MaterialPageRoute(builder: (context) => ChefConnectMain()),
                (route) => false);
          },
          child: Text(
            'Log Out',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
