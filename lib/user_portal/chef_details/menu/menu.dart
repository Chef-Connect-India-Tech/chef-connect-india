// import 'package:chef_connect_india/chef_portal/menus/predefined.dart';
// ignore_for_file: must_be_immutable

import 'package:chef_connect_india/Drawers/navigation_drawer.dart';
import 'package:chef_connect_india/user_portal/chef_details/menu/customiseduser.dart';
import 'package:chef_connect_india/user_portal/chef_details/menu/predefineduser.dart';
import 'package:chef_connect_india/user_portal/user_home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MenuTab extends StatefulWidget {
  late String cid;
  late List customisedmenu;
  var chefContact;
  String chefId;
  MenuTab(
      {required this.cid,
      required this.customisedmenu,
      required this.chefContact,
      required this.chefId});

  @override
  _TabViewState createState() => _TabViewState();
}

class _TabViewState extends State<MenuTab> with SingleTickerProviderStateMixin {
  // late int price;
  // late double rate;
  // void pop() async {
  //   var a = widget.cid;
  //   var collection = FirebaseFirestore.instance.collection('chefs');
  //   var docSnapshot = await collection.doc(a).get();
  //   if (docSnapshot.exists) {
  //     var data = docSnapshot.data()!;
  //     price = data['cheffees'];
  //     print(price);
  //     print('trail');
  //     rate = price + price * 0.25;
  //     print(rate);
  //   }
  // }

  final colorstheme = Color(0xff4b4b87);

  late TabController _tabController;
  List pp = [];

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this, initialIndex: 0)
      ..addListener(() {});
    super.initState();
    pp = widget.customisedmenu;
  }

  @override
  Widget build(BuildContext context) {
    // pop();
    //  print(rate);
    // List<String> _items = pp.cast<String>();
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => user_home(),
                  ),
                  (route) => false);
            },
            icon: Icon(
              Icons.arrow_back,
            ),
          )
        ],
        title: Text('Select Menu'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 8.0),
            child: Container(
              width: 400,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300],
              ),
              child: TabBar(
                  isScrollable: true,
                  indicatorPadding: EdgeInsets.all(5),
                  labelColor: Colors.white,
                  unselectedLabelColor: colorstheme,
                  labelStyle: TextStyle(fontSize: 20),
                  labelPadding:
                      EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                  indicator: BoxDecoration(
                    color: Colors.indigo.shade500,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  controller: _tabController,
                  tabs: [
                    Text(
                      'Pre-defined Menu',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text('Customised Menu'),
                  ]),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                predefineduser(
                    // rate1: rate,
                    cid: widget.cid,
                    chefContact: widget.chefContact,
                    chefId: widget.chefId),
                customiseduser(
                    cid: widget.cid,
                    items: widget.customisedmenu,
                    chefId: widget.chefId,
                    chefContact: widget.chefContact),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
