import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:getwidget/components/dropdown/gf_dropdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class addmenu extends StatefulWidget {
  const addmenu({Key? key}) : super(key: key);

  @override
  _addmenuState createState() => _addmenuState();
}

class _addmenuState extends State<addmenu> {
  var a = FirebaseAuth.instance.currentUser!.uid;
  List starterslist = [];
  List maincourselist = [];
  List dessertslist = [];
  Future<void> _pushdata() async {
    print('=====================>>>>>>>>>>>>>>>>>>>sx');
    print(a);
    FirebaseFirestore.instance
        .collection('chefs')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
      'startersselectedlist': selectedList0.join(" , "),
    }, SetOptions(merge: true));
  }

  Future<void> _pushdata1() async {
    print('=====================>>>>>>>>>>>>>>>>>>>sx');
    print(a);
    FirebaseFirestore.instance
        .collection('chefs')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
      'DesertsSelectedlist': selectedList1.join(" , "),
    }, SetOptions(merge: true));
  }

  Future<void> _pushdata2() async {
    print('=====================>>>>>>>>>>>>>>>>>>>sx');
    print(a);
    FirebaseFirestore.instance
        .collection('chefs')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
      'MaincourseSelectedlist': selectedList2.join(" , "),
    }, SetOptions(merge: true));
  }

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

  void _showMultiSelect() async {
    // a list of selectable items
    // these items can be hard-coded or dynamically fetched from a database/API
    final List<String> _items = [
      'Flutter',
      'Node.js',
      'React Native',
      'Java',
      'Docker',
      'MySQL'
    ];

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
    final List<String> _items1 = [
      'Flutter',
      'Node.js',
      'React Native',
      'Java',
      'Docker',
      'MySQL'
    ];

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
    final List<String> _items2 = [
      'Flutter',
      'Node.js',
      'React Native',
      'Java',
      'Docker',
      'MySQL'
    ];

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
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _menunameController = TextEditingController();
  final TextEditingController _rateController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();
  final TextEditingController _workaddressController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  FocusNode f1 = FocusNode();
  FocusNode f2 = FocusNode();
  FocusNode f3 = FocusNode();
  FocusNode f4 = FocusNode();
  FocusNode f5 = FocusNode();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // List _animals = ['hi', 'bye'];
  // List _selectedAnimals = [];

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
                      TextFormField(
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
                          fillColor: Colors.white60,
                          hintText: 'Enter Menu Name',
                          hintStyle:
                              TextStyle(color: Colors.black38, fontSize: 15),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                          focusedBorder: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.white60,
                              width: 2,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                        ),
                      ),

                      ElevatedButton(
                        autofocus: true,
                        // style: ElevatedButton.styleFrom(
                        //   elevation: 2,
                        //   primary: Colors.indigo,
                        //   onPrimary: Colors.indigo,
                        //   shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(32.0),
                        //   ),
                        // ),
                        // child: const Text(
                        //   'Enter Starters',
                        //   style: TextStyle(
                        //     color: Colors.blue,
                        //   ),
                        // ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Enter Starters',
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
                      ElevatedButton(
                        child: const Text('Enter MainCourse'),
                        onPressed: _showMultiSelect1,
                      ),
                      Wrap(
                        children: _selectedItems1
                            .map((e) => Chip(
                                  label: Text(e),
                                ))
                            .toList(),
                      ),
                      ElevatedButton(
                        child: const Text('Enter Desserts'),
                        onPressed: _showMultiSelect2,
                      ),
                      Wrap(
                        children: _selectedItems2
                            .map((e) => Chip(
                                  label: Text(e),
                                ))
                            .toList(),
                      ),
                      // MultiSelectDialogField(
                      //   items: _animals
                      //       .map((e) => MultiSelectItem(e, e.name))
                      //       .toList(),
                      //   listType: MultiSelectListType.CHIP,
                      //   onConfirm: (values) {
                      //     _selectedAnimals = values;
                      //   },
                      // ),
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
                            print(_menunameController.text);
                          },
                          child: Text(
                            "Register",
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
    var len = ((_selectedItems + _selectedItems1 + _selectedItems2).length);
    if (len == 0 || len > 8) {
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
