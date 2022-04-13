// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:chef_connect_india/roles/chef/chef_registration_1.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

// import 'package:pin_code_fields/pin_code_fields.dart';
enum MobileVerificationState { SHOW_MOBILE_FORM_STATE, SHOW_OTP_FORMS_STATE }

class chef_login extends StatefulWidget {
  chef_login({Key? key}) : super(key: key);

  @override
  State<chef_login> createState() => _chef_loginState();
}

class _chef_loginState extends State<chef_login> {
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  final _phoneController = TextEditingController();
  final _otpController = TextEditingController();
  String phoneNumber = "+91";

  void _onCountryChange(CountryCode countryCode) {
    this.phoneNumber = countryCode.toString();
    print("New Country selected: " + countryCode.toString());
  }

  void check() {
    print("Full Text: " + this.phoneNumber + _phoneController.text);
  }

  String verificationId = "";
  bool isLoading = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;

  void phonealert() {
    if (_phoneController.text == "") {
      Alert(
              context: context,
              title: "PhoneNumber Required",
              desc: "Please enter Phone No.")
          .show();
    } else {
      setState(() {
        isLoading = true;
      });
    }
  }

  void alert() {
    if (_phoneController.text == "" && _otpController.text == "") {
      Alert(
              context: context,
              title: "PhoneNumber and OTP Required",
              desc: "Please enter Phone No. and OTP")
          .show();
    } else if (_phoneController.text == "") {
      Alert(
              context: context,
              title: "PhoneNumber Required",
              desc: "Please enter Phone No.")
          .show();
    } else if (_otpController.text == "") {
      Alert(context: context, title: "OTP Required", desc: "Please enter OTP.")
          .show();
    } else {
      setState(() {
        isLoading = true;
      });
    }
  }

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    String a = this.phoneNumber + _phoneController.text;
    print(this.phoneNumber + _phoneController.text);
    setState(() {
      isLoading = true;
    });
    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);
      setState(() {
        isLoading = false;
      });
      if (authCredential.user != null) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => chef_registration_one()));
      }
    } on FirebaseException catch (e) {
      setState(() {
        isLoading = false;
      });
      _scaffoldKey.currentState
          ?.showSnackBar(SnackBar(content: Text("${e.message}")));
    }
  }

  getMobileFormWidget(context) {
    return Column(
      children: [
        Spacer(),
        Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.center,
          children: [
            CountryCodePicker(
              onChanged: _onCountryChange,
              initialSelection: 'IN',
              favorite: ['+91', 'IN'],
              showCountryOnly: false,
              showOnlyCountryWhenClosed: false,
              enabled: true,
            ),
            Container(
              width: 150,
              child: TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: "Enter Phone Number",
                  hintStyle: TextStyle(
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Center(
          child: FlatButton(
            color: Colors.blueAccent,
            onPressed: () async {
              check();
              phonealert();
              await _auth.verifyPhoneNumber(
                  phoneNumber: this.phoneNumber + _phoneController.text,
                  verificationCompleted: (phoneAuthCredential) async {
                    setState(() {
                      isLoading = false;
                    });
                    // signInWithPhoneAuthCredential();
                  },
                  verificationFailed: (verificationFailed) async {
                    setState(() {
                      isLoading = false;
                    });
                    _scaffoldKey.currentState?.showBottomSheet(
                        (context) => Text("${verificationFailed.message}"));
                  },
                  codeSent: (verificationId, resendingToken) async {
                    setState(() {
                      setState(() {
                        isLoading = false;
                      });
                      currentState =
                          MobileVerificationState.SHOW_OTP_FORMS_STATE;
                      this.verificationId = verificationId;
                    });
                  },
                  codeAutoRetrievalTimeout: (verificationId) async {});
            },
            child: Text(
              "Send OTP",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Montserrat',
              ),
            ),
          ),
        ),
        Spacer(),
      ],
    );
  }

  getOtpFormWidget(context) {
    return Column(
      children: [
        Spacer(),
        TextFormField(
          controller: _otpController,
          decoration: InputDecoration(
            hintText: "Enter OTP",
            hintStyle: TextStyle(
              fontFamily: 'Montserrat',
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        FlatButton(
            color: Colors.blueAccent,
            onPressed: () {
              PhoneAuthCredential phoneAuthCredential =
                  PhoneAuthProvider.credential(
                      verificationId: verificationId,
                      smsCode: _otpController.text);

              signInWithPhoneAuthCredential(phoneAuthCredential);
            },
            child: Text(
              "Verify",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Montserrat',
              ),
            )),
        Spacer()
      ],
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
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
                      height: 620,
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
                      child: Column(
                        children: [
                          // getMobileFormWidget(context),
                          //  getOtpFormWidget(context),

                          SizedBox(
                            height: 40,
                          ),

                          CircleAvatar(
                            backgroundColor: Color(0xFF092349),
                            radius: 80,
                            child: Image.asset('assets/CCI1.png'),
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextFormField(
                              controller: _phoneController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                fillColor: Colors.white60,
                                hintText: 'Phone Number',
                                hintStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.black,
                                    fontSize: 15),
                                filled: true,
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 14, horizontal: 15),
                                  child: Text(
                                    " (+91) ",
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                suffixIcon: InkWell(
                                  onTap: () async {
                                    check();
                                    phonealert();
                                    await _auth.verifyPhoneNumber(
                                        phoneNumber: this.phoneNumber +
                                            _phoneController.text,
                                        verificationCompleted:
                                            (phoneAuthCredential) async {
                                          setState(() {
                                            isLoading = false;
                                          });
                                          // signInWithPhoneAuthCredential();
                                        },
                                        verificationFailed:
                                            (verificationFailed) async {
                                          setState(() {
                                            isLoading = false;
                                          });
                                          _scaffoldKey.currentState
                                              ?.showBottomSheet((context) => Text(
                                                  "${verificationFailed.message}"));
                                        },
                                        codeSent: (verificationId,
                                            resendingToken) async {
                                          setState(() {
                                            setState(() {
                                              isLoading = false;
                                            });
                                            currentState =
                                                MobileVerificationState
                                                    .SHOW_OTP_FORMS_STATE;
                                            this.verificationId =
                                                verificationId;
                                          });
                                        },
                                        codeAutoRetrievalTimeout:
                                            (verificationId) async {});
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 15),
                                    child: Text(
                                      'Send OTP',
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        color: Color.fromARGB(255, 18, 68, 138),
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
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
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 30,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 1.5,
                                    color: Colors.black,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 12),
                                  ),
                                ),
                                Text(
                                  "Enter 6 digit OTP",
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 16,
                                      color: Colors.black),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 1.5,
                                    color: Colors.black,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 12),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: _otpController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                fillColor: Colors.white54,
                                filled: true,
                                hintText: "Enter OTP",
                                hintStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
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
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 50,
                            width: 200,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  primary: Colors.white54,
                                  side: BorderSide(
                                    color: Colors.white70,
                                    width: 2,
                                  )),
                              onPressed: () {
                                PhoneAuthCredential phoneAuthCredential =
                                    PhoneAuthProvider.credential(
                                        verificationId: verificationId,
                                        smsCode: _otpController.text);
                                signInWithPhoneAuthCredential(
                                    phoneAuthCredential);
                              },
                              child: Text(
                                'Validate OTP',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 18, 68, 138)),
                              ),
                            ),
                          )
                        ],
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
