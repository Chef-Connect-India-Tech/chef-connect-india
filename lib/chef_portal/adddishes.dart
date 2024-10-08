// import 'dart:ffi';

import 'package:chef_connect_india/chef_portal/chef_dashboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class chef_add_dish extends StatefulWidget {
  const chef_add_dish({Key? key}) : super(key: key);

  @override
  _chef_add_dishState createState() => _chef_add_dishState();
}

class _chef_add_dishState extends State<chef_add_dish> {
  final adddish = new TextEditingController();
  // showAlertDialog(BuildContext context) {
  //   // set up the buttons
  //   Widget cancelButton = TextButton(
  //     child: Text("Cancel"),
  //     onPressed: () {
  //       // Navigator.pop(context);
  //     },
  //   );
  //   Widget continueButton = TextButton(
  //     child: Text("Continue"),
  //     onPressed: () {
  //       List aa = [adddish.text];
  //       var target_list_2 = List<dynamic>.from(aa);
  //       var len = ((target_list_2).length);
  //       var aaa = (adddish.text).length;
  //       print("le");
  //       print(aaa);
  //       if (aaa == 0) {
  //         Fluttertoast.showToast(msg: "Please Enter Items");
  //       } else {
  //         FirebaseFirestore.instance
  //             .collection("Menu")
  //             .doc(FirebaseAuth.instance.currentUser!.uid)
  //             .set({
  //           "customised menu": FieldValue.arrayUnion(target_list_2),
  //         });
  //         print('------------------------');
  //         print(target_list_2);
  //         Fluttertoast.showToast(
  //             msg: "successfully ${target_list_2.toString()} added");
  //       }
  //     },
  //   );

  //   // set up the AlertDialog
  //   AlertDialog alert = AlertDialog(
  //     title: Text("ADD DISH"),
  //     actions: [
  //       TextFormField(
  //         autofocus: false,
  //         controller: adddish,
  //         keyboardType: TextInputType.name,
  //         // validator: (value) {
  //         //   if (value!.isEmpty ||
  //         //       RegExp(r'^[a-z A-Z]+$')
  //         //           .hasMatch(value)) {
  //         //     //allow upper and lower case alphabets and space
  //         //     return "Enter Correct add dish";
  //         //   } else {
  //         //     return null;
  //         //   }
  //         // },
  //         onSaved: (value) {
  //           adddish.text = value!;
  //         },
  //         textInputAction: TextInputAction.next,
  //         decoration: InputDecoration(
  //           labelText: 'add dish',
  //           labelStyle: TextStyle(
  //               fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
  //           prefixIcon: Icon(Icons.food_bank),
  //           fillColor: Colors.white60,
  //           hintText: 'Add Dish',
  //           hintStyle: TextStyle(color: Colors.black, fontSize: 15),
  //           filled: true,
  //           border: OutlineInputBorder(
  //             borderRadius: BorderRadius.circular(10),
  //             borderSide: BorderSide(
  //               color: Colors.white,
  //               width: 2,
  //             ),
  //           ),
  //           focusedBorder: new OutlineInputBorder(
  //             borderRadius: new BorderRadius.circular(10.0),
  //             borderSide: BorderSide(
  //               color: Colors.white60,
  //               width: 2,
  //             ),
  //           ),
  //           enabledBorder: OutlineInputBorder(
  //             borderRadius: BorderRadius.circular(10),
  //             borderSide: BorderSide(
  //               color: Colors.white,
  //               width: 2,
  //             ),
  //           ),
  //         ),
  //       ),
  //       Row(
  //         children: [
  //           cancelButton,
  //           Spacer(),
  //           continueButton,
  //         ],
  //       ),
  //     ],
  //   );

  //   // show the dialog
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return alert;
  //     },
  //   );
  // }

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
        backgroundColor: Colors.indigo,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'ADD MY DISHES',
          style: GoogleFonts.lato(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          // shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Please select dishes that you are expert in. You can edit and add your custom dishes in profile page later as well.',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Montserrat',
                  color: Colors.indigo.shade600,
                ),
              ),
            ),
            //
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.only(top: 0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          'Enter Dishes',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        IconButton(
                          iconSize: 30,
                          onPressed: _showMultiSelect,
                          icon: Icon(
                            Icons.arrow_drop_down,
                          ),
                        ),
                        // CircleAvatar(
                        //   radius: 15,
                        //   backgroundColor: Colors.grey.shade200,
                        //   child: InkWell(
                        //     onTap: _showMultiSelect,
                        //     child: Icon(
                        //       Icons.arrow_drop_down,
                        //       size: 18,
                        //       color: Colors.black,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade200,
                      ),
                      child: InkWell(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Wrap(
                                spacing: 5,
                                children: _selectedItems
                                    .map((e) => Chip(
                                          backgroundColor:
                                              Colors.purple.shade100,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          label: Text(
                                            e,
                                            style: TextStyle(
                                              color: Colors.purple.shade900,
                                            ),
                                          ),
                                        ))
                                    .toList(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                      width: 200,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.indigo,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: savedata,
                        child: Text(
                          'Save and Proceed',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
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
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   backgroundColor: Colors.indigo,
      //   foregroundColor: Colors.white,
      //   onPressed: () => {showAlertDialog(context)},
      // ),
    );
  }

  Future<void> savedata() async {
    var len = ((_selectedItems).length);
    //var menulength = ((_menunameController.text).length);
    if (len == 0) {
      Fluttertoast.showToast(msg: "Please add Items");
    } else {
      FirebaseFirestore.instance
          .collection('Menu')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        "customised menu": FieldValue.arrayUnion(_selectedItems),
        "cid": FirebaseAuth.instance.currentUser!.uid
      });
      SetOptions(merge: true);
      Fluttertoast.showToast(msg: "Successfully added");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => chef_dashboard(),
        ),
      );
    }
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
      title: const Text('Select Dishes'),
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
