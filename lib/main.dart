import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:glass_morphism/Main%20Screen/User_login.dart';
import 'package:glass_morphism/Main%20Screen/chef/Chef_login.dart';
import 'package:glass_morphism/Main%20Screen/select_mode.dart';
// import 'package:glass_morphism/Main%20Screen/select_mode.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:firebase_core/firebase_core.dart';

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
      home: ChefConnectMain(),
    );
  }
}

class ChefConnectMain extends StatefulWidget {
  @override
  State<ChefConnectMain> createState() => ChefConnectMainState();
}

class ChefConnectMainState extends State<ChefConnectMain> {
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
                      SizedBox(
                        height: 60,
                      ),
                      CircleAvatar(
                        backgroundColor: Color(0xFF092349),
                        radius: 100,
                        child: Image.asset('assets/CCI1.png'),
                      ),
                      SizedBox(
                        height: 120,
                      ),
                      SizedBox(
                        height: 50,
                        width: 280,
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
                            'Sign in as User',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 50,
                        width: 280,
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
                            onPrimary: Color.fromARGB(255, 18, 68, 138),
                          ),
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                (context),
                                MaterialPageRoute(
                                    builder: (context) => Chef_login()),
                                (route) => false);
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
