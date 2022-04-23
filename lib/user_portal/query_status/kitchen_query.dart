// ignore_for_file: must_be_immutable

import 'package:chef_connect_india/Helper/bokings_card.dart';
import 'package:chef_connect_india/Helper/query_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class kitchen_query extends StatefulWidget {
  String customerId;
  kitchen_query({Key? key, required this.customerId}) : super(key: key);

  @override
  State<kitchen_query> createState() => _kitchen_queryState();
}

class _kitchen_queryState extends State<kitchen_query> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red.shade300,

      body: SafeArea(
        child: Container(
          // decoration: BoxDecoration(
          //   image: new DecorationImage(
          //     image: new AssetImage(
          //       "assets/background_image.jpeg",
          //     ),
          //     // fit: BoxFit.fill,
          //   ),
          // ),
          child: SingleChildScrollView(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("Queries")
                  .where('customerId', isEqualTo: widget.customerId)
                  .where('bookingType', isEqualTo: 'Kitchen')
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
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
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    print(document.data());
                    return kitchen_query_card(
                      bookingId: document['bookingId'],
                      userId: document["customerId"],
                      preferedBudget: document["preferedBudget"],
                      selectedDate: document['requirementDate'],
                      fullAddress: document['address'],
                      chefCategory: document['chefCategory'],
                      hotelName: document['restaurantName'],
                      no_of_chefs: document['chefCount'],
                      preferedCuisine: document['preferedCuisine'],
                    );
                  }).toList(),
                );
              },
            ),
          ),
          margin: EdgeInsets.only(bottom: 10),
        ),
      ),
    );
  }
}
