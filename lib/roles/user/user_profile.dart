// import 'package:chef_connect_india/Main%20Screen/User_login.dart';
import 'package:chef_connect_india/Drawers/navigation_drawer.dart';
// import 'package:chef_connect_india/Helper/model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class user_profile extends StatefulWidget {
  @override
  _user_profileState createState() => _user_profileState();
}

class _user_profileState extends State<user_profile> {
  var date = DateTime.now();
  TextEditingController? _firstnameController;
  TextEditingController? _lastnameController;
  TextEditingController? _phoneController;
  TextEditingController? _phone2Controller;
  TextEditingController? _emailController;
  TextEditingController? _dobController;
  TextEditingController? _cityController;
  TextEditingController? _countryController;
  TextEditingController? _pincodeController;
  // TextEditingController? _dateController;

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    ).then((selectedDate) {
      if (selectedDate != null) {
        _dobController!.text = DateFormat('yyyy-MM-dd').format(selectedDate);
        ;
      }
    });

    if (newDate == null) return;

    setState(() => date = newDate);
  }

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
    // var current_user_uid = FirebaseAuth.instance.currentUser!.uid;
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
      'username':
          '${_firstnameController!.text.toString().substring(0, 2)}_${_lastnameController!.text.toString().substring(0, 2)}',
    }).then((value) => print("Updated Successfully"));
  }

  // Future pickDate(BuildContext context) async {
  //   final initialDate = DateTime.now();
  //   final newDate = await showDatePicker(
  //       context: context,
  //       initialDate: initialDate,
  //       firstDate: DateTime(DateTime.now().year - 5),
  //       lastDate: DateTime(DateTime.now().year + 5));

  //   if (newDate == null) return;
  //   setState(() => date = newDate);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        // shadowColor: Colors.deepPurpleAccent,
        toolbarHeight: 70, // default is 56
        // toolbarOpacity: 0.5,
        elevation: 50.0,
        title: Text('Chef Connect India'),
      ),
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
            return SingleChildScrollView(
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(32),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Username',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(data['username'])
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
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
                          Text(data['mobile2'].toString())
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
                          Text(data['dob'].toString())
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
                          Text(data['city'].toString())
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
                          Text(data['country'].toString())
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
                          Text(data['pincode'].toString())
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Selected Location',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(data['selectedLocation'].toString())
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Hiremode',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(data['hiremode'].toString())
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        child: Text('Update Details'),
                        onPressed: () async {
                          await openDialog(data);
                        },
                      ),
                    ],
                  ),
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
                    onTap: () => pickDate(context),
                    controller: _dobController,
                    readOnly: true,
                    // decoration: InputDecoration(
                    //   labelText: 'Date',
                    // ),
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
