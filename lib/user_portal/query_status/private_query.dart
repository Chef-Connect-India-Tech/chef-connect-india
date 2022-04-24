// ignore_for_file: must_be_immutable

import 'package:chef_connect_india/Helper/bokings_card.dart';
import 'package:chef_connect_india/Helper/query_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class private_query extends StatefulWidget {
  String customerId;
  private_query({Key? key, required this.customerId}) : super(key: key);

  @override
  State<private_query> createState() => _private_queryState();
}

class _private_queryState extends State<private_query> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red.shade300,

      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("Queries")
                  .where('customerId', isEqualTo: widget.customerId)
                  .where('bookingType', isEqualTo: 'Private')
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
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'No queries yet. Just submit a query with us to get the perfect Chef for your Home',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 18),
                      ),
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
                    return private_query_card(
                      bookingId: document['bookingId'],
                      userId: document["customerId"],
                      preferedBudget: document["preferedBudget"],
                      preferedGender: document['preferedChefGender'],
                      selectedDate: document['requirementDate'],
                      fullAddress: document['address'],
                      chefCategory: document['chefCategory'],
                      queryStatus: document['bookingStatus'],
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
