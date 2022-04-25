// ignore_for_file: must_be_immutable

import 'package:chef_connect_india/Main%20Screen/home.dart';
import 'package:chef_connect_india/Main%20Screen/privacy_policy.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class chef_navBar extends StatelessWidget {
  var user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("chefs")
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            var data = snapshot.data;
            if (data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Material(
                    color: Colors.indigo.shade700,
                    child: InkWell(
                      child: Container(
                        padding: EdgeInsets.only(
                            top: 24 + MediaQuery.of(context).padding.top,
                            bottom: 24),
                        child: Column(children: [
                          CircleAvatar(
                            radius: 52,
                            backgroundImage: NetworkImage(data['profilepic']),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            '${data['chefid'].toString().toLowerCase()}',
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
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(24),
                    child: Wrap(
                      runSpacing: 10,
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.privacy_tip_outlined,
                          ),
                          title: Text(
                            'Privacy Policy',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => privacy_polocy(),
                              ),
                            );
                          },
                        ),
                        Divider(
                          thickness: 2,
                        ),
                        ListTile(
                          title: Text(
                            'Logout',
                            style: TextStyle(fontFamily: 'Montserrat'),
                          ),
                          leading: Icon(Icons.exit_to_app),
                          onTap: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
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
                  )
                ],
              ),
            );
          }),
    );
  }
}
