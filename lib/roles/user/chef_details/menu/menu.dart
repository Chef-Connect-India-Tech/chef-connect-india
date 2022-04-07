import 'package:chef_connect_india/chef_portal/menus/predefined.dart';
import 'package:chef_connect_india/roles/user/chef_details/menu/customiseduser.dart';
import 'package:chef_connect_india/roles/user/chef_details/menu/predefineduser.dart';
import 'package:flutter/material.dart';

class MenuTab extends StatefulWidget {
  late String cid;
  MenuTab({required this.cid});
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

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this, initialIndex: 0)
      ..addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff7a54ff),
        title: Text('Menu', style: TextStyle(color: Colors.white)),
        elevation: 0.0,
        titleSpacing: 10.0,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          new Padding(
            padding: const EdgeInsets.all(5.0),
            child: new Text(''),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey[300]),
            child: TabBar(
                isScrollable: true,
                indicatorPadding: EdgeInsets.all(5),
                labelColor: Colors.white,
                unselectedLabelColor: colorstheme,
                labelStyle: TextStyle(fontSize: 20),
                labelPadding:
                    EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                indicator: BoxDecoration(
                    color: colorstheme,
                    borderRadius: BorderRadius.circular(20)),
                controller: _tabController,
                tabs: [
                  Text('Pre-defined menu'),
                  Text('customised menu'),
                ]),
          ),
          Expanded(
            child: TabBarView(controller: _tabController, children: [
              predefineduser(cid: widget.cid),
              customiseduser(),
            ]),
          )
        ],
      ),
    );
  }
}
