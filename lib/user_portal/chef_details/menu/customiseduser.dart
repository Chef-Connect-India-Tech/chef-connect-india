//import 'dart:html';

// ignore_for_file: must_be_immutable

import 'package:chef_connect_india/user_portal/user_checkout.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:paginate_firestore/paginate_firestore.dart';

class customiseduser extends StatefulWidget {
  late String cid;
  late List items;
  var chefContact;
  String chefId;
  customiseduser({
    required this.cid,
    required this.items,
    required this.chefContact,
    required this.chefId,
  });
  @override
  State<customiseduser> createState() => _customiseduserState();
}

class _customiseduserState extends State<customiseduser> {
  var name;

  var selectingmode = false;
  List _selectedItems = [];
  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(itemValue);
      } else {
        _selectedItems.remove(itemValue);
      }
    });
  }

  var a = 'a';
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: PaginateFirestore(
          itemBuilderType: PaginateBuilderType.listView,
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.all(0.0),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, documentSnapshots, index) {
            a = documentSnapshots[index].id;
            return GestureDetector(
              child: Container(
                child: Column(
                  children: [
                    Column(
                      children: [
                        ListBody(
                          children: widget.items
                              .map((item) => CheckboxListTile(
                                    value: _selectedItems.contains(item),
                                    title: Text(item),
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    onChanged: (isChecked) =>
                                        _itemChange(item, isChecked!),
                                  ))
                              .toList(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },

          // orderBy is compulsory to enable pagination
          query: FirebaseFirestore.instance
              .collection('Menu')
              .where("cid", isEqualTo: widget.cid),
          isLive: true,
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 15),
        child: GestureDetector(
          child: SizedBox(
            height: 40,
            width: MediaQuery.of(context).size.width - 100,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.indigo,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: () {
                var len = ((_selectedItems).length);
                if (len == 0) {
                  Fluttertoast.showToast(msg: "Please select dishes");
                } else if (len < 7) {
                  Fluttertoast.showToast(msg: "Price is 2500");
                } else {
                  Fluttertoast.showToast(
                      msg: "Price is ${2500 + (len - 6) * 100}");
                }
                print(_selectedItems);
                print('Book A  Chef button pressed');

                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: ((context) => user_checkout()),
                //   ),
                // );
              },
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
      ),
    );
  }
}
