// // import 'package:chef_connect_india/Main%20Screen/User_login.dart';
// import 'package:chef_connect_india/Drawers/navigation_drawer.dart';
// // import 'package:chef_connect_india/Helper/model.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class user_profile extends StatefulWidget {
//   @override
//   _user_profileState createState() => _user_profileState();
// }

// class _user_profileState extends State<user_profile> {
//   var date = DateTime.now();
//   TextEditingController? _firstnameController;
//   TextEditingController? _lastnameController;
//   TextEditingController? _phoneController;
//   TextEditingController? _phone2Controller;
//   TextEditingController? _emailController;
//   TextEditingController? _dobController;
//   TextEditingController? _cityController;
//   TextEditingController? _countryController;
//   TextEditingController? _pincodeController;
//   // TextEditingController? _dateController;

//   Future pickDate(BuildContext context) async {
//     final initialDate = DateTime.now();
//     final newDate = await showDatePicker(
//       context: context,
//       initialDate: initialDate,
//       firstDate: DateTime(DateTime.now().year - 5),
//       lastDate: DateTime(DateTime.now().year + 5),
//     ).then((selectedDate) {
//       if (selectedDate != null) {
//         _dobController?.text = DateFormat('dd-MM-yyyy').format(selectedDate);
//         ;
//       }
//     });

//     if (newDate == null) return;

//     setState(() => date = newDate);
//   }

//   String name = '';

//   // setDataToTextField(data) {
//   //   return Column(
//   //     children: [
//   //       TextFormField(
//   //         controller: _firstnameController =
//   //             TextEditingController(text: data['firstname']),
//   //       ),
//   //       TextFormField(
//   //         controller: _phoneController =
//   //             TextEditingController(text: data['mobile1']),
//   //       ),
//   //       TextFormField(
//   //         controller: _emailController =
//   //             TextEditingController(text: data['email']),
//   //       ),
//   //       ElevatedButton(onPressed: () => updateData(), child: Text("Update"))
//   //     ],
//   //   );
//   // }

//   updateData() {
//     // var current_user_uid = FirebaseAuth.instance.currentUser!.uid;
//     CollectionReference _collectionRef =
//         FirebaseFirestore.instance.collection("users");
//     return _collectionRef.doc(FirebaseAuth.instance.currentUser!.uid).update({
//       "firstname": _firstnameController!.text,
//       'lastname': _lastnameController!.text,
//       "mobile1": _phoneController!.text,
//       "email": _emailController!.text,
//       'mobile2': _phone2Controller!.text,
//       'dob': _dobController?.text,
//       'city': _cityController!.text,
//       'country': _countryController!.text,
//       'pincode': _pincodeController!.text,
//       'username':
//           '${_firstnameController!.text.toString().substring(0, 2)}_${_lastnameController!.text.toString().substring(0, 2)}',
//     }).then((value) => print("Updated Successfully"));
//   }

//   // Future pickDate(BuildContext context) async {
//   //   final initialDate = DateTime.now();
//   //   final newDate = await showDatePicker(
//   //       context: context,
//   //       initialDate: initialDate,
//   //       firstDate: DateTime(DateTime.now().year - 5),
//   //       lastDate: DateTime(DateTime.now().year + 5));

//   //   if (newDate == null) return;
//   //   setState(() => date = newDate);
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: NavBar(),
//       appBar: AppBar(
//         backgroundColor: Colors.indigo,
//         // shadowColor: Colors.deepPurpleAccent,
//         toolbarHeight: 70, // default is 56
//         // toolbarOpacity: 0.5,
//         elevation: 50.0,
//         title: Text('Chef Connect India'),
//       ),
//       body: SafeArea(
//           child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: StreamBuilder(
//           stream: FirebaseFirestore.instance
//               .collection("users")
//               .doc(FirebaseAuth.instance.currentUser!.uid)
//               .snapshots(),
//           builder: (BuildContext context, AsyncSnapshot snapshot) {
//             var data = snapshot.data;
//             if (data == null) {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//             // return setDataToTextField(data);
//             return SingleChildScrollView(
//               child: Center(
//                 child: Container(
//                   padding: EdgeInsets.all(32),
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           Expanded(
//                             child: Text(
//                               'Username',
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 12,
//                           ),
//                           Text(data['username'])
//                         ],
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: Text(
//                               'First Name',
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 12,
//                           ),
//                           Text(data['firstname'])
//                         ],
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: Text(
//                               'Last Name',
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 12,
//                           ),
//                           Text(data['lastname'])
//                         ],
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: Text(
//                               'Email',
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 12,
//                           ),
//                           Text(data['email'])
//                         ],
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: Text(
//                               'Mobile 1',
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 12,
//                           ),
//                           Text(data['mobile1'])
//                         ],
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: Text(
//                               'Mobile 2',
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 12,
//                           ),
//                           Text(data['mobile2'].toString())
//                         ],
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: Text(
//                               'Date of Birth',
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 12,
//                           ),
//                           Text(data['dob'].toString())
//                         ],
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: Text(
//                               'City',
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 12,
//                           ),
//                           Text(data['city'].toString())
//                         ],
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: Text(
//                               'Country',
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 12,
//                           ),
//                           Text(data['country'].toString())
//                         ],
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: Text(
//                               'Pincode',
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 12,
//                           ),
//                           Text(data['pincode'].toString())
//                         ],
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: Text(
//                               'Selected Location',
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 12,
//                           ),
//                           Text(data['selectedLocation'].toString())
//                         ],
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: Text(
//                               'Hiremode',
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 12,
//                           ),
//                           Text(data['hiremode'].toString())
//                         ],
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       ElevatedButton(
//                         child: Text('Update Details'),
//                         onPressed: () async {
//                           await openDialog(data);
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       )),
//     );
//   }

//   Future<String?> openDialog(data) => showDialog<String>(
//         context: context,
//         builder: (context) => AlertDialog(
//           title: Text('Profile Data'),
//           content: SingleChildScrollView(
//             child: Container(
//               child: Column(
//                 children: [
//                   TextField(
//                     controller: _firstnameController =
//                         TextEditingController(text: data['firstname']),
//                     autofocus: true,
//                     decoration:
//                         InputDecoration(hintText: 'Enter your First Name'),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   TextField(
//                     controller: _lastnameController =
//                         TextEditingController(text: data['lastname']),
//                     autofocus: true,
//                     decoration:
//                         InputDecoration(hintText: 'Enter your Last Name'),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   TextField(
//                     controller: _emailController =
//                         TextEditingController(text: data['email']),
//                     autofocus: true,
//                     decoration: InputDecoration(hintText: 'Enter your email'),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   TextField(
//                     // readOnly: true,
//                     enabled: false,
//                     controller: _phoneController =
//                         TextEditingController(text: data['mobile1']),
//                     autofocus: true,
//                     decoration:
//                         InputDecoration(hintText: 'Enter your Mobile Num 1'),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   TextField(
//                     controller: _phone2Controller =
//                         TextEditingController(text: data['mobile2']),
//                     autofocus: true,
//                     decoration:
//                         InputDecoration(hintText: 'Enter your Mobile Num 2'),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   TextField(
//                     onTap: () => pickDate(context),
//                     controller: _dobController,
//                     readOnly: true,
//                     // decoration: InputDecoration(
//                     //   labelText: 'Date',
//                     // ),
//                     autofocus: true,
//                     decoration: InputDecoration(hintText: 'Enter your DOB'),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   TextField(
//                     controller: _cityController =
//                         TextEditingController(text: data['city']),
//                     autofocus: true,
//                     decoration: InputDecoration(hintText: 'Enter your City'),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   TextField(
//                     controller: _countryController =
//                         TextEditingController(text: data['country']),
//                     autofocus: true,
//                     decoration: InputDecoration(hintText: 'Enter your Country'),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   TextField(
//                     controller: _pincodeController =
//                         TextEditingController(text: data['pincode']),
//                     autofocus: true,
//                     decoration: InputDecoration(hintText: 'Enter your Pincode'),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: submit,
//               child: Text('Submit'),
//             ),
//           ],
//         ),
//       );

// ignore_for_file: unnecessary_null_comparison

//   void submit() {
//     Navigator.of(context).pop();
//     updateData();
//   }
// }
import 'dart:io';

import 'package:chef_connect_india/Helper/model.dart';
import 'package:chef_connect_india/Helper/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class user_profile extends StatefulWidget {
  user_profile({
    Key? key,
  }) : super(key: key);

  @override
  State<user_profile> createState() => _user_profileState();
}

class _user_profileState extends State<user_profile> {
  DateTime dateTime = DateTime.now();
  late String date;
  TextEditingController? _firstnameController;
  TextEditingController? _lastnameController;
  TextEditingController? _phoneController;
  TextEditingController? _phone2Controller;
  TextEditingController? _emailController;
  TextEditingController? _dobController;
  TextEditingController? _cityController;
  TextEditingController? _countryController;
  TextEditingController? _pincodeController;

  updateData() {
    // var current_user_uid = FirebaseAuth.instance.currentUser!.uid;
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection("users");
    return _collectionRef.doc(FirebaseAuth.instance.currentUser!.uid).update({
      "firstname": _firstnameController!.text,
      'lastname': _lastnameController!.text,
      "mobile1": _phoneController!.text,
      "email": _emailController!.text,
      'mobile2': _phone2Controller!.text,
      'city': _cityController!.text,
      'country': _countryController!.text,
      'pincode': _pincodeController!.text,
      'username':
          '${_firstnameController!.text.toString().substring(0, 4)}${_lastnameController!.text.toString().substring(0, 4)}',
    }).then((value) => print("Updated Successfully"));
  }

  update_Date(date) {
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection("users");
    return _collectionRef.doc(FirebaseAuth.instance.currentUser!.uid).update({
      'dob': date,
    }).then((value) => print("Updated Successfully"));
  }

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    ).then((selectedDate) {
      if (selectedDate != null) {
        _dobController?.text = DateFormat('dd-MM-yyyy').format(selectedDate);
        ;
      }
    });

    if (newDate == null) return;

    setState(() => date = newDate);
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
        .child("user-profile")
        .child(FirebaseAuth.instance.currentUser!.uid);
    await ref.putFile(image!);
    downloadURL = await ref.getDownloadURL();

    if (downloadURL != null) {
      FirebaseUserhelper.updatepic(
          FirebaseAuth.instance.currentUser!.uid, downloadURL);
    }
  }

  var data_doc = FirebaseFirestore.instance
      .collection("users")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: 70,
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: Text('My Profile'),
        actions: <Widget>[],
      ),
      floatingActionButton: SpeedDial(
          child: IconButton(
              onPressed: () async {
                await openDialog();
              },
              icon: Icon(Icons.edit))),
      body: SafeArea(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("users")
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              var data = snapshot.data;
              if (data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Stack(
                        children: [
                          Container(
                            margin:
                                EdgeInsets.only(top: 48, left: 20, right: 20),
                            height: 230,
                            width: width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.16),
                                  offset: Offset(0, 3.0),
                                  blurRadius: 12.0,
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: SizedBox(
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 60.0,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                      child: Align(
                                        alignment: Alignment.bottomRight,
                                        child: CircleAvatar(
                                            backgroundColor:
                                                Colors.grey.shade300,
                                            radius: 18.0,
                                            child: IconButton(
                                                onPressed: () {
                                                  ImagePickerMethod();
                                                },
                                                icon: Icon(
                                                  Icons.camera_alt,
                                                  size: 18,
                                                  color: Colors.black,
                                                ))),
                                      ),
                                      radius: 60.0,
                                      backgroundImage: NetworkImage(
                                        data['profilepic'],
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Container(
                                      padding: EdgeInsets.only(top: 12),
                                      child: Text(
                                        '${data['firstname']} ${data['lastname']}',
                                        style: TextStyle(
                                          fontFamily: 'SF Pro',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 24.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Container(
                                      padding: EdgeInsets.only(top: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Username:',
                                            style: TextStyle(
                                              fontFamily: 'SF Pro',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.0,
                                            ),
                                          ),
                                          Text(
                                            '${data['username']}',
                                            style: TextStyle(
                                              fontFamily: 'SF Pro',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 18.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Container(
                                      padding: EdgeInsets.only(top: 16),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Mobile:',
                                            style: TextStyle(
                                              fontFamily: 'SF Pro',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.0,
                                            ),
                                          ),
                                          Text(
                                            ' ${data['mobile1']}',
                                            style: TextStyle(
                                              fontFamily: 'SF Pro',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 18.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Container(
                                      padding: EdgeInsets.only(top: 16),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'City: ',
                                            style: TextStyle(
                                              fontFamily: 'SF Pro',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.0,
                                            ),
                                          ),
                                          Text(
                                            (() {
                                              if (data['city'] == null) {
                                                return "please add...";
                                              }
                                              return data['city'];
                                            })(),
                                            style: TextStyle(
                                              fontFamily: 'SF Pro',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 18.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(
                      //   height: 20,
                      // ),

                      Container(
                        margin: EdgeInsets.only(
                          top: 20,
                          left: 20,
                          right: 20,
                        ),
                        height: 260,
                        width: width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.16),
                              offset: Offset(0, 3.0),
                              blurRadius: 12.0,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding:
                                  EdgeInsets.only(top: 16, left: 16, right: 16),
                              child: Row(
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Mobile 2 : ',
                                    style: TextStyle(
                                      fontFamily: 'SF Pro',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  Text(
                                    (() {
                                      if (data['mobile2'] == null) {
                                        return "please add...";
                                      }
                                      return data['mobile2'];
                                    })(),
                                    style: TextStyle(
                                      fontFamily: 'SF Pro',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.only(top: 16, left: 16, right: 16),
                              child: Row(
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Email : ',
                                    style: TextStyle(
                                      fontFamily: 'SF Pro',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  Text(
                                    (() {
                                      if (data['email'] == null) {
                                        return "please add...";
                                      }
                                      return data['email'];
                                    })(),
                                    // ' ${data['email']}',
                                    style: TextStyle(
                                      fontFamily: 'SF Pro',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.only(top: 16, left: 16, right: 16),
                              child: Row(
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Date of Birth : ',
                                    style: TextStyle(
                                      fontFamily: 'SF Pro',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  Text(
                                    (() {
                                      if (data['dob'] == null) {
                                        return "please add...";
                                      }
                                      return data['dob'];
                                    })(),
                                    style: TextStyle(
                                      fontFamily: 'SF Pro',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: CircleAvatar(
                                        backgroundColor: Colors.black,
                                        radius: 15,
                                        child: IconButton(
                                          onPressed: () {
                                            Utils.showSheet(
                                              context,
                                              child: buildDatePicker(),
                                              onClicked: () {
                                                final date_value =
                                                    DateFormat('dd/MM/yyyy')
                                                        .format(dateTime);
                                                // Utils.showSnackBar(context, 'Selected "$date_value"');
                                                date = date_value;
                                                update_Date(date);
                                                Navigator.of(context).pop();
                                                // Navigator.pop(context);
                                              },
                                            );
                                          },
                                          icon: Icon(
                                            Icons.edit,
                                            size: 15,
                                          ),
                                        )),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.only(top: 16, left: 16, right: 16),
                              child: Row(
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'City : ',
                                    style: TextStyle(
                                      fontFamily: 'SF Pro',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  Text(
                                    (() {
                                      if (data['city'] == null) {
                                        return "please add...";
                                      }
                                      return data['city'];
                                    })(),
                                    style: TextStyle(
                                      fontFamily: 'SF Pro',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.only(top: 16, left: 16, right: 16),
                              child: Row(
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Country : ',
                                    style: TextStyle(
                                      fontFamily: 'SF Pro',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  Text(
                                    (() {
                                      if (data['country'] == null) {
                                        return "please add...";
                                      }
                                      return data['country'];
                                    })(),
                                    // ' ${data['country']}',
                                    style: TextStyle(
                                      fontFamily: 'SF Pro',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.only(top: 16, left: 16, right: 16),
                              child: Row(
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Pincode : ',
                                    style: TextStyle(
                                      fontFamily: 'SF Pro',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  Text(
                                    (() {
                                      if (data['pincode'] == null) {
                                        return "please add...";
                                      }
                                      return data['pincode'];
                                    })(),
                                    // ' ${data['pincode']}',
                                    style: TextStyle(
                                      fontFamily: 'SF Pro',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                        height: 90,
                        width: width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.16),
                              offset: Offset(0, 3.0),
                              blurRadius: 12.0,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding:
                                  EdgeInsets.only(top: 16, left: 16, right: 16),
                              child: Row(
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Prefered City : ',
                                    style: TextStyle(
                                      fontFamily: 'SF Pro',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  Text(
                                    (() {
                                      if (data['selectedLocation'] == null) {
                                        return "please add...";
                                      }
                                      return data['selectedLocation'];
                                    })(),
                                    // ' ${data['selectedLocation']}',
                                    style: TextStyle(
                                      fontFamily: 'SF Pro',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.only(top: 16, left: 16, right: 16),
                              child: Row(
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Prefered Chef Type : ',
                                    style: TextStyle(
                                      fontFamily: 'SF Pro',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  Text(
                                    (() {
                                      if (data['hiremode'] == null) {
                                        return "please add...";
                                      }
                                      return data['hiremode'];
                                    })(),
                                    // ' ${data['hiremode']}',
                                    style: TextStyle(
                                      fontFamily: 'SF Pro',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  Widget buildDatePicker() => SizedBox(
        height: 180,
        child: CupertinoDatePicker(
          minimumYear: 1947,
          maximumYear: DateTime.now().year,
          initialDateTime: dateTime,
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (dateTime) =>
              setState(() => this.dateTime = dateTime),
        ),
      );

  Future<String?> openDialog() => showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Profile Data'),
          content: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("users")
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .snapshots(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                var dataa = snapshot.data;
                if (dataa == null) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: [
                        TextField(
                          controller: _firstnameController =
                              TextEditingController(text: dataa['firstname']),
                          autofocus: true,
                          decoration: InputDecoration(
                              hintText: 'Enter your First Name'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: _lastnameController =
                              TextEditingController(text: dataa['lastname']),
                          autofocus: true,
                          decoration:
                              InputDecoration(hintText: 'Enter your Last Name'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: _emailController =
                              TextEditingController(text: dataa['email']),
                          autofocus: true,
                          decoration:
                              InputDecoration(hintText: 'Enter your email'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          // readOnly: true,
                          enabled: false,
                          controller: _phoneController =
                              TextEditingController(text: dataa['mobile1']),
                          autofocus: true,
                          decoration: InputDecoration(
                              hintText: 'Enter your Mobile Num 1'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: _phone2Controller =
                              TextEditingController(text: dataa['mobile2']),
                          autofocus: true,
                          decoration: InputDecoration(
                              hintText: 'Enter your Mobile Num 2'),
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
                        //       TextEditingController(text: dataa['dob']),
                        //   readOnly: true,
                        //   // decoration: InputDecoration(
                        //   //   labelText: 'Date',
                        //   // ),
                        //   autofocus: true,
                        //   decoration:
                        //       InputDecoration(hintText: 'Enter your DOB'),
                        // ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        TextField(
                          controller: _cityController =
                              TextEditingController(text: dataa['city']),
                          autofocus: true,
                          decoration:
                              InputDecoration(hintText: 'Enter your City'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: _countryController =
                              TextEditingController(text: dataa['country']),
                          autofocus: true,
                          decoration:
                              InputDecoration(hintText: 'Enter your Country'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: _pincodeController =
                              TextEditingController(text: dataa['pincode']),
                          autofocus: true,
                          decoration:
                              InputDecoration(hintText: 'Enter your Pincode'),
                        ),
                      ],
                    ),
                  ),
                );
              }),
          actions: [
            TextButton(
              onPressed: submit,
              child: Text('Submit'),
            ),
          ],
        ),
      );

  void submit() {
    Navigator.of(context).pop();
    updateData();
  }
}
