import 'package:chef_connect_india/Drawers/navigation_drawer.dart';
import 'package:chef_connect_india/user_portal/Bookings_status/inprogress.dart';
import 'package:chef_connect_india/user_portal/Bookings_status/pending.dart';
import 'package:chef_connect_india/user_portal/Bookings_status/success.dart';
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
          child: DefaultTabController(
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
                        text: 'In Progress',
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
                title: const Text('My Bookings'),
              ),
              body: TabBarView(
                children: [
                  pending(customerId: widget.customerId),
                  Inprogress(customerId: widget.customerId),
                  success(customerId: widget.customerId),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
