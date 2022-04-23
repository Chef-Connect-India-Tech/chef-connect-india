// import 'package:chef_connect_india/chef_portal/menus/predefined.dart';
// ignore_for_file: must_be_immutable
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paginate_firestore/paginate_firestore.dart';

class viewdish extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.indigo),
        home: DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                title: new Text(
                  'Dishes and Menu ',
                  style: TextStyle(color: Colors.indigo),
                  textAlign: TextAlign.center,
                ),
                actions: <Widget>[],
                leading: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios, color: Colors.indigo),
                ),
                backgroundColor: Colors.white,
                elevation: 0,
                bottom: TabBar(
                    // controller: ,
                    unselectedLabelColor: Colors.indigo,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.indigo),
                    tabs: [
                      Tab(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border:
                                  Border.all(color: Colors.indigo, width: 1)),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("My Dishes"),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border:
                                  Border.all(color: Colors.indigo, width: 1)),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("My Menu"),
                          ),
                        ),
                      ),
                    ]),
              ),
              body: TabBarView(children: [
                customisedlist(cid: ''),
                predefinedlist(cid: 'null'),
                //Icon(Icons.games),w
              ]),
            )));
  }
} // ignore: non_constant_identifier_names

//import 'dart:html';

// ignore_for_file: must_be_immutable

class customisedlist extends StatefulWidget {
  late String cid;
  customisedlist({required this.cid});
  @override
  State<customisedlist> createState() => _customisedlistState();
}

class _customisedlistState extends State<customisedlist> {
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    List listt = [];
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("Menu")
                      .where('cid',
                          isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(0.0),
                      scrollDirection: Axis.vertical,
                      primary: true,
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        var alldishes = [] + document["customised menu"];
                        print(document.data());
                        return Padding(
                          padding: const EdgeInsets.only(
                            top: 20,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 220,
                              width: width - 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.16),
                                    offset: Offset(0, 3.0),
                                    blurRadius: 12.0,
                                  ),
                                ],
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                100,
                                        child: Wrap(
                                          spacing: 5,
                                          children: alldishes
                                              .map((e) => Chip(
                                                    backgroundColor:
                                                        Colors.blue.shade100,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        10,
                                                      ),
                                                    ),
                                                    label: Text(
                                                      e,
                                                      style: TextStyle(
                                                        color: Colors
                                                            .blue.shade700,
                                                      ),
                                                    ),
                                                  ))
                                              .toList(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class predefinedlist extends StatefulWidget {
  late String cid;
  predefinedlist({required this.cid});
  @override
  State<predefinedlist> createState() => _predefinedlistState();
}

class _predefinedlistState extends State<predefinedlist> {
  List _selectedMenuItems = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("Menu")
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .collection('menu')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      // padding: const EdgeInsets.all(0.0),
                      scrollDirection: Axis.vertical,
                      primary: true,
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        print(document.data());
                        return Container(
                          child: GestureDetector(
                            child: listpredefined(
                              desserts: document['desserts'],
                              maincourse: document['main course'],
                              starters: document['starters'],
                              menuname: document['menu name'],
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
              ],
            ),
          ),
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
  listpredefined({
    required this.starters,
    required this.maincourse,
    required this.desserts,
    required this.menuname,
  });

  @override
  State<listpredefined> createState() => _listpredefinedState();
}

class _listpredefinedState extends State<listpredefined> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          // alignment: Alignment(0.2, 0.0),
          width: 245.0,
          height: 258.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(30.0),
              right: Radius.circular(30.0),
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 85),
                  child: Row(
                    children: [
                      Icon(
                        Icons.list_alt_sharp,
                        color: Colors.indigo,
                      ),
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
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Starters: ',
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Montserrat',
                          color: Colors.indigo.shade600,
                          height: 1.11,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 200,
                        child: Wrap(
                          spacing: 4,
                          children: widget.starters
                              .map((e) => Chip(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                    ),
                                    backgroundColor: Colors.orange.shade100,
                                    label: Text(e,
                                        style: TextStyle(
                                          color: Colors.orange.shade700,
                                        )),
                                  ))
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Maincourse: ',
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Montserrat',
                          color: Colors.indigo.shade600,
                          height: 1.11,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 200,
                        child: Wrap(
                          spacing: 4,
                          children: widget.maincourse
                              .map((e) => Chip(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                    ),
                                    backgroundColor: Colors.purple.shade100,
                                    label: Text(e,
                                        style: TextStyle(
                                          color: Colors.purple.shade700,
                                        )),
                                  ))
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Desserts: ',
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Montserrat',
                          color: Colors.indigo.shade600,
                        ),
                      ),
                      // Text(
                      //   '${widget.desserts}',
                      //   style: TextStyle(
                      //     fontSize: 15.0,
                      //     fontWeight: FontWeight.w600,
                      //     fontFamily: 'Montserrat',
                      //     color: Colors.indigo.shade600,
                      //   ),
                      // ),
                      Container(
                        width: MediaQuery.of(context).size.width - 200,
                        child: Wrap(
                          spacing: 4,
                          children: widget.desserts
                              .map((e) => Chip(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                    ),
                                    backgroundColor: Colors.blue.shade100,
                                    label: Text(
                                      e,
                                      style: TextStyle(
                                        color: Colors.blue.shade700,
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ),

                // Text(
                //   'spc: ${widget.speciality}',
                //   style: GoogleFonts.roboto(
                //     fontSize: 15.0,
                //     color: const Color(0xFFB6B7B7),
                //     height: 1.11,
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
