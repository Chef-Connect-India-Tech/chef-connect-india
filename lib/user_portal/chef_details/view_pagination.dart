import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class chef_view_more extends StatefulWidget {
  const chef_view_more({Key? key}) : super(key: key);

  @override
  State<chef_view_more> createState() => _chef_view_moreState();
}

class _chef_view_moreState extends State<chef_view_more> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<DocumentSnapshot> _chefs = [];
  bool _lodingChefs = true;

  _getChefs() async {
    Query q = _firestore
        .collection('chefs')
        .orderBy('firstname')
        .where('verified', isEqualTo: true)
        .limit(15);
    setState(() {
      _lodingChefs = true;
    });
    QuerySnapshot querySnapshot = await q.get();
    _chefs = querySnapshot.docs;
    setState(() {
      _lodingChefs = false;
    });
  }

  @override
  void initState() {
    _getChefs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chef Connect - Chefs'),
      ),
      body: Container(
        child: _chefs.length == 0
            ? Center(
                child: Text('No Chefs Found'),
              )
            : ListView.builder(itemBuilder: (BuildContext cxt, int index) {
                return ListTile(
                    // title: Text(_chefs[index].data['firstName']),
                    );
              }),
      ),
    );
  }
}
