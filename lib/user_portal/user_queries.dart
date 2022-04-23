import 'package:chef_connect_india/Drawers/navigation_drawer.dart';
import 'package:chef_connect_india/user_portal/Bookings_status/inprogress.dart';
import 'package:chef_connect_india/user_portal/Bookings_status/pending.dart';
import 'package:chef_connect_india/user_portal/Bookings_status/success.dart';
import 'package:chef_connect_india/user_portal/query_status/kitchen_query.dart';
import 'package:chef_connect_india/user_portal/query_status/private_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class user_queries extends StatefulWidget {
  String customerId;
  user_queries({Key? key, required this.customerId}) : super(key: key);

  @override
  State<user_queries> createState() => _user_queriesState();
}

class _user_queriesState extends State<user_queries> {
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
        closeManually: false,
        openCloseDial: isDialOpen,
        children: [
          SpeedDialChild(
              child: Icon(Icons.call),
              backgroundColor: Colors.green,
              label: 'Call',
              onTap: () {
                var a = '+91 7353064599';
                launch("tel: ${a}");
              }),
          SpeedDialChild(
              child: Image(
                image: AssetImage('assets/socialicons/gmail.png'),
                height: 35,
              ),
              backgroundColor: Colors.transparent,
              label: 'Mail',
              onTap: () {
                launch('mailto:info@chefconnect.co.in');
              }),
          // SpeedDialChild(
          //     child:
          //         Image(image: AssetImage('assets/socialicons/facebook.png')),
          //     // backgroundColor: Colors.blue,
          //     label: 'Facebook',
          //     onTap: () => () {
          //           launch("https://www.facebook.com/Chef-Connect");
          //         }),
          SpeedDialChild(
              child:
                  Image(image: AssetImage('assets/socialicons/whatsapp.png')),
              // backgroundColor: Colors.indigo,
              label: 'Whatsapp',
              onTap: () {
                launch("https://wa.me/+918107302002");
              }),
          SpeedDialChild(
            child: Image(image: AssetImage('assets/socialicons/instagram.png')),
            // backgroundColor: Colors.indigo,
            label: 'Instagram',
            onTap: () {
              launch("https://www.instagram.com/chefconnectindia");
            },
          ),
          SpeedDialChild(
              child: Image(image: AssetImage('assets/socialicons/twitter.png')),
              label: 'Twitter',
              onTap: () {
                launch("https://mobile.twitter.com/chefconnect_");
              }),
        ],
      ),
      // body: Center(child: Text('User Bookings')),
      body: SafeArea(
        child: Container(
          child: DefaultTabController(
            length: 2,
            child: Scaffold(
              drawer: NavBar(),
              appBar: AppBar(
                backgroundColor: Colors.indigo,
                bottom: const TabBar(
                  tabs: [
                    Tab(
                        text: 'Private Chef',
                        icon: Icon(
                          Icons.person_outlined,
                          // color: Colors.redAccent,
                        )),
                    Tab(
                        text: 'Kitchen Professional',
                        icon: Icon(
                          Icons.person_outlined,
                          // color: Colors.orange,
                        )),
                  ],
                ),
                centerTitle: true,
                title: const Text('My Queries'),
              ),
              body: TabBarView(
                children: [
                  private_query(customerId: widget.customerId),
                  kitchen_query(customerId: widget.customerId),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
