// import 'package:chef_connect_india/Main%20Screen/User_login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class user_profile extends StatefulWidget {
  @override
  _user_profileState createState() => _user_profileState();
}

class _user_profileState extends State<user_profile> {
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

  // setDataToTextField(data) {
  //   return Column(
  //     children: [
  //       TextFormField(
  //         controller: _firstnameController =
  //             TextEditingController(text: data['firstname']),
  //       ),
  //       TextFormField(
  //         controller: _phoneController =
  //             TextEditingController(text: data['mobile1']),
  //       ),
  //       TextFormField(
  //         controller: _emailController =
  //             TextEditingController(text: data['email']),
  //       ),
  //       ElevatedButton(onPressed: () => updateData(), child: Text("Update"))
  //     ],
  //   );
  // }

  updateData() {
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection("users");
    return _collectionRef.doc(FirebaseAuth.instance.currentUser!.uid).update({
      "firstname": _firstnameController!.text,
      'lastname': _lastnameController!.text,
      "mobile1": _phoneController!.text,
      "email": _emailController!.text,
      'mobile2': _phone2Controller!.text,
      'dob': _dobController!.text,
      'city': _cityController!.text,
      'country': _countryController!.text,
      'pincode': _pincodeController!.text,
    }).then((value) => print("Updated Successfully"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
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
            // return setDataToTextField(data);
            return Center(
              child: Container(
                padding: EdgeInsets.all(32),
                child: Column(
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
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Email',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(data['email'])
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Mobile 1',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(data['mobile1'])
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Mobile 2',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(data['mobile2'])
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Date of Birth',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(data['dob'])
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'City',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(data['city'])
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
                        Text(data['country'])
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Pincode',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(data['pincode'])
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      child: Text('open dialog'),
                      onPressed: () async {
                        await openDialog(data);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      )),
    );
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
                    controller: _countryController =
                        TextEditingController(text: data['country']),
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
    updateData();
  }
}
