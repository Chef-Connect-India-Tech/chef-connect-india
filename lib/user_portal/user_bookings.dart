import 'package:chef_connect_india/Drawers/navigation_drawer.dart';
import 'package:chef_connect_india/user_portal/Bookings_status.dart/inprogress.dart';
import 'package:chef_connect_india/user_portal/Bookings_status.dart/pending.dart';
import 'package:chef_connect_india/user_portal/Bookings_status.dart/success.dart';
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
              return DefaultTabController(
                length: 3,
                child: Scaffold(
                  drawer: NavBar(),
                  appBar: AppBar(
                    backgroundColor: Colors.indigo,
                    bottom: const TabBar(
                      tabs: [
                        Tab(
                            text: 'Pending',
                            icon: Icon(
                              Icons.pending_actions,
                              // color: Colors.redAccent,
                            )),
                        Tab(
                            text: 'Inprogress',
                            icon: Icon(
                              Icons.pending_outlined,
                              // color: Colors.orange,
                            )),
                        Tab(
                            text: 'Completed',
                            icon: Icon(
                              Icons.done_all,
                              // color: Colors.green,
                            )),
                      ],
                    ),
                    centerTitle: true,
                    title: const Text('My bookings'),
                  ),
                  body: TabBarView(
                    children: [
                      pending(),
                      Inprogress(),
                      success(),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
