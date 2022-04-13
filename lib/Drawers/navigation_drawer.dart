// ignore_for_file: must_be_immutable

import 'package:chef_connect_india/Main%20Screen/home.dart';
// import 'package:chef_connect_india/main.dart';
import 'package:chef_connect_india/Main%20Screen/select_mode.dart';
import 'package:chef_connect_india/user_portal/user_bookings.dart';
import 'package:chef_connect_india/user_portal/user_home.dart';
import 'package:chef_connect_india/user_portal/user_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavBar extends StatelessWidget {
  // CollectionReference _collectionRef =
  //     FirebaseFirestore.instance.collection("users");
  var user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) => Material(
        color: Color(0xFFF03203C),
        child: StreamBuilder<Object>(
            stream: FirebaseFirestore.instance
                .collection("users")
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              var data = snapshot.data;
              if (data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return InkWell(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => user_profile(),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.only(
                      top: 24 + MediaQuery.of(context).padding.top, bottom: 24),
                  child: Column(children: [
                    CircleAvatar(
                      radius: 52,
                      backgroundImage: NetworkImage(data['profilepic']),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      '${data['username'].toString().toLowerCase()}',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${data['mobile1']}',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                      ),
                    )
                  ]),
                ),
              );
            }),
      );

  Widget buildMenuItems(BuildContext context) => Container(
        padding: const EdgeInsets.all(24),
        child: Wrap(
          runSpacing: 10,
          children: [
            ListTile(
              leading: Icon(Icons.home_outlined),
              title: Text(
                'Home',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                ),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => user_home(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite_border),
              title: Text(
                'My Bookings',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => user_bookings(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.location_on_outlined),
              title: Text(
                'Location',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Select_mode_new(),
                  ),
                );
              },
            ),
            Divider(
              thickness: 2,
            ),
            // ListTile(
            //   leading: Icon(Icons.person_outline),
            //   title: Text('Profile'),
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => user_profile(),
            //       ),
            //     );
            //   },
            // ),
            ListTile(
              title: Text(
                'Logout',
                style: TextStyle(fontFamily: 'Montserrat'),
              ),
              leading: Icon(Icons.exit_to_app),
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove('uid');
                await FirebaseAuth.instance.signOut().then((_) {
                  Navigator.pushAndRemoveUntil(
                      (context),
                      MaterialPageRoute(
                          builder: (context) => ChefConnectMain()),
                      (route) => false);
                });
              },
            ),
          ],
        ),
      );
}
