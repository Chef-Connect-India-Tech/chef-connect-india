// ignore_for_file: must_be_immutable

import 'package:chef_connect_india/Main%20Screen/home.dart';
// import 'package:chef_connect_india/main.dart';
import 'package:chef_connect_india/Main%20Screen/select_mode.dart';
import 'package:chef_connect_india/roles/user/user_home.dart';
import 'package:chef_connect_india/roles/user/user_profile.dart';
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
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            onDetailsPressed: (() {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => user_profile(),
                ),
              );
            }),
            accountName: Text(user!.displayName.toString()),
            accountEmail: Text(user!.phoneNumber.toString()),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  '${user!.photoURL}',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage('assets/profile-bg.jpg')),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home Page'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => user_home(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('My Bookings'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Location'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Select_mode_new(),
                ),
              );
            },
          ),
          // ListTile(
          //   leading: Icon(Icons.person),
          //   title: Text('Hire Mode'),
          //   onTap: () {
          //     // Navigator.push(
          //     //   context,
          //     //   MaterialPageRoute(
          //     //     builder: (context) => Select_Mode(),
          //     //   ),
          //     // );
          //   },
          // ),
          Divider(
            thickness: 2,
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('FAQ'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Share'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Profile'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => user_profile(),
                ),
              );
            },
          ),
          Divider(
            thickness: 2,
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text('Policies'),
            onTap: () => null,
          ),
          Divider(
            thickness: 2,
          ),
          ListTile(
            title: Text('LogOut'),
            leading: Icon(Icons.exit_to_app),
            onTap: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.remove('uid');
              await FirebaseAuth.instance.signOut().then((_) {
                Navigator.pushAndRemoveUntil(
                    (context),
                    MaterialPageRoute(builder: (context) => ChefConnectMain()),
                    (route) => false);
              });
            },
          ),
        ],
      ),
    );
  }
}
