import 'package:flutter/material.dart';

class menus_pre_cust extends StatefulWidget {
  const menus_pre_cust({Key? key}) : super(key: key);

  @override
  State<menus_pre_cust> createState() => _menus_pre_custState();
}

class _menus_pre_custState extends State<menus_pre_cust> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Menus'),
            bottom: TabBar(tabs: [
              Tab(
                text: 'Pre-Defined Menu',
              ),
              Tab(
                text: 'Customised Menu',
              ),
            ]),
          ),
          body: TabBarView(children: [
            Center(
              child: Text(
                'Pre-Defined Menu',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Center(
              child: Text(
                'Customised Menu',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ]),
        ),
      );
}
