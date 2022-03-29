// import 'dart:async';  
// import 'package:chef_connect_india/roles/user/select_mode.dart';
// import 'package:chef_connect_india/roles/user/user_profile.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';  
  
// class checkuser extends StatefulWidget {  
//   @override  
//   SplashScreenState createState() => SplashScreenState();  
// }  
// class SplashScreenState extends State<checkuser> {  
//   @override  
//   void initState() {  
//     super.initState();  
//     Timer(Duration(seconds: 5),  
//             (){
//                FirebaseAuth auth = FirebaseAuth.instance;
//                 String uid = auth.currentUser!.uid.toString();
//                 print('-----------------');
//                FirebaseFirestore.instance
//                     .collection('users')
//                     .doc(uid)
//                     .get()
//                     .then((DocumentSnapshot documentSnapshot) {
//                   print(documentSnapshot.data());
//                   print(documentSnapshot['user']);
//                   if (documentSnapshot.data.containsValue("nova")) {
//                     print('===========');
//                     Navigator.push(
//                         context,
//                         new MaterialPageRoute(
//                             builder: (BuildContext context) =>
//                                user_profile()));
//                   } else {
//                     Navigator.of(context).push(new MaterialPageRoute(
//                         builder: (context) => Select_Mode()));
//                   }
//                 });
//                 }
//     );  
//   }  
//   @override  
//   Widget build(BuildContext context) {  
//     return Container(  
//         color: Colors.yellow,  
//         child:FlutterLogo(size:MediaQuery.of(context).size.height)  
//     );  
//   }  
// }  
// class HomeScreen extends StatelessWidget {  
//   @override  
//   Widget build(BuildContext context) {  
//     return Scaffold(  
//       appBar: AppBar(title:Text("Splash Screen Example")),  
//       body: Center(  
//           child:Text("Welcome to Home Page",  
//               style: TextStyle( color: Colors.black, fontSize: 30)  
//           )  
//       ),  
//     );  
//   }  
// }  