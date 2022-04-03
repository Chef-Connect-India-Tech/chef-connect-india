// ignore_for_file: unused_field, deprecated_member_use

import 'package:chef_connect_india/roles/chef/Booking.dart';
import 'package:chef_connect_india/roles/chef/multiselect.dart/menu.dart';
import 'package:chef_connect_india/roles/chef/multiselect.dart/multiselectdropdown_screen.dart';
import 'package:chef_connect_india/roles/chef/trail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:chef_connect_india/Helper/model.dart';
import 'package:chef_connect_india/roles/chef/chef_dashboard.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';

class chef_registration_two extends StatefulWidget {
  final String firstname;
  final String lastname;
  final String phonenumber;
  final String workexperience;
  final String worklocation;
  final String currentlocation;
  chef_registration_two(
      {required this.firstname,
      required this.lastname,
      required this.phonenumber,
      required this.workexperience,
      required this.worklocation,
      required this.currentlocation});
  final _fireStore = FirebaseFirestore.instance;

  @override
  State<chef_registration_two> createState() => _chef_registration_twoState();
}

class _chef_registration_twoState extends State<chef_registration_two> {
  var favoriteMovies1 = [];
  bool isSelected = false;
  List favoriteMovies2 = [];
  Future<void> getData() async {
    var docc = 'lHNpuzpJuz8CdzthmrBP';
    // Get docs from collection reference
    FirebaseFirestore.instance
        .collection('menu')
        .doc(docc)
        .collection("starters")
        .get()
        .then((snapshot) => {
              snapshot.docs.forEach((doc) {
                favoriteMovies2.add(doc['dish']);
              })
            });
    print(favoriteMovies2);
  }

  List<Movie> favoriteMovies = [
    Movie('Harry Potter'),
    Movie('Spider Man'),
    Movie('Venom'),
    Movie('Transformers'),
    Movie('The Last Witch Hunters')
  ];
  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String? errorMessage;

  final formGlobalKey = GlobalKey<FormState>();
  final salaryEditingController = new TextEditingController();
  final cusineEditingController = new TextEditingController();
  // final workTypeEditingController = new TextEditingController();
  final timeEditingController = new TextEditingController();
  // final workType = ['Party Chef', 'Kitchen Professional', 'Private Chef'];
  final time = ['Full Time', 'Part Time', 'Both'];
  // String? cheftypeValue;
  String? timeValue;
  // final worklocation = ['Jaipur', 'Bangalore'];
  final salary = [
    'under 10,000',
    '10,000 - 20,000',
    '20,000 - 40,000',
    'above 40,000'
  ];
  String? salaryValue;
  String _selectedGender = 'male';

  List? _myCusine;
  late String _myCusineResult;
  // final formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _myCusine = [];
    _myCusineResult = '';
  }

  _saveForm() {
    var form = formGlobalKey.currentState!;
    if (form.validate()) {
      form.save();
      setState(() {
        _myCusineResult = _myCusine.toString();
      });
    }
  }

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
                      height: 640,
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
                          key: formGlobalKey,
                          child: Column(children: [
                            SizedBox(
                              height: 5,
                            ),
                            CircleAvatar(
                              backgroundColor: Color(0xFF092349),
                              radius: 80,
                              child: Image.asset('assets/CCI1.png'),
                            ),
                            // SizedBox(
                            //   height: 20,
                            // ),
                            // DropdownButtonFormField<String>(
                            //   decoration: InputDecoration(
                            //     labelText: 'Work Type',
                            //     labelStyle: TextStyle(
                            //         fontSize: 15,
                            //         color: Colors.black,
                            //         fontWeight: FontWeight.bold),
                            //     prefixIcon: Icon(Icons.settings),
                            //     fillColor: Colors.white60,
                            //     hintText: 'Select Work Type',
                            //     hintStyle: TextStyle(
                            //         color: Colors.black, fontSize: 15),
                            //     filled: true,
                            //     border: OutlineInputBorder(
                            //       borderRadius: BorderRadius.circular(10),
                            //       borderSide: BorderSide(
                            //         color: Colors.white,
                            //         width: 2,
                            //       ),
                            //     ),
                            //     focusedBorder: new OutlineInputBorder(
                            //       borderRadius: new BorderRadius.circular(10.0),
                            //       borderSide: BorderSide(
                            //         color: Colors.white60,
                            //         width: 2,
                            //       ),
                            //     ),
                            //     enabledBorder: OutlineInputBorder(
                            //       borderRadius: BorderRadius.circular(10),
                            //       borderSide: BorderSide(
                            //         color: Colors.white,
                            //         width: 2,
                            //       ),
                            //     ),
                            //   ),
                            //   validator: (wvalue) {
                            //     if (wvalue == null) {
                            //       //allow upper and lower case alphabets and space
                            //       return "Select Work Type";
                            //     }
                            //     return null;
                            //   },
                            //   autofocus: false,
                            //   value: cheftypeValue,
                            //   isExpanded: true,
                            //   iconSize: 25,
                            //   icon: Icon(Icons.arrow_drop_down,
                            //       color: Colors.black),
                            //   items: workType.map(buildChefMenuItem).toList(),
                            //   onChanged: (wvalue) => setState(() {
                            //     this.cheftypeValue = wvalue;
                            //     workTypeEditingController.text = wvalue!;
                            //   }),
                            //   onSaved: (wvalue) {
                            //     workTypeEditingController.text = wvalue!;
                            //   },
                            // ),
                            SizedBox(
                              height: 15,
                            ),
                            DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                labelText: 'Looking For',
                                labelStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                prefixIcon: Icon(Icons.settings),
                                fillColor: Colors.white60,
                                hintText: 'Looking For',
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
                              validator: (tvalue) {
                                if (tvalue == null) {
                                  //allow upper and lower case alphabets and space
                                  return "Select period of work";
                                }
                                return null;
                              },
                              autofocus: false,
                              value: timeValue,
                              isExpanded: true,
                              iconSize: 25,
                              icon: Icon(Icons.arrow_drop_down,
                                  color: Colors.black),
                              items: time.map(buildTimeMenuItem).toList(),
                              onChanged: (tvalue) => setState(() {
                                this.timeValue = tvalue;
                                timeEditingController.text = tvalue!;
                              }),
                              onSaved: (tvalue) {
                                timeEditingController.text = tvalue!;
                              },
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                labelText: 'Salary Per Month',
                                labelStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                prefixIcon: Icon(Icons.money),
                                fillColor: Colors.white60,
                                // hintText: 'Select Current Salary',
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
                              value: salaryValue,
                              isExpanded: true,
                              iconSize: 25,
                              icon: Icon(Icons.arrow_drop_down,
                                  color: Colors.black),
                              items: salary.map(buildMenuItem).toList(),
                              onChanged: (svalue) => setState(() {
                                this.salaryValue = svalue;
                                salaryEditingController.text = svalue!;
                              }),
                              onSaved: (lvalue) {
                                salaryEditingController.text = lvalue!;
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
                            MultiSelectFormField(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                              autovalidate: AutovalidateMode.disabled,
                              chipBackGroundColor: Colors.blue,
                              chipLabelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              dialogTextStyle:
                                  TextStyle(fontWeight: FontWeight.bold),
                              checkBoxActiveColor: Colors.blue,
                              checkBoxCheckColor: Colors.white,
                              dialogShapeBorder: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0))),
                              title: Text(
                                "Cusine Expert",
                                style: TextStyle(fontSize: 16),
                              ),
                              validator: (value) {
                                if (value == null || value.length == 0) {
                                  return 'Please select one or more options';
                                }
                                return null;
                              },
                              dataSource: [
                                {
                                  "display": "Indian",
                                  "value": "Indian",
                                },
                                {
                                  "display": "Chinese",
                                  "value": "Chinese",
                                },
                                {
                                  "display": "Italian",
                                  "value": "Italian",
                                },
                                {
                                  "display": "Sushi",
                                  "value": "Sushi",
                                },
                                {
                                  "display": "Mexican",
                                  "value": "Mexican",
                                },
                              ],
                              textField: 'display',
                              valueField: 'value',
                              okButtonLabel: 'OK',
                              cancelButtonLabel: 'CANCEL',
                              hintWidget: Text('Select Cusine'),
                              initialValue: _myCusine,
                              onSaved: (value) {
                                if (value == null) return;
                                setState(() {
                                  cusineEditingController.text =
                                      value!.toString();
                                  _myCusine = value;
                                });
                              },
                            ),
                            // ElevatedButton(
                            //   onPressed: () {
                            //     //openDialog();
                            //     // getData();
                            //     // Navigator.push(
                            //     //   context,
                            //     //   MaterialPageRoute(
                            //     //     builder: (context) => predefinedmenu(),
                            //     //   ),
                            //     // );
                            //     // Navigator.push(
                            //     //   context,
                            //     //   MaterialPageRoute(
                            //     //     builder: (context) => MyHomePage1(
                            //     //       title: 'multi select',
                            //     //     ),
                            //     //   ),
                            //     // );
                            //   },
                            //   child: null,
                            // ),

                            SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                if (formGlobalKey.currentState!.validate()) {
                                  //   _saveForm();
                                  //   print(
                                  //       'salary: ${salaryEditingController.text}');
                                  //   print(
                                  //       'cusine: ${cusineEditingController.text}');
                                  //   print(
                                  //       'time: ${timeEditingController.text}');
                                  //   print('fn: ${widget.firstname}');
                                  //   print('ln: ${widget.lastname}');
                                  //   print('phn: ${widget.phonenumber}');
                                  //   print('wrkexp: ${widget.workexperience}');
                                  //   print('wrkloc: ${widget.worklocation}');
                                  //   print('curloc: ${widget.currentlocation}');
                                  // }
                                  try {
                                    // await _auth
                                    //     .signInWithPhoneNumber(
                                    //         widget.phonenumber)
                                    postDetailsToFirestore().catchError((e) {
                                      Fluttertoast.showToast(msg: e!.message);
                                    });
                                  } on FirebaseAuthException catch (error) {
                                    switch (error.code) {
                                      case "invalid-phone":
                                        errorMessage =
                                            "Your phone number appears to be malformed.";
                                        break;
                                      case "user-not-found":
                                        errorMessage =
                                            "User with this email doesn't exist.";
                                        break;
                                      case "user-disabled":
                                        errorMessage =
                                            "User with this email has been disabled.";
                                        break;
                                      case "too-many-requests":
                                        errorMessage = "Too many requests";
                                        break;
                                      // case "operation-not-allowed":
                                      //   errorMessage =
                                      //       "Signing in with Email and Password is not enabled.";
                                      //   break;
                                      default:
                                        errorMessage =
                                            "An undefined Error happened.";
                                    }
                                    Fluttertoast.showToast(msg: errorMessage!);
                                    print(error.code);
                                  }
                                }
                              },
                              child: Text(
                                'Register',
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 18, 68, 138)),
                              ),
                            )
                          ]),
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

  DropdownMenuItem<String> buildMenuItem(String salary) => DropdownMenuItem(
        value: salary,
        child: Text(
          salary,
          style: TextStyle(fontSize: 18),
        ),
      );

  DropdownMenuItem<String> buildChefMenuItem(String worktype) =>
      DropdownMenuItem(
        value: worktype,
        child: Text(
          worktype,
          style: TextStyle(fontSize: 18),
        ),
      );

  DropdownMenuItem<String> buildTimeMenuItem(String time) => DropdownMenuItem(
        value: time,
        child: Text(
          time,
          style: TextStyle(fontSize: 18),
        ),
      );

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values
    var name = '${widget.firstname} ${widget.lastname}';
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    user!.updateProfile(displayName: name);

    ChefModel chefModel = ChefModel();

    // writing all the values
    chefModel.uid = user.uid;
    // chefModel.email = emailEditingController.text;
    chefModel.firstname = widget.firstname;
    chefModel.lastname = widget.lastname;
    chefModel.mobile1 = widget.phonenumber;
    chefModel.experience = widget.workexperience;
    chefModel.address = widget.currentlocation;
    chefModel.city = widget.worklocation;
    chefModel.currentsalary = salaryEditingController.text;
    chefModel.cuisineexpert = cusineEditingController.text;
    chefModel.workpreference = timeEditingController.text;
    chefModel.dutystatus = true;
    chefModel.role = 'chef';
    chefModel.profilepic =
        'http://chefconnect.co.in/assets/images/logo_chef.png';

    await firebaseFirestore
        .collection("chefs")
        .doc(chefModel.uid)
        .set(chefModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => Chef_dashboard()),
        (route) => false);
  }

  void openDialog() {
    print(favoriteMovies1);
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text('List'),
            actions: <Widget>[Text('OK'), Text('Cancel')],
            content: Container(
                width: 300,
                height: 400,
                child: MultiSelectionExample(favoriteMovies1, isSelected)),
          );
        });
  }
}

class MultiSelectionExample extends StatefulWidget {
  // var favoriteMovies1 = [];
  // Future<void> getData() async {
  //   // Get docs from collection reference
  //   FirebaseFirestore.instance
  //       .collection('Menu')
  //       .doc()
  //       .collection("starters")
  //       .get()
  //       .then((snapshot) => {
  //             snapshot.docs.forEach((doc) {
  //               favoriteMovies1.add(doc['dish']);
  //             })
  //           });
  // }

  var favoriteMovies1;
  var isSelected = false;

  MultiSelectionExample(this.favoriteMovies1, this.isSelected);
  @override
  _MultiSelectionExampleState createState() => _MultiSelectionExampleState();
}

class _MultiSelectionExampleState extends State<MultiSelectionExample> {
  @override
  Widget build(BuildContext context) {
    bool isSelected = false;
    print(widget.favoriteMovies1);
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            widget.favoriteMovies1[index].isSelected =
                !widget.favoriteMovies1[index].isSelected;
            setState(() {});
          },
          child: Container(
            color: widget.favoriteMovies1[index].isSelected
                ? Colors.green[100]
                : null,
            child: Row(
              children: <Widget>[
                Checkbox(
                    value: widget.favoriteMovies1[index].isSelected,
                    onChanged: (s) {
                      widget.favoriteMovies1[index].isSelected =
                          !widget.favoriteMovies1[index].isSelected;
                      setState(() {});
                    }),
                Text(widget.favoriteMovies1[index].movieName)
              ],
            ),
          ),
        );
      },
      itemCount: widget.favoriteMovies1.length,
    );
  }
}

class Movie {
  Movie(this.movieName);

  String movieName;
  bool isSelected = false;
}
