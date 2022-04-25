import 'dart:developer';
import 'package:chef_connect_india/Helper/dimensions.dart';
import 'package:chef_connect_india/Main%20Screen/home.dart';
import 'package:chef_connect_india/Main%20Screen/login_screen.dart';
import 'package:chef_connect_india/Main%20Screen/select_mode.dart';
import 'package:chef_connect_india/chef_portal/chef_dashboard.dart';
import 'package:chef_connect_india/chef_portal/onboarding_Screen/onboarding_screen.dart';
import 'package:chef_connect_india/onboarding_Screen/onboarding_screen.dart';
import 'package:chef_connect_india/roles/chef/chef_registration_1.dart';
// import 'package:chef_connect_india/roles/user/Registration_user.dart';
import 'package:chef_connect_india/user_portal/user_home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool owner = false;
var vpH, vpW;

class OTPScreen extends StatefulWidget {
  final phone = LoginScreen.phone;

  OTPScreen({Key? key}) : super(key: key);
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final snackBar = SnackBar(
    content: Text(
      'Invalid OTP! Try again',
      style: TextStyle(
        fontFamily: 'Montserrat',
      ),
    ),
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

  Future<void> checkRole() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    owner = (pref.getBool('chefRole') ?? false);
  }

  _phoneVerified() async {
    if (owner) {
      await FirebaseFirestore.instance
          .collection("chefs")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get()
          .then(
        (value) {
          if (value.exists) {
            Navigator.pushAndRemoveUntil(
                context,
                new MaterialPageRoute(
                  builder: (context) => chef_dashboard(),
                ),
                ((route) => false));
          } else {
            FirebaseFirestore.instance.collection("chefs").doc(
                  FirebaseAuth.instance.currentUser!.uid,
                );
            Navigator.pushAndRemoveUntil(
                context,
                new MaterialPageRoute(
                  builder: (context) => new Onboarding_screen_chef(),
                ),
                ((route) => false));
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
            Navigator.pushAndRemoveUntil(
                context,
                new MaterialPageRoute(
                  builder: (context) => Select_mode_new(),
                ),
                ((route) => false));
          } else {
            FirebaseFirestore.instance.collection("users").doc(
                  FirebaseAuth.instance.currentUser!.uid,
                );
            Navigator.pushAndRemoveUntil(
                context,
                new MaterialPageRoute(
                  builder: (context) => Onboarding_screen(),
                ),
                ((route) => false));
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
            log('-------------# Created #------------');
            _phoneVerified();
          }
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        log(e.message!);
        showSnackBar('Something went wrong !', Colors.red);
        Navigator.pushAndRemoveUntil(
            context,
            new MaterialPageRoute(
              builder: (context) => ChefConnectMain(),
            ),
            ((route) => false));
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

        // Navigator.pushReplacementNamed(context, '/loginScreen');
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
  void initState() {
    super.initState();
    checkRole();
    _verifyPhone(widget.phone);
    log(widget.phone!);
  }

  @override
  Widget build(BuildContext context) {
    vpH = getViewportHeight(context);
    vpW = getViewportWidth(context);
    return WillPopScope(
      onWillPop: () {
        showSnackBar(
            'You cannot go back at this stage ', Colors.redAccent.shade100);
        return Future.value(false);
      },
      child: Scaffold(
          // resizeToAvoidBottomInset: false,
          // backgroundColor: owner ? Colors.blue[200] : Colors.purple[300],
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
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: !codeSent
                    ? Center(
                        child: SpinKitFadingCircle(
                          color: Colors.white,
                          size: 60,
                        ),
                      )
                    : SingleChildScrollView(
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
                                    "OTP sent.",
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        color: Colors.white,
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                        backgroundColor:
                                            Colors.black.withOpacity(.4)),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    child: Text(
                                      "Enter the OTP sent to  +91 ${widget.phone}  to continue...",
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          color: Colors.white70,
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                          backgroundColor:
                                              Colors.black.withOpacity(.7)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            _formModule(),
                            // Container(
                            //   margin: EdgeInsets.all(25),
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(15),
                            //     color: Colors.black.withOpacity(.6),
                            //   ),
                            //   padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            //   child: Column(
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     children: [
                            //       Row(
                            //         mainAxisAlignment:
                            //             MainAxisAlignment.spaceBetween,
                            //         children: [
                            //           Text(
                            //             'Entered Phone Number Wrong ?',
                            //             style: TextStyle(
                            //               fontFamily: 'Montserrat',
                            //               color: Colors.white,
                            //               fontSize: 12,
                            //               fontWeight: FontWeight.bold,
                            //               // backgroundColor:
                            //               //     Colors.black.withOpacity(.7),
                            //             ),
                            //           ),
                            //           TextButton(
                            //             onPressed: () {
                            //               Navigator.pushAndRemoveUntil(
                            //                   context,
                            //                   MaterialPageRoute(
                            //                       builder: (context) =>
                            //                           ChefConnectMain()),
                            //                   (route) => false);
                            //             },
                            //             child: Text(
                            //               'Click Here',
                            //               style: TextStyle(
                            //                 fontFamily: 'Montserrat',
                            //                 color: Colors.redAccent,
                            //                 fontSize: 15,
                            //                 fontWeight: FontWeight.bold,
                            //               ),
                            //             ),
                            //           )
                            //         ],
                            //       ),
                            //       Row(
                            //         mainAxisAlignment:
                            //             MainAxisAlignment.spaceBetween,
                            //         children: [
                            //           Text(
                            //             'Resend OTP',
                            //             style: TextStyle(
                            //               fontFamily: 'Montserrat',
                            //               color: Colors.white,
                            //               fontSize: 12,
                            //               fontWeight: FontWeight.bold,
                            //             ),
                            //           ),
                            //           TextButton(
                            //             onPressed: () {},
                            //             child: Text(
                            //               'Click Here',
                            //               style: TextStyle(
                            //                 fontFamily: 'Montserrat',
                            //                 color: Colors.redAccent,
                            //                 fontSize: 15,
                            //                 fontWeight: FontWeight.bold,
                            //               ),
                            //             ),
                            //           )
                            //         ],
                            //       )
                            //     ],
                            //   ),
                            // )
                          ],
                        ),
                      ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget _formModule() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 100, 30, 0),
      child: Form(
        key: _formkey,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: Colors.black.withOpacity(.4),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Enter OTP",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontSize: 20,
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
                                fontFamily: 'Montserrat',
                                color: Colors.white60.withOpacity(.5),
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
                              fontFamily: 'Montserrat',
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
}
