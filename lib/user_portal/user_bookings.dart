import 'package:chef_connect_india/Helper/list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class user_bookings extends StatefulWidget {
  const user_bookings({Key? key}) : super(key: key);

  @override
  State<user_bookings> createState() => _user_bookingsState();
}

class _user_bookingsState extends State<user_bookings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Bookings'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("bookings")
                .where('customerId',
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
                  print(document.data());
                  // return new AwesomeListItem(
                  //   title: document['chefid'].toString(),
                  //   content: document['cuisineexpert'].toString(),
                  //   city: document['city'].toString(),
                  //   level: document['professionallevel'].toString(),
                  //   experience: document['experience'].toString(),
                  //   profilepic: document['profilepic'],
                  //   color: Color(0xFFEF7A85),
                  // );
                  return new list_view(
                    chefid: document['appointmentId'],
                    cusineexpert: document['chefId'].toString(),
                    level: document['customerId'].toString(),
                    speciality: document['date-time'].toString(),
                    experience: document['status'].toString(),
                    profilepic: document['numberOfPlates'].toString(),
                    city: document['location'].toString(),
                    rating: document['status'].toString(),
                    uid: document['uid'],
                    currentsalary: document['currentsalary'].toString(),
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
