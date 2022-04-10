// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:chef_connect_india/roles/chef/chef_registration_2.dart';
import 'package:glassmorphism/glassmorphism.dart';

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
                    child: GlassmorphicContainer(
                      width: 330,
                      height: 710,
                      borderRadius: 10,
                      blur: 0.1,
                      alignment: Alignment.bottomCenter,
                      border: 0,
                      linearGradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFFffffff).withOpacity(0.5),
                            Color(0xFFFFFFFF).withOpacity(0.5),
                          ],
                          stops: [
                            0.1,
                            1,
                          ]),
                      borderGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFFffffff).withOpacity(1.0),
                          Color((0xFFFFFFFF)).withOpacity(1.0),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Form(
                          // padding: const EdgeInsets.all(8.0),
                          key: formGlobalKey,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              CircleAvatar(
                                backgroundColor: Color(0xFF092349),
                                radius: 80,
                                child: Image.asset('assets/CCI1.png'),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              // firstNameField,
                              TextFormField(
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
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  prefixIcon: Icon(Icons.account_circle),
                                  fillColor: Colors.white60,
                                  hintText: 'First Name',
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
                              SizedBox(
                                height: 7,
                              ),
                              // secondNameField,
                              TextFormField(
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
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  prefixIcon: Icon(Icons.account_circle),
                                  fillColor: Colors.white60,
                                  hintText: 'Last Name',
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
                              SizedBox(
                                height: 7,
                              ),
                              TextFormField(
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
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  prefixIcon: Icon(Icons.history_outlined),
                                  fillColor: Colors.white60,
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
                              SizedBox(
                                height: 7,
                              ),
                              TextFormField(
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
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  prefixIcon: Icon(Icons.my_location),
                                  fillColor: Colors.white60,
                                  hintText: 'Ex: Jaipur',
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
                              SizedBox(
                                height: 7,
                              ),
                              DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  labelText: 'Work Location',
                                  labelStyle: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  prefixIcon: Icon(Icons.pin_drop),
                                  fillColor: Colors.white60,
                                  hintText: 'Select Work Location',
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
                              // SizedBox(
                              //   height: 15,
                              // ),

                              SizedBox(
                                height: 10,
                              ),
                              // signUpButton
                              Container(
                                width: 200,
                                height: 50,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          color: Colors.white,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      primary: Colors.white54,
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
                                                    workexperience:
                                                        workExperienceEditingController
                                                            .text,
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
                                        fontFamily: 'Roboto',
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                              )
                            ],
                          ),
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
