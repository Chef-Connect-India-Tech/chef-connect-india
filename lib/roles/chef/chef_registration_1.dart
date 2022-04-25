// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:chef_connect_india/roles/chef/chef_registration_2.dart';

class chef_registration_one extends StatefulWidget {
  // final String phonenumber;
  // chef_registration_one({required this.phonenumber});

  @override
  State<chef_registration_one> createState() => _chef_registration_oneState();
}

class _chef_registration_oneState extends State<chef_registration_one> {
  String? errorMessage;
  final formGlobalKey = GlobalKey<FormState>();
  final firstNameEditingController = new TextEditingController();
  final lastNameEditingController = new TextEditingController();
  final workExperienceEditingController = new TextEditingController();
  final worklocationEditingController = new TextEditingController();
  final currentlocationEditingController = new TextEditingController();

  final worklocation = ['Jaipur', 'Bangalore'];
  final workType = ['Party Chef', 'Kitchen Professional', 'Private Chef'];
  String? locValue;
  String? cheftypeValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Image.asset(
              "assets/CCI.jpg",
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              scale: 1,
            ),
            SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 80),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        // padding: const EdgeInsets.all(8.0),
                        key: formGlobalKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                bottom: 20,
                              ),
                              child: CircleAvatar(
                                backgroundColor: Color(0xFF092349),
                                radius: 80,
                                child: Image.asset('assets/CCI1.png'),
                              ),
                            ),

                            // firstNameField,
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                autofocus: false,
                                controller: firstNameEditingController,
                                keyboardType: TextInputType.name,
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      !RegExp(r'^[a-z A-Z]+$')
                                          .hasMatch(value)) {
                                    //allow upper and lower case alphabets and space
                                    return "Enter Correct First Name";
                                  } else {
                                    return null;
                                  }
                                },
                                onSaved: (value) {
                                  firstNameEditingController.text = value!;
                                },
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  labelText: 'First Name',
                                  labelStyle: TextStyle(
                                      backgroundColor: Colors.white,
                                      fontFamily: 'Montserrat',
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                  prefixIcon: Icon(Icons.account_circle),
                                  fillColor: Colors.white,
                                  hintText: 'First Name',
                                  hintStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                  focusedBorder: new OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                      color: Colors.white,
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
                            ),

                            // secondNameField,
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                autofocus: false,
                                controller: lastNameEditingController,
                                keyboardType: TextInputType.name,
                                // validator: (value) {
                                //   if (value!.isEmpty ||
                                //       RegExp(r'^[a-z A-Z]+$')
                                //           .hasMatch(value)) {
                                //     //allow upper and lower case alphabets and space
                                //     return "Enter Correct Last Name";
                                //   } else {
                                //     return null;
                                //   }
                                // },
                                onSaved: (value) {
                                  lastNameEditingController.text = value!;
                                },
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  labelText: 'Last Name',
                                  labelStyle: TextStyle(
                                      backgroundColor: Colors.white,
                                      fontFamily: 'Montserrat',
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                  prefixIcon: Icon(Icons.account_circle),
                                  fillColor: Colors.white,
                                  hintText: 'Last Name',
                                  hintStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: Colors.black,
                                      fontSize: 15),
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                  focusedBorder: new OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                      color: Colors.white,
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
                            ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                autofocus: false,
                                controller: workExperienceEditingController,
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      !RegExp(r'^[0-9]+$').hasMatch(value)) {
                                    //allow upper and lower case alphabets and space
                                    return "Enter Experience";
                                  } else {
                                    return null;
                                  }
                                },
                                onSaved: (value) {
                                  workExperienceEditingController.text = value!;
                                },
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  labelText: 'Work Experience',
                                  labelStyle: TextStyle(
                                      backgroundColor: Colors.white,
                                      fontFamily: 'Montserrat',
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                  prefixIcon: Icon(Icons.history_outlined),
                                  fillColor: Colors.white,
                                  hintText: 'Ex: 11',
                                  hintStyle: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                  focusedBorder: new OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                      color: Colors.white,
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
                            ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                autofocus: false,
                                controller: currentlocationEditingController,
                                keyboardType: TextInputType.streetAddress,
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      !RegExp(r'^[a-z A-Z]+$')
                                          .hasMatch(value)) {
                                    //allow upper and lower case alphabets and space
                                    return "Enter Current Location";
                                  } else {
                                    return null;
                                  }
                                },
                                onSaved: (value) {
                                  currentlocationEditingController.text =
                                      value!;
                                },
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  labelText: 'Current Location',
                                  labelStyle: TextStyle(
                                      backgroundColor: Colors.white,
                                      fontFamily: 'Montserrat',
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                  prefixIcon: Icon(Icons.my_location),
                                  fillColor: Colors.white,
                                  hintText: 'Ex: Jaipur',
                                  hintStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: Colors.black,
                                      fontSize: 15),
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                  focusedBorder: new OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                      color: Colors.white,
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
                            ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  labelText: 'Work Location',
                                  labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 16,
                                    color: Colors.black,
                                    backgroundColor: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  prefixIcon: Icon(Icons.pin_drop),
                                  fillColor: Colors.white,
                                  hintText: 'Select Work Location',
                                  hintStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                  focusedBorder: new OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                      color: Colors.white,
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
                                value: locValue,
                                isExpanded: true,
                                iconSize: 25,
                                icon: Icon(Icons.arrow_drop_down,
                                    color: Colors.black),
                                items: worklocation.map(buildMenuItem).toList(),
                                onChanged: (lvalue) => setState(() {
                                  this.locValue = lvalue;
                                  worklocationEditingController.text = lvalue!;
                                }),
                                onSaved: (lvalue) {
                                  worklocationEditingController.text = lvalue!;
                                },
                                validator: (lvalue) {
                                  if (lvalue == null) {
                                    return "Select your Work Location";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            // SizedBox(
                            //   height: 15,
                            // ),

                            // signUpButton
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 45,
                                width: 200,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          color: Colors.white,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      primary: Colors.white,
                                      onPrimary:
                                          Color.fromARGB(255, 18, 68, 138),
                                    ),
                                    onPressed: () {
                                      if (formGlobalKey.currentState!
                                          .validate()) {
                                        // print('phn: ${widget.phonenumber}');
                                        // print(
                                        //     "fn: ${firstNameEditingController.text}");
                                        // print(
                                        //     "ln: ${lastNameEditingController.text}");
                                        // print(
                                        //     "wrk exp: ${workExperienceEditingController.text}");
                                        // print(
                                        //     "wrk loc: ${worklocationEditingController.text}");
                                        // print(
                                        //     "wrk typ: ${workTypeEditingController.text}");

                                        Navigator.push(
                                            (context),
                                            MaterialPageRoute(
                                                builder: (context) => chef_registration_two(
                                                    firstname:
                                                        firstNameEditingController
                                                            .text,
                                                    lastname:
                                                        lastNameEditingController
                                                            .text,
                                                    workexperience: int.parse(
                                                        workExperienceEditingController
                                                            .text),
                                                    worklocation:
                                                        worklocationEditingController
                                                            .text,
                                                    currentlocation:
                                                        currentlocationEditingController
                                                            .text)));
                                      }
                                    },
                                    child: Text(
                                      "Next",
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String worklocation) =>
      DropdownMenuItem(
        value: worklocation,
        child: Text(
          worklocation,
          style: TextStyle(fontSize: 18),
        ),
      );
}

// mixin InputValidationMixin {
//   bool isPasswordValid(String password) => password.length == 6;

//   bool islastNameValid(String lastname) {
//     Pattern lnpattern = '.{3,}';
//     RegExp regex = new RegExp(lnpattern.toString());
//     return regex.hasMatch(lastname);
//   }

//   bool isEmailValid(String email) {
//     Pattern pattern =
//         '^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))';
//     RegExp regex = new RegExp(pattern.toString());
//     return regex.hasMatch(email);
//   }
// }
