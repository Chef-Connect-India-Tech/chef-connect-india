import 'package:chef_connect_india/Helper/list.dart';
import 'package:chef_connect_india/Main%20Screen/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
      child: Column(
        children: [
          SizedBox(
            height: 150,
          ),
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("bookings")
                .where('chefId',
                    isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.all(0.0),
                scrollDirection: Axis.vertical,
                primary: true,
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  return new booking_list_view(
                    chefid: document['chefId'].toString(),
                    address: document['address'].toString(),
                    bookingId: document['appointmentId'],
                    bookingSlot: document['bookingSlot'].toString(),
                    cost: document['cost'].toString(),
                    customerId: document['customerId'].toString(),
                    date: document['date-time'].toString(),
                    location: document['location'].toString(),
                    numberOfPlates: document['numberOfPlates'].toString(),
                    status: document['status'].toString(),
                    time: document['date-time'].toString(),
                  );
                }).toList(),
              );
            },
          ),
          Center(
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
        ],
      ),
    );
  }
}
