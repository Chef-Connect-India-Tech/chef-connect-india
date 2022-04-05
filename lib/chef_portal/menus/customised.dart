import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class customised extends StatefulWidget {
  const customised({Key? key}) : super(key: key);

  @override
  _customisedState createState() => _customisedState();
}

class _customisedState extends State<customised> {
  var name;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var a = FirebaseAuth.instance.currentUser!.uid;
  List starterslist = [];

  List<String> _selectedItems = [];
// This function is triggered when a checkbox is checked or unchecked
  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(itemValue);
      } else {
        _selectedItems.remove(itemValue);
      }
    });
  }

  // this function is called when the Cancel button is pressed
  void _cancel() {
    Navigator.pop(context);
  }

// this function is called when the Submit button is tapped
  void _submit() {
    Navigator.pop(context, _selectedItems);
  }

  // Future<void> _disheslist() async {
  //   var a = 'KyU6Vt8hEIckIxKz60Si';
  //   var collection = FirebaseFirestore.instance.collection('dish');
  //   var docSnapshot = await collection.doc(a).get();
  //   if (docSnapshot.exists) {
  //     Map<String, dynamic> data = docSnapshot.data()!;
  //     name = data['dishes'];
  //     print(name);
  //   }
  // }

  void _showMultiSelect() async {
    var a = 'KyU6Vt8hEIckIxKz60Si';
    var collection = FirebaseFirestore.instance.collection('dish');
    var docSnapshot = await collection.doc(a).get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data()!;
      name = data['dishes'];
      print(name);
    }
    List<String> _items = name.cast<String>();

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: _items);
      },
    );

    // Update UI
    if (results != null) {
      setState(() {
        _selectedItems = results;
      });
    }
  }

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'ADD MENU',
          style: GoogleFonts.lato(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(
                child: Image(
                  image: AssetImage('assets/CCI.jpg'),
                  height: 250,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Form(
                key: _formKey,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.only(top: 0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                        autofocus: true,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Enter Dishes',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            Icon(
                              Icons.arrow_downward,
                              color: Colors.white,
                            )
                          ],
                        ),
                        onPressed: _showMultiSelect,
                      ),
                      Wrap(
                        children: _selectedItems
                            .map((e) => Chip(
                                  label: Text(e),
                                ))
                            .toList(),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 2,
                            primary: Colors.indigo,
                            onPrimary: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                          ),
                          onPressed: () {
                            _createAppointment();
                            // print(_menunameController.text);
                          },
                          child: Text(
                            "Upload",
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _createAppointment() async {
    var len = ((_selectedItems).length);
    //var menulength = ((_menunameController.text).length);

    FirebaseFirestore.instance
        .collection('Menu')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
      'dishes': _selectedItems,
    }, SetOptions(merge: true));
    Fluttertoast.showToast(msg: "Successfully added");
  }
}

class MultiSelect extends StatefulWidget {
  final List<String> items;
  const MultiSelect({Key? key, required this.items}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  // this variable holds the selected items
  final List<String> _selectedItems = [];

// This function is triggered when a checkbox is checked or unchecked
  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(itemValue);
      } else {
        _selectedItems.remove(itemValue);
      }
    });
  }

  // this function is called when the Cancel button is pressed
  void _cancel() {
    Navigator.pop(context);
  }

// this function is called when the Submit button is tapped
  void _submit() {
    print('--=========--------------');
    print(_selectedItems);
    Navigator.pop(context, _selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Topics'),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items
              .map((item) => CheckboxListTile(
                    value: _selectedItems.contains(item),
                    title: Text(item),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (isChecked) => _itemChange(item, isChecked!),
                  ))
              .toList(),
        ),
      ),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: _cancel,
        ),
        ElevatedButton(
          child: const Text('Submit'),
          onPressed: _submit,
        ),
      ],
    );
  }
}
