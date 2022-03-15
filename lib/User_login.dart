import 'package:flutter/material.dart';
import 'package:glass_morphism/Registration_user.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
enum MobileVerificationState { SHOW_MOBILE_FORM_STATE, SHOW_OTP_FORMS_STATE }
class USer_login extends StatefulWidget {
  USer_login({Key? key}) : super(key: key);

  @override
  State<USer_login> createState() => _USer_loginState();
}

class _USer_loginState extends State<USer_login> {
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

  void alert() {
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

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
      String a=  this.phoneNumber + _phoneController.text;
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
        Navigator.push(
            context, MaterialPageRoute(builder: (context) =>Registration_user(phonenumbera: a)));
      }
    } on FirebaseException catch (e) {
      setState(() {
        isLoading = false;
      });
      _scaffoldKey.currentState
          // ignore: deprecated_member_use
          ?.showSnackBar(SnackBar(content: Text("${e.message}")));
    }
  }

  getMobileFormWidget(context) {
    return Column(
      children: [
        Spacer(),
        // TextFormField(
        //   controller: _phoneController,
        //   decoration: InputDecoration(
        //     hintText: "Enter Phone Number",
        //   ),
        // ),
        Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.center,
          children: [
            CountryCodePicker(
              onChanged: _onCountryChange,
              initialSelection: 'IN',
              favorite: ['+91', 'IN'],
              // optional. Shows only country name and flag
              showCountryOnly: false,
              // optional. Shows only country name and flag when popup is closed.
              showOnlyCountryWhenClosed: false,
              // optional. aligns the flag and the Text left
              // alignLeft: false,
              enabled: true,
            ),
            Container(
              width: 150,
              child: TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(hintText: "Enter Phone Number"),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        // ignore: deprecated_member_use
        Center(
          child: FlatButton(
            color: Colors.blueAccent,
            onPressed: () async {
              check();
              // alert();
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
                    // ignore: deprecated_member_use
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
            child: Text("Send OTP", style: TextStyle(color: Colors.white)),
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
          decoration: InputDecoration(hintText: "Enter OTP"),
        ),
        SizedBox(
          height: 16,
        ),
        // ignore: deprecated_member_use
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
              style: TextStyle(color: Colors.white),
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
                          // Wrap(
                          //       direction: Axis.horizontal,
                          //       alignment: WrapAlignment.center,
                          //       children: [
                          //         // CountryCodePicker(
                          //         //   onChanged: _onCountryChange,
                          //         //   initialSelection: 'IN',
                          //         //   favorite: ['+91', 'IN'],
                          //         //   // optional. Shows only country name and flag
                          //         //   showCountryOnly: false,
                          //         //   // optional. Shows only country name and flag when popup is closed.
                          //         //   showOnlyCountryWhenClosed: false,
                          //         //   // optional. aligns the flag and the Text left
                          //         //   // alignLeft: false,
                          //         //   enabled: true,
                          //         // ),
                          //         Padding(
                          //           padding: const EdgeInsets.all(10.0),
                          //           child: Container(
                          //             width: 150,
                          //             child: TextFormField(
                          //               controller: _phoneController,
                          //               keyboardType: TextInputType.phone,
                          //               decoration: InputDecoration(
                          //                 fillColor: Colors.white60,
                          //                 hintText: "Enter Phone Number",hintStyle: TextStyle(
                          //                   color: Colors.black, fontSize: 15),
                          //               filled: true,
                          //               prefixIcon: Padding(
                          //           padding: const EdgeInsets.symmetric(
                          //               vertical: 14, horizontal: 15),
                          //           child: Text(
                          //             " (+91) ",
                          //             style: TextStyle(
                          //               color: Colors.black,
                          //               fontSize: 15,
                          //             ),
                          //           ),
                          //                                         ),
                          //                                         // suffixIcon: InkWell(
                          //                                         //   onTap: () {},
                          //                                         //   child: Padding(
                          //                                         //     padding: const EdgeInsets.symmetric(
                          //                                         //         vertical: 20, horizontal: 15),
                          //                                         //     child: Text(
                          //                                         //       'Send OTP',
                          //                                         //       style: TextStyle(
                          //                                         //         color: Color.fromARGB(255, 18, 68, 138),
                          //                                         //         fontSize: 14,
                          //                                         //         fontWeight: FontWeight.bold,
                          //                                         //       ),
                          //                                         //     ),
                          //                                         //   ),
                          //                                         // ),
                          //                                         // border: OutlineInputBorder(
                          //                                         //   borderRadius: BorderRadius.circular(10),
                          //                                         //   borderSide: BorderSide(
                          //                                         //     color: Colors.white,
                          //                                         //     width: 2,
                          //                                         //   ),
                          //                                         // ),
                          //                                         // focusedBorder: new OutlineInputBorder(
                          //                                         //   borderRadius: new BorderRadius.circular(10.0),
                          //                                         //   borderSide: BorderSide(
                          //                                         //     color: Colors.white60,
                          //                                         //     width: 2,
                          //                                         //   ),
                          //                                         // ),
                          //                                         // enabledBorder: OutlineInputBorder(
                          //                                         //   borderRadius: BorderRadius.circular(10),
                          //                                         //   borderSide: BorderSide(
                          //                                         //     color: Colors.white,
                          //                                         //     width: 2,
                          //                                         //   ),
                          //                                         // ),
                          //                                         ),
                                          
                          //             ),
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextFormField(
                              controller: _phoneController,
                               keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                fillColor: Colors.white60,
                                hintText: 'Phone Number',
                                hintStyle: TextStyle(
                                    color: Colors.black, fontSize: 15),
                                filled: true,
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 14, horizontal: 15),
                                  child: Text(
                                    " (+91) ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                suffixIcon: InkWell(
                                  onTap: () async {
                                      check();
                                      // alert();
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
                                            // ignore: deprecated_member_use
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
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 15),
                                    child: Text(
                                      'Send OTP',
                                      style: TextStyle(
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
                          // SafeArea(
                          //     child: Container(
                          //   padding: EdgeInsets.all(16),
                          //   child: isLoading
                          //       ? Center(
                          //           child: CircularProgressIndicator(),
                          //         )
                          //       : currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
                          //           ? getMobileFormWidget(context)
                          //           : getOtpFormWidget(context),
                          // )),
                          
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
                                      fontSize: 16, color: Colors.black),
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
                          TextFormField(
                            controller: _otpController,
                            decoration: InputDecoration(hintText: "Enter OTP"),
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

                            signInWithPhoneAuthCredential(phoneAuthCredential);
                              },
                              child: Text(
                                'Validate OTP',
                                style: TextStyle(
                                    fontFamily: 'Roboto',
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
