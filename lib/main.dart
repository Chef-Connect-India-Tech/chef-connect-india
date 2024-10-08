// ignore_for_file: deprecated_member_use
import 'dart:async';
import 'dart:developer';
import 'package:chef_connect_india/Helper/utils.dart';
import 'package:chef_connect_india/Main%20Screen/home.dart';
// import 'package:chef_connect_india/Main%20Screen/home.dart';
import 'package:chef_connect_india/chef_portal/chef_dashboard.dart';
import 'package:chef_connect_india/roles/chef/chef_registration_1.dart';
// import 'package:chef_connect_india/splash_screen.dart';
import 'package:chef_connect_india/user_portal/user_home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'onboarding_Screen/onboarding_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  FlutterNativeSplash.removeAfter(initialization);
  runApp(MyApp());
}

Future initialization(BuildContext? context) async {
  await Future.delayed(Duration(seconds: 2));
}

bool chef = false;

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    checkRole();
    super.initState();
  }

  Future<void> checkRole() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    chef = (pref.getBool('chefRole') ?? true);
  }

  Widget build(BuildContext context) {
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Chef Connect',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          // routes: {
          // '/detailsScreen': (context) => DetailsScreen(),
          // '/mainPage': (context) => ChefConnectMain(),
          // },
          home: snapshot.connectionState != ConnectionState.done
              ? Loading()
              : StreamBuilder(
                  stream: FirebaseAuth.instance.authStateChanges(),
                  builder: (context, userSnapshot) {
                    if (userSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      log('Loading');
                      return Loading();
                    } else if (chef) {
                      if (userSnapshot.data != null) {
                        log('Logged in');
                        return StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection("chefs")
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .snapshots(),
                          builder: (context, snapShot) {
                            if (snapShot.connectionState ==
                                ConnectionState.waiting) {
                              return Loading();
                            } else {
                              if (snapShot.hasData) {
                                return chef_dashboard();
                              }
                              log('Has no data');
                              return chef_registration_one();
                            }
                          },
                        );
                      }
                    } else if (!chef) {
                      if (userSnapshot.data != null) {
                        log('Logged in');
                        return StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection("users")
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .snapshots(),
                          builder: (context, snapShot) {
                            if (snapShot.connectionState ==
                                ConnectionState.waiting) {
                              return Loading();
                            } else {
                              if (snapShot.hasData) {
                                return user_home();
                              }
                              log('Has no data');
                              return Onboarding_screen();
                            }
                          },
                        );
                      }
                    }
                    log('UserSnapshot = null');
                    return ChefConnectMain();
                  },
                ),
        );
      },
    );
  }
}
