// ignore_for_file: unused_element

// import 'dart:html';
//
import 'package:chef_connect_india/chef_portal/viewdishes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:getwidget/components/dropdown/gf_dropdown.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:multi_select_flutter/multi_select_flutter.dart';

class predefined extends StatefulWidget {
  const predefined({Key? key}) : super(key: key);

  @override
  _predefinedState createState() => _predefinedState();
}

class _predefinedState extends State<predefined> {
  var name;
  var name1;
  var name2;
  var chefuid = FirebaseAuth.instance.currentUser!.uid;
  List<String> _selectedItems = [];
  List<String> _selectedItems1 = [];
  List<String> _selectedItems2 = [];
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

  void showdishes() async {
    // a list of selectable items
    // these items can be hard-coded or dynamically fetched from a database/API
    var collection = FirebaseFirestore.instance.collection('Menu');
    var docSnapshot = await collection.doc(chefuid).get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data()!;
      name = data['customised menu'];
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

  void showdishes1() async {
    // a list of selectable items
    // these items can be hard-coded or dynamically fetched from a database/API
    var collection = FirebaseFirestore.instance.collection('Menu');
    var docSnapshot = await collection.doc(chefuid).get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data()!;
      name = data['customised menu'];
      print(name);
    }
    List<String> _items = name.cast<String>();

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect1(items: _items);
      },
    );

    // Update UI
    if (results != null) {
      setState(() {
        _selectedItems1 = results;
      });
    }
  }

  void showdishes2() async {
    // a list of selectable items
    // these items can be hard-coded or dynamically fetched from a database/API
    var collection = FirebaseFirestore.instance.collection('Menu');
    var docSnapshot = await collection.doc(chefuid).get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data()!;
      name = data['customised menu'];
      print(name);
    }
    List<String> _items = name.cast<String>();

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect2(items: _items);
      },
    );

    // Update UI
    if (results != null) {
      setState(() {
        _selectedItems2 = results;
      });
    }
  }

  void _showMultiSelect() async {
    // a list of selectable items
    // these items can be hard-coded or dynamically fetched from a database/API
    var a = 'j1YKrWBIXKjSWizr0Qe0';
    var collection = FirebaseFirestore.instance.collection('menu');
    var docSnapshot = await collection.doc(a).get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data()!;
      name = data['starters'];
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

  void _showMultiSelect1() async {
    // a list of selectable items
    // these items can be hard-coded or dynamically fetched from a database/API
    var a = 'j1YKrWBIXKjSWizr0Qe0';
    var collection = FirebaseFirestore.instance.collection('menu');
    var docSnapshot = await collection.doc(a).get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data()!;
      name1 = data['main course'];
      print(name1);
    }
    List<String> _items1 = name1.cast<String>();

    final List<String>? results1 = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect1(items: _items1);
      },
    );

    // Update UI
    if (results1 != null) {
      setState(() {
        _selectedItems1 = results1;
      });
    }
  }

  void _showMultiSelect2() async {
    // a list of selectable items
    // these items can be hard-coded or dynamically fetched from a database/API
    var a = 'j1YKrWBIXKjSWizr0Qe0';
    var collection = FirebaseFirestore.instance.collection('menu');
    var docSnapshot = await collection.doc(a).get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data()!;
      name2 = data['desserts'];
      print(name2);
    }
    List<String> _items2 = name2.cast<String>();

    final List<String>? results2 = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect2(items: _items2);
      },
    );

    // Update UI
    if (results2 != null) {
      setState(() {
        _selectedItems2 = results2;
      });
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _menunameController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // List _animals = ['hi', 'bye'];
  // List _selectedAnimals = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 0,
        title: Text(
          'ADD MY MENU',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Montserrat',
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(
          child: ListView(
            shrinkWrap: true,
            children: [
              Form(
                key: _formKey,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.only(top: 0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(
                            'Dishes that are added into your profile will shown over here',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 20,
                          ),
                          child: TextFormField(
                            autofocus: false,
                            controller: _menunameController,
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                                //allow upper and lower case alphabets and space
                                return "Enter Correct Menu name";
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              _menunameController.text = value!;
                            },
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              fillColor: Colors.white70,
                              prefixIcon: Icon(
                                Icons.list_alt,
                                color: Colors.indigo,
                              ),
                              hintText: 'Enter Menu Name',
                              hintStyle: TextStyle(
                                  color: Colors.black38, fontSize: 15),
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              'Enter Starters',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Montserrat',
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            IconButton(
                              iconSize: 30,
                              onPressed: showdishes,
                              icon: Icon(
                                Icons.arrow_drop_down,
                              ),
                            ),
                            // CircleAvatar(
                            //   radius: 15,
                            //   backgroundColor: Colors.grey.shade200,
                            //   child: InkWell(
                            //     onTap: showdishes,
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
                          height: 150,
                          width: 400,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: InkWell(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 10,
                                    ),
                                    child: Wrap(
                                      spacing: 5.0,
                                      children: _selectedItems
                                          .map((e) => Chip(
                                                backgroundColor:
                                                    Colors.orange.shade100,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    10,
                                                  ),
                                                ),
                                                label: Text(
                                                  e,
                                                  style: TextStyle(
                                                    color:
                                                        Colors.orange.shade900,
                                                  ),
                                                ),
                                              ))
                                          .toList(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              'Enter Main Course',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Montserrat',
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            IconButton(
                              iconSize: 30,
                              onPressed: showdishes1,
                              icon: Icon(
                                Icons.arrow_drop_down,
                              ),
                            ),
                            // CircleAvatar(
                            //   radius: 15,
                            //   backgroundColor: Colors.grey.shade200,
                            //   child: InkWell(
                            //     onTap: showdishes1,
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
                          height: 150,
                          width: 400,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          child: InkWell(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 15,
                                    ),
                                    child: Wrap(
                                      spacing: 5.0,
                                      children: _selectedItems1
                                          .map((e) => Chip(
                                                backgroundColor:
                                                    Colors.blue.shade100,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    10,
                                                  ),
                                                ),
                                                label: Text(
                                                  e,
                                                  style: TextStyle(
                                                    color: Colors.blue.shade900,
                                                  ),
                                                ),
                                              ))
                                          .toList(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "Enter Dessert's",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Montserrat',
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            IconButton(
                              iconSize: 30,
                              onPressed: showdishes2,
                              icon: Icon(
                                Icons.arrow_drop_down,
                              ),
                            ),
                            // CircleAvatar(
                            //   radius: 15,
                            //   backgroundColor: Colors.grey.shade200,
                            //   child: InkWell(
                            //     onTap: showdishes2,
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
                          height: 150,
                          width: 400,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade100,
                          ),
                          child: InkWell(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 10,
                                    ),
                                    child: Wrap(
                                      spacing: 5.0,
                                      children: _selectedItems2
                                          .map((e) => Chip(
                                                backgroundColor:
                                                    Colors.purple.shade100,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    10,
                                                  ),
                                                ),
                                                label: Text(
                                                  e,
                                                  style: TextStyle(
                                                    color:
                                                        Colors.purple.shade900,
                                                  ),
                                                ),
                                              ))
                                          .toList(),
                                    ),
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
                          height: 45,
                          width: 240,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.indigo,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                            ),
                            onPressed: () {
                              _createAppointment();
                              print(_menunameController.text);
                            },
                            child: Text(
                              'Add Menu',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _createAppointment() async {
    var len = ((_selectedItems + _selectedItems1 + _selectedItems2).length);
    var menulength = ((_menunameController.text).length);
    if (menulength == 0 || menulength < 4) {
      Fluttertoast.showToast(msg: "Menu name must be 3 characters");
    } else if (len == 0 || len > 7) {
      Fluttertoast.showToast(
          msg: "items can't be more than 7 or equal to Zero");
    } else {
      FirebaseFirestore.instance
          .collection('Menu')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('menu')
          .doc()
          .set({
        'menu name': _menunameController.text,
        'starters': _selectedItems,
        'main course': _selectedItems1,
        'desserts': _selectedItems2,
      }, SetOptions(merge: true));
      Fluttertoast.showToast(msg: "Successfully added");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => viewdish(),
        ),
      );
    }
  }

  List<String> selectedList0 = [];
  List<String> selectedList1 = [];
  List<String> selectedList2 = [];

  // _startersdialog() {
  //   var docc = 'j1YKrWBIXKjSWizr0Qe0';
  //   // Get docs from collection reference
  //   FirebaseFirestore.instance
  //       .collection('menu')
  //       .doc(docc)
  //       .collection("starters")
  //       .get()
  //       .then((snapshot) => {
  //             snapshot.docs.forEach((doc) {
  //               starterslist.add(doc['dish']);
  //             })
  //           });
  //   print(starterslist);
  //   List<String> Listofsets = starterslist.cast<String>().toSet().toList();
  //   print(Listofsets);
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         //Here we will build the content of the dialog
  //         return AlertDialog(
  //           title: Text("Select Starters"),
  //           content: MultiSelectChip(
  //             Listofsets,
  //             onSelectionChanged: (selectedList) {
  //               setState(() {
  //                 selectedList0 = selectedList;
  //               });
  //             },
  //           ),
  //           actions: <Widget>[
  //             Row(
  //               children: [
  //                 FlatButton(
  //                     child: Text("Select"),
  //                     onPressed: () {
  //                       _pushdata();
  //                       Navigator.of(context).pop();
  //                     }),
  //                 FlatButton(
  //                     child: Text("No"),
  //                     onPressed: () {
  //                       Navigator.of(context).pop();
  //                     }),
  //               ],
  //             )
  //           ],
  //         );
  //       });
  // }
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: const Text('Select Topics'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListBody(
              children: widget.items
                  .map((item) => CheckboxListTile(
                        value: _selectedItems.contains(item),
                        title: Text(item),
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (isChecked) => _itemChange(item, isChecked!),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: _cancel,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text('Submit'),
          onPressed: _submit,
        ),
      ],
    );
  }
}

class MultiSelect1 extends StatefulWidget {
  final List<String> items;
  const MultiSelect1({Key? key, required this.items}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MultiSelect1State();
}

class _MultiSelect1State extends State<MultiSelect1> {
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
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
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text('Submit'),
          onPressed: _submit,
        ),
      ],
    );
  }
}

class MultiSelect2 extends StatefulWidget {
  final List<String> items;
  const MultiSelect2({Key? key, required this.items}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MultiSelect2State();
}

class _MultiSelect2State extends State<MultiSelect2> {
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
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
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text('Submit'),
          onPressed: _submit,
        ),
      ],
    );
  }
}
