import 'dart:io';

import 'package:chef_connect_india/Helper/model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProfilePageUser extends StatefulWidget {
  String? documentId;

  ProfilePageUser(this.documentId);
  @override
  MapScreenState createState() => MapScreenState(documentId);
}

class MapScreenState extends State<ProfilePageUser>
    with SingleTickerProviderStateMixin {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();

  TextEditingController _controller = TextEditingController();
  TextEditingController _controller1 = TextEditingController();

  @override
  String? oldFullName;
  String? oldMobileNumber;
  String? oldfirstname;
  String? oldlastname;
  String? olddob;
  String? oldcity;
  String? oldprofilepic;
  String? oldcountry;
  String? oldpincode;
  String? oldmobile2;
  String? oldworkpreference;
  String? oldcurrentsalary;
  String? oldexpectedsalary;
  String? oldcheffees;
  String? oldexperience;
  String? oldcuisineexpert;
  String? oldspecialities;
  String? oldmenuimages;
  String? oldrating;
  String? oldeducation;
  String? oldlanguages;
  String? oldaddress;
  String? oldpoi; //proof of identity
  String? oldaadhar;
  String? oldpan;
  String? oldverified;

  String? newFullName;
  String? newMobileNumber;
  String? documentId;
  String? newfirstname;
  String? newlastname;
  String? newdob;
  String? newcity;
  String? newprofilepic;
  String? newcountry;
  String? newpincode;
  String? newmobile2;
  String? newworkpreference;
  String? newcurrentsalary;
  String? newexpectedsalary;
  String? newcheffees;
  String? newexperience;
  String? newcuisineexpert;
  String? newspecialities;
  String? newmenuimages;
  String? newrating;
  String? neweducation;
  String? newlanguages;
  String? newaddress;
  String? newpoi; //proof of identity
  String? newaadhar;
  String? newpan;
  String? newverified;

  MapScreenState(this.documentId);
  void initState() {
    super.initState();
    print(documentId);
    FirebaseFirestore.instance
        .collection("chefs")
        .doc(documentId)
        .get()
        .then((value) {
      // print(value['aadharNumber']);

      oldFullName = value['firstname'];
      // oldemail: value['email'];
      // oldlastname: value['lastname'];
      // olddob: value['dob'];
      // oldcity: value['city'];
      // oldprofilepic: value['profilepic'];
      // oldcountry: value['country'];
      // oldpincode: value['pincode'];
      // oldmobile2: value['mobile2'];
      // oldworkpreference: value['workpreference'];
      // oldcurrentsalary: value['currentsalary'];
      // oldexpectedsalary: value['expectedsalary'];
      // oldcheffees: value['cheffees'];
      // oldexperience: value['experience'];
      // oldcuisineexpert: value['cuisineexpert'];
      // oldspecialities: value['specialities'];
      // oldmenuimages: value['menuimages'];
      // oldrating: value['rating'];
      // oldeducation: value['education'];
      // oldlanguages: value['languages'];
      // oldlevel: value['level'];
      // oldprofessionallevel: value['professionallevel'];
      // oldaddress: value['address'];
      // oldpoi: value['proof of identity'];
      // oldaadhar: value['aadhar'];
      // oldpan: value['professionallevel'];
      //oldMobileNumber = value['city'];

      print(oldfirstname);
      _controller.text = oldFullName.toString();
      _controller1.text = oldMobileNumber.toString();
    });
    _controller = new TextEditingController(text: oldFullName);
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
    Reference ref =
        FirebaseStorage.instance.ref().child("profileURL's").child(documentId!);
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    await ref.putFile(image!);
    downloadURL = await ref.getDownloadURL();
    if (downloadURL != null) {
      Firebasehelper.updatepic(documentId, downloadURL);
    }
  }

  @override
  Widget build(BuildContext context) {
    User? user = _auth.currentUser;
    return Scaffold(
        body: Container(
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: 250.0,
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(left: 20.0, top: 20.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 25.0),
                              child: Text('PROFILE',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                      fontFamily: 'sans-serif-light',
                                      color: Colors.black)),
                            )
                          ],
                        )),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Stack(fit: StackFit.loose, children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                width: 140.0,
                                height: 140.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                                    fit: BoxFit.cover,
                                  ),
                                )),
                          ],
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 90.0, right: 100.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    ImagePickerMethod();
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: Colors.red,
                                    radius: 25.0,
                                    child: Icon(
                                      Icons.camera_alt,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            )),
                      ]),
                    )
                  ],
                ),
              ),
              Container(
                color: Color(0xffFFFFFF),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    'Personal Information',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  _status ? _getEditIcon() : Container(),
                                ],
                              )
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    'Name',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Flexible(
                                child: TextField(
                                  controller: _controller,
                                  // ..text = oldFullName;
                                  decoration: const InputDecoration(
                                      // hintText: "Enter Your Name",
                                      ),
                                  onChanged: (value) {
                                    setState(() {
                                      newFullName = value;
                                    });
                                    newFullName == null
                                        ? newFullName = oldFullName
                                        : newFullName = newFullName;
                                  },
                                  enabled: !_status,
                                  autofocus: !_status,
                                ),
                              ),
                            ],
                          )),
                      !_status ? _getActionButtons() : Container(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    ));
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  child: RaisedButton(
                child: Text("Save"),
                textColor: Colors.white,
                color: Colors.green,
                onPressed: () {
                  //Firebasehelper.updateAppointment(documentId, newFullName);
                  print('==========;');
                  print(documentId);
                  //Firebasehelper.updatemsg(documentId, newFullName);
                  // var a='4kPFZNe1JbYyF3hJ4omFks6MMbN2';
                  //Firebasehelper.updatemsg(documentId, "confirmed");
                  // handleUpdateData();
                  // print(newFullName);
                  setState(() {
                    if (newFullName != null) {
                      Firebasehelper.updatemsg(documentId, newFullName);
                      // print(documentId);
                      // var firebaseUser = FirebaseAuth.instance.currentUser;
                      // FirebaseFirestore.instance
                      //     .collection("chefs")
                      //     .doc(documentId)
                      //     .update({
                      //   "firstname": newFullName,
                      //   "mobile1": newMobileNumber
                      // }).then((_) {
                      //   print("success!");
                      // });
                    }
                    _status = true;
                    FocusScope.of(context).requestFocus(FocusNode());
                  });
                  print('=================');
                  print(newFullName);
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  child: RaisedButton(
                child: Text("Cancel"),
                textColor: Colors.white,
                color: Colors.red,
                onPressed: () {
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(FocusNode());
                  });
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return GestureDetector(
      child: CircleAvatar(
        backgroundColor: Colors.red,
        radius: 14.0,
        child: Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }
}
