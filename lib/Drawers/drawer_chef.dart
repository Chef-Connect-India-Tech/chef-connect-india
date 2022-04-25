import 'package:flutter/material.dart';

import '../Main Screen/privacy_policy.dart';

class chef_drawer extends StatefulWidget {
  chef_drawer({Key? key}) : super(key: key);

  @override
  State<chef_drawer> createState() => _chef_drawerState();
}

class _chef_drawerState extends State<chef_drawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 40,
                left: 20,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.indigo,
                    child: Image.asset(
                      'assets/mainlogo/cci_main.png',
                      height: 50,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Chef Connect',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Divider(
                thickness: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
              ),
              child: ListTile(
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
            ),
            // Padding(
            //   padding: const EdgeInsets.only(
            //     left: 40,
            //     top: 40,
            //   ),
            //   child: ListTile(
            //     leading: Icon(
            //       Icons.dashboard,
            //       color: Colors.white,
            //       size: 24,
            //     ),
            //     onTap: () {
            //       Navigator.pushAndRemoveUntil(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) => Dashboard(),
            //           ),
            //           (route) => false);
            //     },
            //     title: Text(
            //       'Dashboard',
            //       style: TextStyle(
            //         color: Colors.white,
            //         fontFamily: 'Montserrat',
            //         fontSize: 18,
            //       ),
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(
            //     left: 40,
            //     top: 40,
            //   ),
            //   child: ListTile(
            //     onTap: () {
            //       Navigator.pushAndRemoveUntil(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) => Projects(),
            //           ),
            //           (route) => false);
            //     },
            //     leading: Icon(
            //       Icons.settings_outlined,
            //       color: Colors.white,
            //       size: 24,
            //     ),
            //     title: Text(
            //       'Projects',
            //       style: TextStyle(
            //         fontFamily: 'Montserrat',
            //         color: Colors.white,
            //         fontSize: 19,
            //       ),
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(
            //     top: 40,
            //     left: 40,
            //   ),
            //   child: ListTile(
            //     leading: Icon(
            //       Icons.groups_outlined,
            //       color: Colors.white,
            //       size: 24,
            //     ),
            //     title: Text(
            //       'Team',
            //       style: TextStyle(
            //         fontFamily: 'Montserrat',
            //         color: Colors.white,
            //         fontSize: 18,
            //       ),
            //     ),
            //     onTap: () {
            //       Navigator.pushAndRemoveUntil(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) => Teams(),
            //           ),
            //           (route) => false);
            //     },
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(
            //     left: 40,
            //     top: 40,
            //   ),
            //   child: ListTile(
            //     leading: Icon(
            //       Icons.settings_outlined,
            //       color: Colors.white,
            //       size: 24,
            //     ),
            //     title: Text(
            //       'Task Manager',
            //       style: TextStyle(
            //         fontFamily: 'Montserrat',
            //         color: Colors.white,
            //         fontSize: 18,
            //       ),
            //     ),
            //     onTap: () {
            //       Navigator.pushAndRemoveUntil(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) => TaskManager(),
            //           ),
            //           (route) => false);
            //     },
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(
            //     left: 40,
            //     top: 40,
            //   ),
            //   child: ListTile(
            //     leading: Icon(
            //       Icons.logout,
            //       color: Colors.white,
            //       size: 24,
            //     ),
            //     title: Text(
            //       'Log Out',
            //       style: TextStyle(
            //         fontFamily: 'Montserrat',
            //         color: Colors.white,
            //         fontSize: 18,
            //       ),
            //     ),
            //     onTap: () {
            //       showDialog(
            //         context: context,
            //         builder: (context) => AlertDialog(
            //           title: Text(
            //             'Are you sure you want to\n               logout ?',
            //             style: TextStyle(
            //               fontFamily: 'Montserrat',
            //               color: Colors.black,
            //               fontSize: 18,
            //             ),
            //           ),
            //           actions: [
            //             Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //               children: [
            //                 ElevatedButton(
            //                   style: ElevatedButton.styleFrom(
            //                     primary: Color(0xFF7B931B),
            //                   ),
            //                   onPressed: () {
            //                     Navigator.pop(context);
            //                   },
            //                   child: Text(
            //                     'No',
            //                     style: TextStyle(
            //                       fontFamily: 'Montserrat',
            //                       color: Colors.white,
            //                       fontSize: 18,
            //                     ),
            //                   ),
            //                 ),
            //                 TextButton(
            //                   onPressed: () {
            //                     Navigator.pushAndRemoveUntil(
            //                         context,
            //                         MaterialPageRoute(
            //                           builder: (context) => LoginPage(),
            //                         ),
            //                         (route) => false);
            //                   },
            //                   child: Text(
            //                     'Yes',
            //                     style: TextStyle(
            //                       fontFamily: 'Montserrat',
            //                       color: Color(0xFF7B931B),
            //                       fontSize: 18,
            //                     ),
            //                   ),
            //                 )
            //               ],
            //             )
            //           ],
            //         ),
            //       );
            //       // sharedPreferences.clear();
            //       // sharedPreferences.commit();
            //       // Navigator.pushAndRemoveUntil(
            //       //     context,
            //       //     MaterialPageRoute(
            //       //       builder: (context) => LoginPage(),
            //       //     ),
            //       //     (route) => false);
            //     },
            //   ),
          ],
        ),
      ),
    );
  }
}
