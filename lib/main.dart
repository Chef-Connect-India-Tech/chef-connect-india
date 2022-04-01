import 'dart:async';
import 'package:chef_connect_india/onboarding_Screen/onboarding_screen.dart';
import 'package:chef_connect_india/roles/user/select_mode.dart';
import 'package:flutter/material.dart';
import 'package:chef_connect_india/roles/user/User_login.dart';
// import 'package:chef_connect_india/roles/chef/chef_dashboard.dart';
import 'package:chef_connect_india/roles/chef/chef_login.dart';
// import 'package:chef_connect_india/roles/user/User_d.dart';
// import 'package:chef_connect_india/roles/user/user_home.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chef Connect India',
      home: Onboarding_screen(),
      // home: user_profile(),
      // home: custom_menu(),
      // home: chef_registration_one(phonenumber: '+917337504725'),
    );
  }
}

String? finalPhone;

class ChefConnectMain extends StatefulWidget {
  @override
  State<ChefConnectMain> createState() => ChefConnectMainState();
}

class ChefConnectMainState extends State<ChefConnectMain> {
  // @override
  void initstate() {
    getValidationData().whenComplete(() async {
      Timer(Duration(seconds: 2), () => Select_Mode());
    });
    super.initState();
  }

  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedPhone = sharedPreferences.getString('mobile1');
    setState(() {
      finalPhone = obtainedPhone;
    });
    print(finalPhone);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
                        Color(0xFFffffff).withOpacity(0.0),
                        Color(0xFFFFFFFF).withOpacity(0.0),
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
                      SizedBox(
                        height: 5,
                      ),
                      CircleAvatar(
                        backgroundColor: Color(0xFF092349),
                        radius: 100,
                        child: Image.asset('assets/CCI1.png'),
                      ),
                      SizedBox(
                        height: 240,
                      ),
                      SizedBox(
                        height: 50,
                        width: 280,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              // side: BorderSide(
                              //   color: Colors.b,
                              //   width: 3,
                              // ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            primary: Colors.white,
                            onPrimary: Color.fromARGB(255, 18, 68, 138),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => USer_login(),
                              ),
                            );
                          },
                          child: Text(
                            'Sign in as Customer',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        height: 50,
                        width: 280,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              // side: BorderSide(
                              //   color: Colors.blueGrey,
                              //   width: 3,
                              // ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            primary: Colors.white,
                            onPrimary: Color.fromARGB(255, 18, 68, 138),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => chef_login(),
                              ),
                            );
                          },
                          child: Text(
                            'Sign in as Chef',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
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
