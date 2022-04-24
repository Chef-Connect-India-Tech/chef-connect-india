// ignore_for_file: must_be_immutable

import 'package:chef_connect_india/Helper/bokings_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class success extends StatefulWidget {
  String customerId;
  success({Key? key, required this.customerId}) : super(key: key);

  @override
  State<success> createState() => _successState();
}

class _successState extends State<success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.green.shade200,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("bookings")
                    .where('customerId', isEqualTo: widget.customerId)
                    .where('bookingStatus', isEqualTo: 'Success')
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
                        'Looks like you have no bookings Completed!',
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
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      print(document.data());
                      return bookings_card(
                          bookingId: document['bookingId'],
                          chefId: document['chefId'],
                          userId: document["customerId"],
                          preferedBudget: document["preferedBudget"],
                          preferedMeal: document['bookingSlot'],
                          selectedDate: document['requirementDate'],
                          selectedTime: document["requirementTime"],
                          selectedMenu: document["selectedMenu"][0],
                          fullAddress: document['address'],
                          withMaterial: document['withMaterial'].toString(),
                          no_of_plates: document['numberOfPlates']);
                    }).toList(),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
