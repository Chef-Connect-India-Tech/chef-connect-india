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
                child:Column(
                        children: [
                          Row(
                            children: [
                             Expanded(
                            child: Text(
                              'First Name',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                         Text(data['firstname'])
                        
                        ],
                        
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Last Name',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(data['lastname'])
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'address',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(data['address'])
                        ],
                      ),
                      ], )
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
                child:Column(
                        children: [
                          Row(
                            children: [
                             Expanded(
                            child: Text(
                              'mobile2',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                        // Text(data['mobile2'])
                        
                        ],
                        
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'dob',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                         // Text(data['dob'])
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'city',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                         // Text(data['city'])
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Country',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                         // Text(data['city'])
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      
                      ], )
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
                child:Column(
                        children: [
                          Row(
                        children: [
                          Expanded(
                            child: Text(
                              'pincode',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                         // Text(data['city'])
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                          Row(
                            children: [
                             Expanded(
                            child: Text(
                              'email',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                         //Text(data['email'])
                        
                        ],
                        
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Work Preference',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                         // Text(data['lastname'])
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'current salary low',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                         // Text(data['address'])
                        ],
                      ),
                       SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Current salary high',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                         // Text(data['lastname'])
                        ],
                      ),
                      ], )
              ),
              Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Details',
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
                child:Column(
                        children: [
                          Row(
                            children: [
                             Expanded(
                            child: Text(
                              'cheffes',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                        // Text(data['mobile2'])
                        
                        ],
                        
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'experience',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                         Text(data['experience'])
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'cuisineexpert',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                         Text(data['cuisineexpert'])
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'education',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                         // Text(data['city'])
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      
                      ], )
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
                    controller: _phone2Controller =
                        TextEditingController(text: data['dob']),
                    autofocus: true,
                    decoration:
                        InputDecoration(hintText: 'Date of Birth'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _phone2Controller =
                        TextEditingController(text: data['city']),
                    autofocus: true,
                    decoration:
                        InputDecoration(hintText: 'city'),
                  ),
                  
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // TextField(
                  //   controller: _phone2Controller =
                  //       TextEditingController(text: data['country']),
                  //   autofocus: true,
                  //   decoration:
                  //       InputDecoration(hintText: 'country'),
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _phone2Controller =
                        TextEditingController(text: data['email']),
                    autofocus: true,
                    decoration:
                        InputDecoration(hintText: 'email'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _phone2Controller =
                        TextEditingController(text: data['workpreference']),
                    autofocus: true,
                    decoration:
                        InputDecoration(hintText: 'workpreference'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _phone2Controller =
                        TextEditingController(text: data['currentsalary']),
                    autofocus: true,
                    decoration:
                        InputDecoration(hintText: 'currentsalary'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _phone2Controller =
                        TextEditingController(text: data['cheffees']),
                    autofocus: true,
                    decoration:
                        InputDecoration(hintText: 'cheffees'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _phone2Controller =
                        TextEditingController(text: data['experience']),
                    autofocus: true,
                    decoration:
                        InputDecoration(hintText: 'experience'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _phone2Controller =
                        TextEditingController(text: data['cuisineexpert']),
                    autofocus: true,
                    decoration:
                        InputDecoration(hintText: 'cuisineexpert'),
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
