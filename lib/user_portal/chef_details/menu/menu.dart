// import 'package:chef_connect_india/chef_portal/menus/predefined.dart';
// ignore_for_file: must_be_immutable

import 'package:chef_connect_india/user_portal/chef_details/menu/customiseduser.dart';
import 'package:chef_connect_india/user_portal/chef_details/menu/predefineduser.dart';
import 'package:flutter/material.dart';

class MenuTab extends StatefulWidget {
  late String cid;
  late List customisedmenu;
  MenuTab({required this.cid, required this.customisedmenu});
  // const MenuTab({
  //   Key? key,
  //   required String cid,
  // }) : super(key: key);

  @override
  _TabViewState createState() => _TabViewState();
}

class _TabViewState extends State<MenuTab> with SingleTickerProviderStateMixin {
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
    List<String> _items = pp.cast<String>();

    print('menupage-------------------------------k');
    print(pp);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Menu', style: TextStyle(color: Colors.white)),
        elevation: 0.0,
        titleSpacing: 10.0,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          new Padding(
            padding: const EdgeInsets.all(1 - .0),
            child: new Text(''),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
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
                      'Pre-defined menu',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text('customised menu'),
                  ]),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                predefineduser(cid: widget.cid),
                customiseduser(
                  cid: widget.cid,
                  items: widget.customisedmenu,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: BottomAppBar(
              child: SizedBox(
                height: 40,
                width: 350,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.indigo,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Book A  Chef',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
