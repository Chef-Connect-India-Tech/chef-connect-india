import 'dart:developer';
import 'package:chef_connect_india/chef_portal/chef_dashboard.dart';
import 'package:chef_connect_india/roles/chef/chef_registration_1.dart';
import 'package:chef_connect_india/roles/user/Registration_user.dart';
import 'package:chef_connect_india/roles/user/user_home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:park_place/screens/otpScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool role = false;
bool chef = false;

class LoginScreen extends StatefulWidget {
  static String? phone;
  // final phone = LoginScreen.phone;
  final bool ischef;

  LoginScreen({Key? key, required this.ischef}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  String phoneNumber = "+91";
  final snackBar = SnackBar(
    content: Text('Please enter valid phone number'),
    backgroundColor: Colors.red,
    duration: Duration(seconds: 2),
  );

  final otpsnackBar = SnackBar(
    content: Text('Invalid OTP! Try again'),
    backgroundColor: Colors.red,
    duration: Duration(seconds: 2),
  );

  late String _verificationCode, userCode;
  bool codeSent = false, verifying = false;

  void showSnackBar(String msg, Color color) {
    var snackBar = SnackBar(
      content: Text(msg),
      backgroundColor: color,
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  void initState() {
    fetchRole();
    super.initState();
    checkRole();
    _verifyPhone(LoginScreen.phone);
    log(LoginScreen.phone.toString());
  }

  void fetchRole() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (widget.ischef) {
      await pref.setBool('chefRole', true);
    } else {
      await pref.setBool('chefRole', false);
    }
  }

  void _signIn() async {
    _formkey.currentState!.validate();
    if (LoginScreen.phone!.isNotEmpty && LoginScreen.phone!.length == 10) {
      // Navigator.pushReplacementNamed(context, "/otpScreen");
      // Navigator.push(
      //   context,
      //   new MaterialPageRoute(
      //     builder: (context) => OTPScreen(),
      //   ),
      // );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future<void> checkRole() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    chef = (pref.getBool('chefRole') ?? false);
  }

  _phoneVerified() async {
    if (chef) {
      await FirebaseFirestore.instance
          .collection("chefs")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get()
          .then(
        (value) {
          if (value.exists) {
            // Navigator.pushReplacementNamed(context,'/ownerHomePage');
            Navigator.push(
              context,
              new MaterialPageRoute(
                builder: (context) => chef_dashboard(),
              ),
            );
          } else {
            FirebaseFirestore.instance
                .collection("chefs")
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .update(
              {
                // 'fullName': 'Name',
                'mobile1': '+91' + LoginScreen.phone!,
              },
            );
            // Navigator.pushReplacementNamed(context, '/detailsScreen');
            Navigator.push(
              context,
              new MaterialPageRoute(
                builder: (context) => new chef_registration_one(),
              ),
            );
          }
        },
      );
    } else {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get()
          .then(
        (value) {
          if (value.exists) {
            // Navigator.pushReplacementNamed(context,'/location_page');
            Navigator.push(
              context,
              new MaterialPageRoute(
                builder: (context) => user_home(),
              ),
            );
          } else {
            FirebaseFirestore.instance
                .collection("users")
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .update(
              {
                // 'fullName': 'Name',
                'mobile1': '+91' + LoginScreen.phone!,
              },
            );
            // Navigator.pushReplacementNamed(context, '/parkvehicleDetailPage');
            Navigator.push(
              context,
              new MaterialPageRoute(
                builder: (context) => Registration_user(),
              ),
            );
          }
        },
      );
    }
  }

  _verifyPhone(phone) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91$phone',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) async {
          if (value.user != null) {
            log('# Created #');
            _phoneVerified();
          }
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        log(e.message!);
        // showSnackBar('Something went wrong !', Colors.red);
        // Navigator.pushReplacementNamed(context, '/loginScreen');
      },
      codeSent: (String? verficationID, int? resendToken) {
        setState(() {
          _verificationCode = verficationID!;
          codeSent = true;
        });
      },
      codeAutoRetrievalTimeout: (String verificationID) {
        showSnackBar('OTP verification timed out !', Colors.red);
        Navigator.pushReplacementNamed(context, '/loginScreen');
      },
      timeout: Duration(seconds: 60),
    );
  }

  _verifyOTP() async {
    _formkey.currentState!.validate();
    if (userCode.isNotEmpty && userCode.length == 6) {
      try {
        await FirebaseAuth.instance
            .signInWithCredential(PhoneAuthProvider.credential(
                verificationId: _verificationCode, smsCode: userCode))
            .then((value) async {
          if (value.user != null) {
            _phoneVerified();
          }
        });
      } catch (e) {
        log(e.toString());
        FocusScope.of(context).unfocus();
        showSnackBar('Invalid OTP! Try again', Colors.red);
        setState(() {
          verifying = false;
        });
      }
    } else {
      showSnackBar('Invalid OTP! Try again', Colors.red);
      setState(() {
        verifying = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.withOpacity(.2),
      body: SafeArea(
        child: Scaffold(
            // backgroundColor:
            //     widget.ischef ? Colors.blue[200] : Colors.purple[300],
            body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              widget.ischef
                  ? Image.asset(
                      "assets/CCI_Chef.jpg",
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: double.infinity,
                      scale: 1,
                      // color: Colors.white.withOpacity(0.1),
                    )
                  : Image.asset(
                      "assets/CCI.jpg",
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: double.infinity,
                      scale: 1,
                    ),
              SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome.",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Text(
                                "Enter your phone number to continue...",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Padding(
                      //   padding: EdgeInsets.only(top: 50.0),
                      //   child: Center(
                      //     child: Container(
                      //       height: 200,
                      //       width: 200,
                      //       child: widget.ischef
                      //           ? Image.asset("assets/images/login2.png")
                      //           : Image.asset("assets/images/login1.png"),
                      //     ),
                      //   ),
                      // ),
                      _formModule(),
                      SizedBox(
                        height: 50,
                      ),
                      // _formOTPModule()
                    ],
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }

  Widget _formModule() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 70, 30, 0),
      child: Form(
        key: _formkey,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: Colors.black.withOpacity(0.6),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Phone Number",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white.withOpacity(.05),
                              ),
                              padding: EdgeInsets.fromLTRB(20, 5, 15, 5),
                              child: TextFormField(
                                controller: _phoneController,
                                maxLength: 10,
                                textInputAction: TextInputAction.done,
                                keyboardType: TextInputType.phone,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                decoration: InputDecoration(
                                  counterText: "",
                                  prefixText: "+91 ",
                                  border: InputBorder.none,
                                  hintText: 'Phone Number',
                                  hintStyle: TextStyle(
                                    color: Colors.white60.withOpacity(0.7),
                                  ),
                                ),
                                obscureText: false,
                                validator: (val) {
                                  log(val!);
                                  setState(() {
                                    _phoneController.text = val;
                                  });
                                  return null;
                                },
                              ),
                            ),

                            SizedBox(
                              height: 40,
                            ),
                            //Spacer(),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                  ],
                ),
                Positioned(
                  bottom: 10,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      //shadowColor: Colors.white38,
                      primary: Colors.white,
                      elevation: 10,
                      padding: EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      log("phone number is ${_phoneController.text}");
                      String phone = _phoneController.text;
                      log("phone number is ${phone}");
                      _verifyPhone(phone);
                      // _signIn();
                    },
                    child: Container(
                      width: 120,
                      child: Center(
                        child: Text(
                          "Send OTP",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: Colors.black.withOpacity(0.6),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "OTP",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white12),
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white.withOpacity(.05),
                              ),
                              padding: EdgeInsets.fromLTRB(20, 5, 15, 5),
                              child: TextFormField(
                                maxLength: 6,
                                textInputAction: TextInputAction.done,
                                keyboardType: TextInputType.phone,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                decoration: InputDecoration(
                                  counterText: "",
                                  border: InputBorder.none,
                                  hintText: 'Enter OTP',
                                  hintStyle: TextStyle(
                                    color: Colors.white60.withOpacity(0.6),
                                  ),
                                ),
                                obscureText: false,
                                validator: (val) {
                                  setState(() {
                                    userCode = val!;
                                  });
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                  ],
                ),
                Positioned(
                  bottom: 10,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      //shadowColor: Colors.white38,
                      primary: Colors.white,

                      elevation: 10,
                      padding: EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      if (!verifying) {
                        FocusScope.of(context).unfocus();
                        setState(() {
                          verifying = true;
                        });
                        _verifyOTP();
                      }
                    },
                    child: Container(
                      width: 120,
                      height: 18,
                      child: Center(
                        child: verifying
                            ? SpinKitFadingCircle(
                                color: Colors.black54,
                                size: 20,
                              )
                            : Text(
                                "Log in",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget _formOTPModule() {
  //   return Padding(
  //     padding: const EdgeInsets.fromLTRB(30, 100, 30, 0),
  //     child: Form(
  //       key: _formkey,
  //       child: Stack(
  //         alignment: Alignment.center,
  //         children: [
  //           Column(
  //             children: [
  //               Card(
  //                 shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(15)),
  //                 color: Colors.white.withOpacity(.1),
  //                 child: Padding(
  //                   padding: const EdgeInsets.all(20.0),
  //                   child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.center,
  //                     children: [
  //                       Text(
  //                         "ParkPlace.",
  //                         style: TextStyle(
  //                           color: Colors.white,
  //                           fontSize: 30,
  //                           fontWeight: FontWeight.bold,
  //                         ),
  //                       ),
  //                       SizedBox(
  //                         height: 20,
  //                       ),
  //                       Container(
  //                         decoration: BoxDecoration(
  //                           border: Border.all(color: Colors.white12),
  //                           borderRadius: BorderRadius.circular(15),
  //                           color: Colors.white.withOpacity(.05),
  //                         ),
  //                         padding: EdgeInsets.fromLTRB(20, 5, 15, 5),
  //                         child: TextFormField(
  //                           maxLength: 6,
  //                           textInputAction: TextInputAction.done,
  //                           keyboardType: TextInputType.phone,
  //                           style: TextStyle(
  //                             color: Colors.white,
  //                           ),
  //                           decoration: InputDecoration(
  //                             counterText: "",
  //                             border: InputBorder.none,
  //                             hintText: 'Enter OTP',
  //                             hintStyle: TextStyle(
  //                               color: Colors.white60.withOpacity(.35),
  //                             ),
  //                           ),
  //                           obscureText: false,
  //                           validator: (val) {
  //                             setState(() {
  //                               userCode = val!;
  //                             });
  //                           },
  //                         ),
  //                       ),
  //                       SizedBox(
  //                         height: 40,
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //               SizedBox(
  //                 height: 35,
  //               ),
  //             ],
  //           ),
  //           Positioned(
  //             bottom: 10,
  //             child: ElevatedButton(
  //               style: ElevatedButton.styleFrom(
  //                 //shadowColor: Colors.white38,
  //                 primary: Colors.white,

  //                 elevation: 10,
  //                 padding: EdgeInsets.all(20),
  //                 shape: RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.circular(15),
  //                 ),
  //               ),
  //               onPressed: () {
  //                 if (!verifying) {
  //                   FocusScope.of(context).unfocus();
  //                   setState(() {
  //                     verifying = true;
  //                   });
  //                   _verifyOTP();
  //                 }
  //               },
  //               child: Container(
  //                 width: 120,
  //                 height: 18,
  //                 child: Center(
  //                   child: verifying
  //                       ? SpinKitFadingCircle(
  //                           color: Colors.black54,
  //                           size: 20,
  //                         )
  //                       : Text(
  //                           "Log in",
  //                           style: TextStyle(
  //                             color: Colors.black,
  //                           ),
  //                         ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
