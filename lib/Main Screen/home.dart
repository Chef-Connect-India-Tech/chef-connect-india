// ignore_for_file: unused_local_variable

import 'package:chef_connect_india/chef_portal/chef_dashboard.dart';
import 'package:chef_connect_india/main.dart';
import 'package:chef_connect_india/roles/user/user_home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // String uid = "";
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     drawer: NavBar(),
  //     appBar: AppBar(
  //       backgroundColor: Colors.indigo[900],
  //       title: const Text('Home'),
  //     ),
  //     body: Center(
  //       child: Center(
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Text(
  //               "Chef Connect",
  //               style: TextStyle(
  //                 color: Colors.indigo[900],
  //                 fontSize: 50,
  //               ),
  //             ),
  //             Text(
  //               "city: ${widget.city}",
  //               style: TextStyle(
  //                 color: Colors.indigo[900],
  //                 fontSize: 30,
  //               ),
  //             ),
  //             Text(
  //               "hire mode: ${widget.hiremode}",
  //               style: TextStyle(
  //                 color: Colors.indigo[900],
  //                 fontSize: 30,
  //               ),
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 const Text(
  //                   "Logout",
  //                   style: TextStyle(
  //                     color: Colors.red,
  //                     fontSize: 30,
  //                   ),
  //                 ),
  //                 IconButton(
  //                   icon: Icon(Icons.logout),
  //                   onPressed: () async {
  //                     await FirebaseAuth.instance.signOut();
  //                     Navigator.pushReplacement(
  //                       context,
  //                       MaterialPageRoute(
  //                         builder: (context) => USer_login(),
  //                       ),
  //                     );
  //                   },
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            // UserHelper.saveUser(snapshot.data);
            return StreamBuilder<DocumentSnapshot>(
              stream: getNames(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  final userDoc = snapshot.data;
                  final user = userDoc!.data();
                  if (userDoc['role'] == 'admin') {
                    return chef_dashboard();
                    // }
                    // else if (userDoc['role'] == 'manager') {
                    //   return Manager_Home();
                  } else {
                    return user_home();
                  }
                } else {
                  return Material(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            );
          }
          return ChefConnectMain();
        });
  }
}

class ButtonWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.icon,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(50),
        ),
        child: buildContent(),
        onPressed: onClicked,
      );

  Widget buildContent() => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 28),
          SizedBox(width: 16),
          Text(
            text,
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
        ],
      );
}

getNames() async {
  QuerySnapshot users =
      await FirebaseFirestore.instance.collection("users").get();
  QuerySnapshot chefs =
      await FirebaseFirestore.instance.collection("chefs").get();
  List<DocumentSnapshot> list1 = users.docs;
  list1.addAll(chefs.docs);
  print(
      "----------------------------------list of users: ${list1}--------------------------------------------------------------");
  return list1;
}
