// ignore_for_file: must_be_immutable

import 'package:chef_connect_india/user_portal/user_checkout.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

class predefineduser extends StatefulWidget {
  late String cid;
  //late double rate1;
  var chefContact;
  String chefId;
  predefineduser({
    required this.cid,
    required this.chefContact,
    required this.chefId,
    //  required this.rate1
  });
  @override
  State<predefineduser> createState() => _predefineduserState();
}

class _predefineduserState extends State<predefineduser> {
  late int price;
  late double rate;
  void pp() async {
    var a = widget.cid;
    var collection = FirebaseFirestore.instance.collection('chefs');
    var docSnapshot = await collection.doc(a).get();
    if (docSnapshot.exists) {
      var data = docSnapshot.data()!;
      price = data['cheffees'];
      print(price);
      print('trail');
      rate = price + price * 0.25;
      print(rate);
    }
  }

  Future showToast(String message) async {
    await Fluttertoast.cancel();

    Fluttertoast.showToast(msg: message, fontSize: 18);
  }

  final isDialOpen = ValueNotifier(false);

  List _selectedMenuItems = [];
  @override
  Widget build(BuildContext context) {
    pp();

    print('lol');
    print(widget.chefId);
    print(widget.cid);
    return Scaffold(
      floatingActionButton: SpeedDial(
        child: Image(
          image: AssetImage('assets/customer-service.png'),
          height: 100,
        ),
        // animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Colors.black,
        overlayColor: Colors.black,
        overlayOpacity: 0.4,
        spacing: 10,
        spaceBetweenChildren: 10,
        closeManually: true,
        openCloseDial: isDialOpen,
        children: [
          SpeedDialChild(
              child: Image(
                image: AssetImage('assets/socialicons/gmail.png'),
                height: 35,
              ),
              backgroundColor: Colors.transparent,
              label: 'Mail',
              onTap: () {
                launch('mailto:chefconnectindia@gmail.com');
              }),
          // SpeedDialChild(
          //     child:
          //         Image(image: AssetImage('assets/socialicons/facebook.png')),
          //     // backgroundColor: Colors.blue,
          //     label: 'Facebook',
          //     onTap: () => () {
          //           launch("https://www.facebook.com/Chef-Connect");
          //         }),
          SpeedDialChild(
              child:
                  Image(image: AssetImage('assets/socialicons/whatsapp.png')),
              // backgroundColor: Colors.indigo,
              label: 'Whatsapp',
              onTap: () {
                launch("https://wa.me/+918107302002");
              }),
          SpeedDialChild(
            child: Image(image: AssetImage('assets/socialicons/instagram.png')),
            // backgroundColor: Colors.indigo,
            label: 'Instagram',
            onTap: () {
              launch("https://www.instagram.com/chefconnectindia");
            },
          ),
          SpeedDialChild(
              child: Image(image: AssetImage('assets/socialicons/twitter.png')),
              label: 'Twitter',
              onTap: () {
                launch("https://mobile.twitter.com/chefconnect_");
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PaginateFirestore(
              itemBuilderType: PaginateBuilderType.listView,
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.all(0.0),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, documentSnapshots, index) {
                final dataa = documentSnapshots[index].data() as Map?;

                return Container(
                  color: (_selectedMenuItems.contains(index))
                      ? Colors.blue.withOpacity(0.5)
                      : Colors.transparent,
                  child: GestureDetector(
                    child: listpredefined(
                      desserts: dataa!['desserts'],

                      // price: price + price * 0.25,
                      maincourse: dataa['main course'],
                      starters: dataa['starters'],
                      menuname: dataa['menu name'],
                      chefId: widget.chefId,
                      cid: widget.cid,
                      chefContact: widget.chefContact,
                      // price: rate,
                    ),
                  ),
                );
              },
              query: FirebaseFirestore.instance
                  .collection('Menu')
                  .doc(widget.cid)
                  .collection('menu'),
              isLive: true,
            ),
          ],
        ),
      ),
    );
  }
}

class listpredefined extends StatefulWidget {
  late List starters;
  late List maincourse;
  late List desserts;
  late String menuname;
  String chefId;
  String cid;
  var chefContact;
  //double price;
  listpredefined({
    required this.starters,
    required this.maincourse,
    required this.desserts,
    required this.menuname,
    required this.chefId,
    required this.cid,
    required this.chefContact,
    //  required this.price,
  });

  @override
  State<listpredefined> createState() => _listpredefinedState();
}

class _listpredefinedState extends State<listpredefined> {
  late int price;
  late double rate;
  void pp() async {
    var a = widget.cid;
    var collection = FirebaseFirestore.instance.collection('chefs');
    var docSnapshot = await collection.doc(a).get();
    if (docSnapshot.exists) {
      var data = docSnapshot.data()!;
      price = data['cheffees'];
      print(price);
      print('trail');
      rate = price + price * 0.25;
      print(rate);
    }
  }

  @override
  Widget build(BuildContext context) {
    pp();
    var scwidth = MediaQuery.of(context).size.width;
    bool selected = false;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ExpandableNotifier(
        child: Column(
          children: [
            Expandable(
              theme: ExpandableThemeData(
                  inkWellBorderRadius: BorderRadius.circular(50)),
              collapsed: ExpandableButton(
                // theme: ExpandableThemeData(iconColor: Colors.blue),
                child: Card(
                  elevation: 5,
                  child: Container(
                    padding: const EdgeInsets.only(left: 10.0),
                    width: scwidth - 90,
                    height: 100.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(10.0),
                        right: Radius.circular(10.0),
                      ),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.16),
                          offset: Offset(0, 3.0),
                          blurRadius: 12.0,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${widget.menuname}'s menu",
                              style: GoogleFonts.roboto(
                                fontSize: 20.0,
                                color: const Color(0xFF4A4B4D),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              expanded: Card(
                elevation: 5,
                child: Container(
                  padding: const EdgeInsets.only(left: 10.0),
                  width: scwidth - 90,
                  // height: 100.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(10.0),
                      right: Radius.circular(10.0),
                    ),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.1),
                        offset: Offset(0, 3),
                        blurRadius: 12.0,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 15, left: 50),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "${widget.menuname}'s menu",
                                      style: GoogleFonts.roboto(
                                        fontSize: 20.0,
                                        color: const Color(0xFF4A4B4D),
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    ExpandableButton(
                                      child: Icon(
                                        Icons.cancel_outlined,
                                        color: Colors.red,
                                      ),
                                    ),
                                    // IconButton(
                                    //   onPressed: () {
                                    //     Expandable;
                                    //   },
                                    //   icon: Icon(
                                    //     Icons.cancel_outlined,
                                    //     color: Colors.red,
                                    //   ),
                                    // )
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Starters:',
                                    style: GoogleFonts.roboto(
                                        fontSize: 18.0,
                                        color: const Color(0xFF4A4B4D),
                                        height: 1.11,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Wrap(
                                    spacing: 5.0,
                                    children: widget.starters
                                        .map(
                                          (e) => Chip(
                                            backgroundColor:
                                                Colors.orange.shade100,
                                            label: Text(
                                              e.toString().toLowerCase(),
                                              style: TextStyle(
                                                  color: Colors.orange.shade900,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Maincourse:',
                                    style: GoogleFonts.roboto(
                                        fontSize: 18.0,
                                        color: const Color(0xFF4A4B4D),
                                        height: 1.11,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Wrap(
                                    spacing: 5.0,
                                    children: widget.maincourse
                                        .map(
                                          (e) => Chip(
                                            backgroundColor:
                                                Colors.indigo.shade100,
                                            label: Text(
                                              e.toString().toLowerCase(),
                                              style: TextStyle(
                                                  color: Colors.indigo.shade900,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Desserts:',
                                    style: GoogleFonts.roboto(
                                        fontSize: 18.0,
                                        color: const Color(0xFF4A4B4D),
                                        height: 1.11,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Wrap(
                                    spacing: 5.0,
                                    children: widget.desserts
                                        .map(
                                          (e) => Chip(
                                            backgroundColor:
                                                Colors.blue.shade100,
                                            label: Text(
                                              e.toString().toLowerCase(),
                                              style: TextStyle(
                                                  color: Colors.blue.shade900,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          primary: Colors.indigo,
                          onPrimary: Color.fromARGB(255, 18, 68, 138),
                        ),
                        onPressed: () {
                          Fluttertoast.showToast(
                              msg: "Selected: ${widget.menuname}'s Menu",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.SNACKBAR,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                          // print(widget.menuname);
                          // print(widget.starters);
                          // print(widget.desserts);
                          // print(widget.maincourse);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => user_checkout(
                                    price: rate,
                                    chefId: widget.chefId,
                                    chefContact: widget.chefContact,
                                    menu: widget.menuname,
                                    starters: widget.starters,
                                    desserts: widget.desserts,
                                    maincourse: widget.maincourse,
                                    cid: widget.cid,
                                  )),
                            ),
                          );
                        },
                        child: Text(
                          'Select Menu',
                          style: TextStyle(
                            color: Colors.white,
                            // fontFamily: 'Montserrat',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
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
// class _listpredefinedState extends State<listpredefined> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: SizedBox(
//         width: 360.0,
//         height: 300.0,
//         child: Column(
//           children: <Widget>[
//             Container(
//               padding: const EdgeInsets.only(left: 10.0),
//               width: 345.0,
//               height: 300.0,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.horizontal(
//                   left: Radius.circular(10.0),
//                   right: Radius.circular(10.0),
//                 ),
//                 color: Colors.white,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.16),
//                     offset: Offset(0, 3.0),
//                     blurRadius: 12.0,
//                   ),
//                 ],
//               ),
//               child: SingleChildScrollView(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Padding(
//                       padding: const EdgeInsets.all(15.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             "${widget.menuname}'s menu",
//                             style: GoogleFonts.roboto(
//                               fontSize: 20.0,
//                               color: const Color(0xFF4A4B4D),
//                               fontWeight: FontWeight.w700,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Starters:',
//                           style: GoogleFonts.roboto(
//                               fontSize: 18.0,
//                               color: const Color(0xFF4A4B4D),
//                               height: 1.11,
//                               fontWeight: FontWeight.w500),
//                         ),
//                         Wrap(
//                           spacing: 5.0,
//                           children: widget.starters
//                               .map(
//                                 (e) => Chip(
//                                   backgroundColor: Colors.orange.shade100,
//                                   label: Text(
//                                     e.toString().toLowerCase(),
//                                     style: TextStyle(
//                                         color: Colors.orange.shade900,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(10)),
//                                 ),
//                               )
//                               .toList(),
//                         ),
//                       ],
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Maincourse:',
//                           style: GoogleFonts.roboto(
//                               fontSize: 18.0,
//                               color: const Color(0xFF4A4B4D),
//                               height: 1.11,
//                               fontWeight: FontWeight.w500),
//                         ),
//                         Wrap(
//                           spacing: 5.0,
//                           children: widget.maincourse
//                               .map(
//                                 (e) => Chip(
//                                   backgroundColor: Colors.indigo.shade100,
//                                   label: Text(
//                                     e.toString().toLowerCase(),
//                                     style: TextStyle(
//                                         color: Colors.indigo.shade900,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(10)),
//                                 ),
//                               )
//                               .toList(),
//                         ),
//                       ],
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Desserts:',
//                           style: GoogleFonts.roboto(
//                               fontSize: 18.0,
//                               color: const Color(0xFF4A4B4D),
//                               height: 1.11,
//                               fontWeight: FontWeight.w500),
//                         ),
//                         Wrap(
//                           spacing: 5.0,
//                           children: widget.desserts
//                               .map(
//                                 (e) => Chip(
//                                   backgroundColor: Colors.blue.shade100,
//                                   label: Text(
//                                     e.toString().toLowerCase(),
//                                     style: TextStyle(
//                                         color: Colors.blue.shade900,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(10)),
//                                 ),
//                               )
//                               .toList(),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class predefined_menu_list extends StatefulWidget {
//   late List starters;
//   late List maincourse;
//   late List desserts;
//   late String menuname;
//   predefined_menu_list({
//     Key? key,
//     required this.starters,
//     required this.maincourse,
//     required this.desserts,
//     required this.menuname,
//   }) : super(key: key);

//   @override
//   State<predefined_menu_list> createState() => _predefined_menu_listState();
// }

// class _predefined_menu_listState extends State<predefined_menu_list> {
//   bool _valu = false;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.3), //Offset
//               blurRadius: 10.0,
//               spreadRadius: 2.0,
//             ), //BoxShadow
//             BoxShadow(
//               color: Colors.white,
//               offset: const Offset(0.0, 0.0),
//               blurRadius: 0.0,
//               spreadRadius: 0.0,
//             ), //BoxShadow
//           ],
//         ), //BoxDecoration

//         /** CheckboxListTile Widget **/
//         child: CheckboxListTile(
//           title: Container(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Starters:',
//                       style: GoogleFonts.roboto(
//                           fontSize: 18.0,
//                           color: const Color(0xFF4A4B4D),
//                           height: 1.11,
//                           fontWeight: FontWeight.w500),
//                     ),
//                     Wrap(
//                       spacing: 5.0,
//                       children: widget.starters
//                           .map(
//                             (e) => Chip(
//                               backgroundColor: Colors.orange.shade100,
//                               label: Text(
//                                 e.toString().toLowerCase(),
//                                 style: TextStyle(
//                                     color: Colors.orange.shade900,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10)),
//                             ),
//                           )
//                           .toList(),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           subtitle: Container(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Maincourse:',
//                       style: GoogleFonts.roboto(
//                           fontSize: 18.0,
//                           color: const Color(0xFF4A4B4D),
//                           height: 1.11,
//                           fontWeight: FontWeight.w500),
//                     ),
//                     Wrap(
//                       spacing: 5.0,
//                       children: widget.maincourse
//                           .map(
//                             (e) => Chip(
//                               backgroundColor: Colors.indigo.shade100,
//                               label: Text(
//                                 e.toString().toLowerCase(),
//                                 style: TextStyle(
//                                     color: Colors.indigo.shade900,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10)),
//                             ),
//                           )
//                           .toList(),
//                     ),
//                   ],
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Desserts:',
//                       style: GoogleFonts.roboto(
//                           fontSize: 18.0,
//                           color: const Color(0xFF4A4B4D),
//                           height: 1.11,
//                           fontWeight: FontWeight.w500),
//                     ),
//                     Wrap(
//                       spacing: 5.0,
//                       children: widget.desserts
//                           .map(
//                             (e) => Chip(
//                               backgroundColor: Colors.blue.shade100,
//                               label: Text(
//                                 e.toString().toLowerCase(),
//                                 style: TextStyle(
//                                     color: Colors.blue.shade900,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10)),
//                             ),
//                           )
//                           .toList(),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           secondary: Container(
//             width: 80,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               // crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   "${widget.menuname}",
//                   style: GoogleFonts.roboto(
//                     fontSize: 20.0,
//                     color: const Color(0xFF4A4B4D),
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           autofocus: false,
//           isThreeLine: true,
//           activeColor: Colors.green,
//           checkColor: Colors.white,
//           selected: _valu,
//           value: _valu,
//           onChanged: (bool? value) {
//             setState(() {

//               _valu = value!;
//             });
//           },
//         ), //CheckboxListTile
//       ),
//     );
//   }
// }
