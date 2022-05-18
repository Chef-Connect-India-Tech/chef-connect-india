// ignore_for_file: unnecessary_null_comparison

import 'dart:io';
import 'package:intl/intl.dart';
import 'package:chef_connect_india/Helper/models/user.dart';
import 'package:chef_connect_india/Helper/utils.dart';
import 'package:chef_connect_india/Main%20Screen/home.dart';
import 'package:chef_connect_india/chef_portal/menus/chefcustomised.dart';
import 'package:chef_connect_india/chef_portal/viewdishes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'menus/chefpredefined.dart';

class chef_profile extends StatefulWidget {
  const chef_profile({Key? key}) : super(key: key);

  @override
  State<chef_profile> createState() => _chef_profileState();
}

class _chef_profileState extends State<chef_profile> {
  List<String> _selectedcusine = [];
  void _showMultiSelect() async {
    // a list of selectable items
    // these items can be hard-coded or dynamically fetched from a database/API
    final List<String> cusine = [
      "Indian",
      "Chinese",
      "Italian",
      "Sushi",
      "Mexican",
      "Multi Cuisine",
      "Continental"
    ];

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: cusine);
      },
    );

    // Update UI
    if (results != null) {
      setState(() {
        _selectedcusine = results;
      });
    }
  }

  File? image;
  final imagePicker = ImagePicker();
  late String downloadURL;
  Future ImagePickerMethod() async {
    // ignore: unused_local_variable
    final pick = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pick != null) {
        image = File(pick.path);
      } else {}
    });
    Alert(
      context: context,
      title: "Profile Pic",
      desc: "Profile pic will be update soon",
    ).show();
    Reference ref = FirebaseStorage.instance
        .ref()
        .child("chef-profile")
        .child(FirebaseAuth.instance.currentUser!.uid);
    await ref.putFile(image!);
    downloadURL = await ref.getDownloadURL();

    if (downloadURL != null) {
      Firebasehelper.updatepic(
          FirebaseAuth.instance.currentUser!.uid, downloadURL);
    }
  }

  // var date = DateTime.now();
  DateTime selectedDate = DateTime.now();
  late String dateUTC;
  late String date_Time;
  Future<void> selectDate(BuildContext context) async {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2025),
    ).then(
      (date) {
        setState(
          () {
            selectedDate = date!;
            String formattedDate =
                DateFormat('dd-MM-yyyy').format(selectedDate);
            _dateController = formattedDate as TextEditingController;
            dateUTC = DateFormat('yyyy-MM-dd').format(selectedDate);
          },
        );
      },
    );
  }

  //personal details controller
  TextEditingController? _firstnameController;
  TextEditingController? _lastnameController;
  TextEditingController? _phoneController;
  TextEditingController? _phone2Controller;
  TextEditingController? _emailController;
  late TextEditingController _dateController = TextEditingController();
  //current location details controller
  TextEditingController? _currentcity;
  TextEditingController? _currentcountry;
  TextEditingController? _currentcitypincode;

  //work location details controller
  TextEditingController? _workexperience;
  TextEditingController? _workpreference;
  TextEditingController? _workcity;
  TextEditingController? _cheffees;
  TextEditingController? _salaryrange;
  TextEditingController? _cuisineexpert;
  TextEditingController? _specialities;

  //extra details controller
  TextEditingController? _education;
  TextEditingController? _certifications;

  // Future pickDate(BuildContext context) async {
  //   final initialDate = DateTime.now();
  //   final newDate = await showDatePicker(
  //     context: context,
  //     initialDate: initialDate,
  //     firstDate: DateTime(DateTime.now().year - 70),
  //     lastDate: DateTime(DateTime.now().year + 1),
  //   ).then((selectedDate) {
  //     if (selectedDate != null) {
  //       _dobController!.text = DateFormat('yyyy-MM-dd').format(selectedDate);
  //       ;
  //     }
  //   });

  //   if (newDate == null) return;

  //   setState(() => date = newDate);
  // }

  Future<String?> open_curloc_Dialog0(data) => showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Edit Personal Details'),
          content: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  TextField(
                    keyboardType: TextInputType.name,
                    controller: _firstnameController =
                        TextEditingController(text: data['firstname']),
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: 'Enter your first name',
                      hintStyle: TextStyle(
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    keyboardType: TextInputType.name,
                    controller: _lastnameController =
                        TextEditingController(text: data['lastname']),
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: 'Enter your last name',
                      hintStyle: TextStyle(
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _dateController,
                    decoration: InputDecoration(
                      labelText: "Date of birth",
                      hintText: "Ex. Insert your dob",
                    ),
                    onTap: () async {
                      DateTime date = DateTime(1900);
                      FocusScope.of(context).requestFocus(new FocusNode());

                      date = (await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100)))!;

                      _dateController.text = date.toIso8601String();
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    // style: TextStyle(color: Colors.black),
                    // readOnly: true,
                    // enabled: false,
                    keyboardType: TextInputType.name,
                    controller: _phone2Controller =
                        TextEditingController(text: data['mobile2']),
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: 'Enter your mobile2',
                      hintStyle: TextStyle(
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),

                  TextField(
                    // style: TextStyle(color: Colors.black),
                    // readOnly: true,
                    // enabled: false,
                    keyboardType: TextInputType.name,
                    controller: _emailController =
                        TextEditingController(text: data['email']),
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                      hintStyle: TextStyle(
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                  // TextField(
                  //   // style: TextStyle(color: Colors.black),
                  //   // readOnly: true,
                  //   // enabled: false,
                  //   keyboardType: TextInputType.name,
                  //   controller: _dobController =
                  //       TextEditingController(text: data['dob']),
                  //   autofocus: true,
                  //   decoration: InputDecoration(
                  //     hintText: 'Enter your date of birth',
                  //     hintStyle: TextStyle(
                  //       fontFamily: 'Montserrat',
                  //     ),
                  //   ),
                  //   readOnly: true,
                  //   onTap: () async {
                  //     DateTime? pickedDate = await showDatePicker(
                  //         context: context,
                  //         initialDate: DateTime.now(),
                  //         firstDate: DateTime(
                  //             2000), //DateTime.now() - not to allow to choose before today.
                  //         lastDate: DateTime(2101));

                  //     if (pickedDate != null) {
                  //       print(
                  //           pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                  //       String formattedDate =
                  //           DateFormat('yyyy-MM-dd').format(pickedDate);
                  //       print(
                  //           formattedDate); //formatted date output using intl package =>  2021-03-16
                  //       //you can implement different kind of Date Format here according to your requirement

                  //       setState(() {
                  //         _dobController = formattedDate
                  //             as TextEditingController?; //set output date to TextField value.
                  //       });
                  //     } else {
                  //       print("Date is not selected");
                  //     }
                  //   },
                  // ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: cancel,
              child: Text(
                'Cancel',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            TextButton(
              onPressed: submit_curr0,
              child: Text(
                'Update',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
          ],
        ),
      );

  void submit_curr0() {
    Navigator.of(context).pop();
    updateCurLocData0();
  }

  updateCurLocData0() {
    if (_dateController.text.length >= 10) {
      CollectionReference _collectionRef =
          FirebaseFirestore.instance.collection("chefs");
      return _collectionRef.doc(FirebaseAuth.instance.currentUser!.uid).update({
        "firstname": _firstnameController!.text,
        'lastname': _lastnameController!.text,
        "mobile2": _phone2Controller!.text,
        "email": _emailController!.text,
        "dob": _dateController.text,
        // 'username':
        //     '${_firstnameController!.text.toString().substring(0, 2)}_${_lastnameController!.text.toString().substring(0, 2)}',
      }).then((value) => print("Updated Successfully"));
    }
    // var current_user_ui
    //d = FirebaseAuth.instance.currentUser!.uid;
    else {
      CollectionReference _collectionRef =
          FirebaseFirestore.instance.collection("chefs");
      return _collectionRef.doc(FirebaseAuth.instance.currentUser!.uid).update({
        "firstname": _firstnameController!.text,
        'lastname': _lastnameController!.text,
        "mobile2": _phone2Controller!.text,
        "email": _emailController!.text,
      }).then((value) => print("Updated Successfully"));
    }
  }

  void cancel() {
    Navigator.of(context).pop();
  }

  Future<String?> open_curloc_Dialog2(data) => showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Edit Work Details'),
          content: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: _workexperience = TextEditingController(
                        text: data['experience'].toString()),
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: 'Enter your experience',
                      hintStyle: TextStyle(
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // TextField(
                  //   keyboardType: TextInputType.name,
                  //   controller: _workpreference =
                  //       TextEditingController(text: data['workpreference']),
                  //   autofocus: true,
                  //   decoration: InputDecoration(
                  //     hintText: 'Enter your workpreference',
                  //     hintStyle: TextStyle(
                  //       fontFamily: 'Montserrat',
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  TextField(
                    // style: TextStyle(color: Colors.black),
                    // readOnly: true,
                    // enabled: false,

                    keyboardType: TextInputType.number,
                    controller: _cheffees = TextEditingController(
                        text: data['cheffees'].toString()),
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: 'Enter your Rate per day',
                      hintStyle: TextStyle(
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                  TextField(
                    // style: TextStyle(color: Colors.black),
                    // readOnly: true,
                    // enabled: false,

                    keyboardType: TextInputType.name,
                    controller: _workcity =
                        TextEditingController(text: data['address']),
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: 'Enter your address',
                      hintStyle: TextStyle(
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: cancel,
              child: Text(
                'Cancel',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            TextButton(
              onPressed: submit_curr2,
              child: Text(
                'Update',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
          ],
        ),
      );

  void submit_curr2() {
    updateCurLocData2();
    Navigator.of(context).pop();
  }

  updateCurLocData2() async {
    CollectionReference appointmentdatbase =
        FirebaseFirestore.instance.collection("chefs");
    var result = await appointmentdatbase
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      "experience": int.parse(_workexperience!.text),
      //'lastname': _workpreference!.text,
      "cheffees": int.parse(_cheffees!.text),
      "address": _workcity!.text,
    }).then((value) => print("Updated Successfully"));
  }
  // if (_dateController.text.length >= 10) {
  //   CollectionReference _collectionRef =
  //       FirebaseFirestore.instance.collection("chefs");
  //   return _collectionRef.doc(FirebaseAuth.instance.currentUser!.uid).update({
  //     "firstname": _firstnameController!.text,
  //     'lastname': _lastnameController!.text,
  //     "mobile2": _phone2Controller!.text,
  //     "email": _emailController!.text,
  //     "dob": _dateController.text,
  //     'username':
  //         '${_firstnameController!.text.toString().substring(0, 2)}_${_lastnameController!.text.toString().substring(0, 2)}',
  //   }).then((value) => print("Updated Successfully"));
  // }
  // var current_user_ui
  //d = FirebaseAuth.instance.currentUser!.uid;
  // CollectionReference _collectionRef =
  //     FirebaseFirestore.instance.collection("chefs");
  // return _collectionRef.doc(FirebaseAuth.instance.currentUser!.uid).update({
  //   "experience": (_workexperience!.text),
  //   //'lastname': _workpreference!.text,
  //   "cheffees": int.parse(_cheffees!.text),
  //   "address": _workcity!.text,
  // }).then((value) => print("Updated Successfully"));
  // CollectionReference _collectionRef =
  //     FirebaseFirestore.instance.collection("chefs");
  // return _collectionRef.doc(FirebaseAuth.instance.currentUser!.uid).update({
  //   "experience": int.parse(_workexperience!.text),
  //   //'lastname': _workpreference!.text,
  //   "cheffees": int.parse(_cheffees!.text),
  //   "address": _workcity!.text,
  // }).then((value) => print("Updated Successfully"));

  Future<String?> open_curloc_Dialog(data) => showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Current Location Data'),
          content: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  TextField(
                    keyboardType: TextInputType.name,
                    controller: _currentcity =
                        TextEditingController(text: data['city']),
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: 'Enter your Current City',
                      hintStyle: TextStyle(
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    keyboardType: TextInputType.name,
                    controller: _currentcountry =
                        TextEditingController(text: data['country']),
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: 'Enter your Country',
                      hintStyle: TextStyle(
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    // style: TextStyle(color: Colors.black),
                    // readOnly: true,
                    // enabled: false,
                    keyboardType: TextInputType.name,
                    controller: _currentcitypincode =
                        TextEditingController(text: data['pincode']),
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: 'Enter your Current Area Pincode',
                      hintStyle: TextStyle(
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: cancel,
              child: Text(
                'Cancel',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            TextButton(
              onPressed: submit_curr,
              child: Text(
                'Update',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
          ],
        ),
      );

  void submit_curr() {
    Navigator.of(context).pop();
    updateCurLocData();
  }

  updateCurLocData() {
    print(_currentcity!.text);
    // var current_user_uid = FirebaseAuth.instance.currentUser!.uid;
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection("chefs");
    return _collectionRef.doc(FirebaseAuth.instance.currentUser!.uid).update({
      "city": _currentcity!.text,
      'country': _currentcountry!.text,
      "pincode": _currentcitypincode!.text,
    }).then((value) => print("Updated Successfully"));
  }

  final salary = [
    'under 10,000',
    '10,000 - 20,000',
    '20,000 - 40,000',
    'above 40,000'
  ];
  String? _salaryRange;

  DropdownMenuItem<String> buildMenuItem(String salary) => DropdownMenuItem(
        value: salary,
        child: Text(
          salary,
          style: TextStyle(fontSize: 18),
        ),
      );

  Future<String?> open_work_Dialog(data) => showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            'Work Data',
            style: TextStyle(
              fontFamily: 'Montserrat',
            ),
          ),
          content: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  TextField(
                    keyboardType: TextInputType.name,
                    controller: _workexperience =
                        TextEditingController(text: data['experience']),
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: 'Enter your Experience',
                      hintStyle: TextStyle(
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    keyboardType: TextInputType.name,
                    controller: _workpreference =
                        TextEditingController(text: data['workpreference']),
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: 'Enter your Work Preference',
                      hintStyle: TextStyle(
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    keyboardType: TextInputType.name,
                    controller: _cheffees =
                        TextEditingController(text: data['cheffees']),
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: 'Enter Cost Per Day',
                      hintStyle: TextStyle(
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    keyboardType: TextInputType.name,
                    controller: _cheffees =
                        TextEditingController(text: data['city']),
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: 'Enter Work City',
                      hintStyle: TextStyle(
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // TextField(
                  //   keyboardType: TextInputType.name,
                  //   controller: _cheffees =
                  //       TextEditingController(text: data['cheffees']),
                  //   autofocus: true,
                  //   decoration: InputDecoration(hintText: 'Enter Cost Per Day'),
                  // ),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Current Salary Per Month',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      prefixIcon: Icon(Icons.money),
                      fillColor: Colors.white60,
                      // hintText: 'Select Current Salary',
                      hintStyle: TextStyle(color: Colors.black, fontSize: 15),
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
                    autofocus: false,
                    value: _salaryRange,
                    isExpanded: true,
                    iconSize: 25,
                    icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                    items: salary.map(buildMenuItem).toList(),
                    onChanged: (svalue) => setState(() {
                      this._salaryRange = svalue;
                      _salaryrange!.text = svalue!;
                    }),
                    onSaved: (lvalue) {
                      _salaryrange!.text = lvalue!;
                    },
                    validator: (lvalue) {
                      if (lvalue == null) {
                        return "Select your Salary per Month";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // TextField(
                  //   onTap: () => Utils.showSheet(
                  //     context,
                  //     child: buildDatePicker(),
                  //     onClicked: () {
                  //       final date_value =
                  //           DateFormat('dd/MM/yyyy').format(dateTime);
                  //       // Utils.showSnackBar(context, 'Selected "$date_value"');
                  //       date = date_value;
                  //       Navigator.of(context).pop();
                  //       // Navigator.pop(context);
                  //     },
                  //   ),
                  //   controller: _dobController =
                  //       TextEditingController(text: data['dob']),
                  //   readOnly: true,
                  //   autofocus: true,
                  //   decoration: InputDecoration(
                  //     hintText: 'Click to Enter your DOB',
                  //     hintStyle: TextStyle(
                  //       fontFamily: 'Montserrat',
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController =
                        TextEditingController(text: data['email']),
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                      hintStyle: TextStyle(
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: cancel,
              child: Text(
                'Cancel',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            TextButton(
              onPressed: submit_work,
              child: Text('Update'),
            ),
          ],
        ),
      );

  void submit_work() {
    Navigator.of(context).pop();
    updateworkData();
  }

  updateworkData() {
    // var current_user_uid = FirebaseAuth.instance.currentUser!.uid;
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection("chefs");
    return _collectionRef.doc(FirebaseAuth.instance.currentUser!.uid).update({
      "city": _currentcity!.text,
      'country': _currentcountry!.text,
      "pincode": _currentcitypincode!.text,
    }).then((value) => print("Updated Successfully"));
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("chefs")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          var data = snapshot.data;
          var dishes = [] + data["cuisineexpert"];
          if (data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Align(
                    alignment: Alignment(0.0, 0.0),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        SizedBox(
                          width: width,
                          height: 235.0,
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: <Widget>[
                              SizedBox(
                                width: 370.0,
                                height: 200.0,
                                child: Stack(
                                  alignment: Alignment.topCenter,
                                  children: <Widget>[
                                    Positioned(
                                      bottom: 0,
                                      child: Container(
                                        width: width - 50,
                                        height: 160.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(38.0),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black
                                                  .withOpacity(0.16),
                                              offset: Offset(0, 3.0),
                                              blurRadius: 12.0,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 110.0,
                                      height: 115.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.elliptical(55.0, 57.5)),
                                        image: DecorationImage(
                                          image:
                                              NetworkImage(data['profilepic']),
                                          // AssetImage('assets/CCI1.png'),
                                          fit: BoxFit.cover,
                                        ),
                                        border: Border.all(
                                          width: 3.0,
                                          color: Colors.indigo,
                                        ),
                                      ),
                                      child: InkWell(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 70, horizontal: 80),
                                          child: Icon(
                                            Icons.camera_alt,
                                            size: 30,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        onTap: () {
                                          ImagePickerMethod();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 89.0,
                                child: Text(
                                  data['chefid'],
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 55.0,
                                child: Text(
                                  '${data['firstname']} ${data['lastname']}',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   height: 15,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Personal Details',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          await open_curloc_Dialog0(data);
                        },
                        child: Icon(
                          Icons.edit,
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                    ),
                    child: Container(
                      width: width - 40,
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.16),
                            offset: Offset(0, 3.0),
                            blurRadius: 12.0,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 20),
                            child: Row(
                              children: [
                                Text(
                                  'First Name:',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    (() {
                                      if (data['firstname'] == null) {
                                        return "please add...";
                                      }
                                      return data['firstname'];
                                    })(),
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            // padding: const EdgeInsets.all(4.0),
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            child: Row(
                              children: [
                                Text(
                                  'Lastname:',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    (() {
                                      if (data['lastname'] == null) {
                                        return "please add...";
                                      }
                                      return data['lastname'];
                                    })(),
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            child: Row(
                              children: [
                                Text(
                                  'Mobile 1:',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    (() {
                                      if (data['mobile1'] == null) {
                                        return "please add...";
                                      }
                                      return data['mobile1'];
                                    })(),
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            child: Row(
                              children: [
                                Text(
                                  'Mobile 2:',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    (() {
                                      if (data['mobile2'] == null) {
                                        return "please add...";
                                      }
                                      return data['mobile2'];
                                    })(),
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            child: Row(
                              children: [
                                Text(
                                  'D.O.B:',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    (() {
                                      if (data['dob'] == null) {
                                        return "please add...";
                                      }
                                      return data['dob'].substring(0, 10);
                                    })(),
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            child: Row(
                              children: [
                                Wrap(children: [
                                  Text(
                                    'Email Id:',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ]),
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    (() {
                                      if (data['email'] == null) {
                                        return "please add...";
                                      }
                                      return data['email'];
                                    })(),
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Current Location',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            open_curloc_Dialog(data);
                          },
                          child: Icon(
                            Icons.edit,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    width: width - 40,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.16),
                          offset: Offset(0, 3.0),
                          blurRadius: 12.0,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Row(
                            children: [
                              Text(
                                'City:',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.0,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  (() {
                                    if (data['city'] == null) {
                                      return "please add...";
                                    }
                                    return data['city'];
                                  })(),
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.0,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Row(
                            children: [
                              Text(
                                'Country:',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.0,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  (() {
                                    if (data['country'] == null) {
                                      return "please add...";
                                    }
                                    return data['country'];
                                  })(),
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.0,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Row(
                            children: [
                              Text(
                                'Pincode:',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.0,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  (() {
                                    if (data['pincode'] == null) {
                                      return "please add...";
                                    }
                                    return data['pincode'];
                                  })(),
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.0,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Work',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            open_curloc_Dialog2(data);
                          },
                          child: Icon(
                            Icons.edit,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    width: width - 40,
                    height: 220,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.16),
                          offset: Offset(0, 3.0),
                          blurRadius: 12.0,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            top: 20,
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Experience:',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.0,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  (() {
                                    if (data['experience'] == null) {
                                      return "please add...";
                                    }
                                    return data['experience'].toString();
                                  })(),
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                              Text(
                                'years',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            top: 10,
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Work Preference:',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.0,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  (() {
                                    if (data['workpreference'] == null) {
                                      return "please add...";
                                    }
                                    return data['workpreference'];
                                  })(),
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.0,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            top: 10,
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Cost Per Day:',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.0,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  (() {
                                    if (data['cheffees'] == null) {
                                      return "please add...";
                                    }
                                    return data['cheffees'].toString();
                                  })(),
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.0,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            top: 10,
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Salary Range:',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.0,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  (() {
                                    if (data['currentsalary'] == null) {
                                      return "please add...";
                                    }
                                    return data['currentsalary'];
                                  })(),
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.0,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            top: 10,
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Address:',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.0,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  (() {
                                    if (data['address'] == null) {
                                      return "please add...";
                                    }
                                    return data['address'];
                                  })(),
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.0,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Cuisine Expert",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            fontSize: 18.0,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            _showMultiSelect();
                          },
                          icon: Icon(
                            Icons.edit,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 130,
                    width: width - 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.16),
                          offset: Offset(0, 3.0),
                          blurRadius: 12.0,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        //
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Wrap(
                                spacing: 5,
                                children: dishes
                                    .map((e) => Chip(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                          backgroundColor:
                                              Colors.indigo.shade100,
                                          label: Text(
                                            e,
                                            style: TextStyle(
                                              color: Colors.indigo.shade700,
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12.0,
                                            ),
                                          ),
                                        ))
                                    .toList(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Dishes',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => chefcustomised(),
                              ),
                            );
                          },
                          child: Icon(
                            Icons.add,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Menu',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => predefined(),
                              ),
                            );
                          },
                          child: Icon(
                            Icons.add,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'View Dishes and Menu',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => viewdish(),
                              ),
                            );
                          },
                          child: Icon(Icons.list),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: SizedBox(
                      height: 50,
                      width: 150,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.purple.shade600,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut();
                          Navigator.pushAndRemoveUntil(
                              (context),
                              MaterialPageRoute(
                                  builder: (context) => ChefConnectMain()),
                              (route) => false);
                        },
                        child: Text(
                          'Log Out',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
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
  final List<String> _selectedcusine = [];

// This function is triggered when a checkbox is checked or unchecked
  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedcusine.add(itemValue);
      } else {
        _selectedcusine.remove(itemValue);
      }
    });
  }

  // this function is called when the Cancel button is pressed

// this function is called when the Submit button is tapped
  void _submit() {
    print('--=========--------------');
    print(_selectedcusine);

    Navigator.pop(context, _selectedcusine);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Cuisine'),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items
              .map((item) => CheckboxListTile(
                    value: _selectedcusine.contains(item),
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
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        ElevatedButton(
          child: const Text('Submit'),
          onPressed: () async {
            FirebaseFirestore.instance
                .collection('chefs')
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .update({'cuisineexpert': _selectedcusine});
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
