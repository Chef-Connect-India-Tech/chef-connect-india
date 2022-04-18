import 'package:chef_connect_india/Drawers/navigation_drawer.dart';
import 'package:chef_connect_india/user_portal/Bookings_status/inprogress.dart';
import 'package:chef_connect_india/user_portal/Bookings_status/pending.dart';
import 'package:chef_connect_india/user_portal/Bookings_status/success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';

class user_bookings extends StatefulWidget {
  String customerId;
  user_bookings({Key? key, required this.customerId}) : super(key: key);

  @override
  State<user_bookings> createState() => _user_bookingsState();
}

class _user_bookingsState extends State<user_bookings> {
  @override
  Widget build(BuildContext context) {
    Future showToast(String message) async {
      await Fluttertoast.cancel();

      Fluttertoast.showToast(msg: message, fontSize: 18);
    }

    final isDialOpen = ValueNotifier(false);
    return Scaffold(
      drawer: NavBar(),
      floatingActionButton: SpeedDial(
        child: Image(
          image: AssetImage('assets/customer-service.png'),
          height: 100,
        ),
        // animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Colors.black,
        overlayColor: Colors.black,
        overlayOpacity: 0.4,
        spacing: 10,
        spaceBetweenChildren: 10,
        closeManually: true,
        openCloseDial: isDialOpen,
        children: [
          SpeedDialChild(
            child: Image(
              image: AssetImage('assets/socialicons/gmail.png'),
              height: 35,
            ),
            backgroundColor: Colors.transparent,
            label: 'Mail',
            onTap: () => showToast(
              'Selected Mail..',
            ),
          ),
          SpeedDialChild(
            child: Image(image: AssetImage('assets/socialicons/facebook.png')),
            // backgroundColor: Colors.blue,
            label: 'Facebook',
            onTap: () => showToast(
              'Selected facebook..',
            ),
          ),
          SpeedDialChild(
            child: Image(image: AssetImage('assets/socialicons/whatsapp.png')),
            // backgroundColor: Colors.indigo,
            label: 'Whatsapp',
            onTap: () => showToast(
              'Selected whatsapp..',
            ),
          ),
          SpeedDialChild(
            child: Image(image: AssetImage('assets/socialicons/instagram.png')),
            // backgroundColor: Colors.indigo,
            label: 'Instagram',
            onTap: () => showToast('Selected Instagram..'),
          ),
          SpeedDialChild(
            child: Image(image: AssetImage('assets/socialicons/twitter.png')),
            label: 'Twitter',
            onTap: () => showToast('Selected Twitter..'),
          ),
        ],
      ),
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
