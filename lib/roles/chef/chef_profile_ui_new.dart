import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Chef_profile_ui extends StatefulWidget {
  Chef_profile_ui({Key? key}) : super(key: key);

  @override
  State<Chef_profile_ui> createState() => _Chef_profile_uiState();
}

class _Chef_profile_uiState extends State<Chef_profile_ui> {
  TextEditingController? _firstnameController;
  TextEditingController? _lastnameController;
  TextEditingController? _phoneController;
  TextEditingController? _phone2Controller;
  TextEditingController? _emailController;
  TextEditingController? _dobController;
  TextEditingController? _cityController;
  TextEditingController? _countryController;
  TextEditingController? _pincodeController;

  String name = '';
updateData() {
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection("chefs");
    return _collectionRef.doc(FirebaseAuth.instance.currentUser!.uid).update({
      "firstname": _firstnameController!.text,
      'lastname': _lastnameController!.text,
      "mobile1": _phoneController!.text,
      "email": _emailController!.text,
      'mobile2': _phone2Controller!.text,
      'dob': _dobController!.text,
      'city': _cityController!.text,
    }).then((value) => print("Updated Successfully"));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        // shadowColor: Colors.deepPurpleAccent,
        toolbarHeight: 70, // default is 56
        // toolbarOpacity: 0.5,
        elevation: 50.0,
        title: Text('PROFILE'),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("chefs")
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
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Container(
                height: 180,
                width: 360,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
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
                    SizedBox(
                      height: 20,
                    ),
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Chef Name',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Personal Details',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    width: 135,
                  ),
                  InkWell(
                    onTap: ()async {
                          await openDialog(data);
                        },
                    child: Icon(
                      Icons.edit,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 150,
                width: 360,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.16),
                      offset: Offset(0, 3.0),
                      blurRadius: 12.0,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              
              Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Contact Details',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    width: 148,
                  ),
                  InkWell(
                    onTap: () async {
                          await openDialog(data);
                        },
                    child: Icon(
                      Icons.edit,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 150,
                width: 360,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.16),
                      offset: Offset(0, 3.0),
                      blurRadius: 12.0,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Address',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    width: 211,
                  ),
                  InkWell(
                    onTap: () async {
                          await openDialog(data);
                        },
                    child: Icon(
                      Icons.edit,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 150,
                width: 360,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.16),
                      offset: Offset(0, 3.0),
                      blurRadius: 12.0,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      );
          },
        ),
     ), ),);
  }

  Future<String?> openDialog(data) => showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Profile Data'),
          content: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  TextField(
                    controller: _firstnameController =
                        TextEditingController(text: data['firstname']),
                    autofocus: true,
                    decoration:
                        InputDecoration(hintText: 'Enter your First Name'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _lastnameController =
                        TextEditingController(text: data['lastname']),
                    autofocus: true,
                    decoration:
                        InputDecoration(hintText: 'Enter your Last Name'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _emailController =
                        TextEditingController(text: data['email']),
                    autofocus: true,
                    decoration: InputDecoration(hintText: 'Enter your email'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    // readOnly: true,
                    enabled: false,
                    controller: _phoneController =
                        TextEditingController(text: data['mobile1']),
                    autofocus: true,
                    decoration:
                        InputDecoration(hintText: 'Enter your Mobile Num 1'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _phone2Controller =
                        TextEditingController(text: data['mobile2']),
                    autofocus: true,
                    decoration:
                        InputDecoration(hintText: 'Enter your Mobile Num 2'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _dobController =
                        TextEditingController(text: data['dob']),
                    autofocus: true,
                    decoration: InputDecoration(hintText: 'Enter your DOB'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _cityController =
                        TextEditingController(text: data['city']),
                    autofocus: true,
                    decoration: InputDecoration(hintText: 'Enter your City'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    // controller: _countryController =
                    //     TextEditingController(text: data['country']),
                    autofocus: true,
                    decoration: InputDecoration(hintText: 'Enter your Country'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _pincodeController =
                        TextEditingController(text: data['pincode']),
                    autofocus: true,
                    decoration: InputDecoration(hintText: 'Enter your Pincode'),
                  ),
                ],
              ),
            ),
          ),
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
  }
}
