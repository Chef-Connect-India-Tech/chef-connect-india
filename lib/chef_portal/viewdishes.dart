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
        //title: "viewdish Event",
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
                customisedlist(),
                predefinedlist(cid: 'null'),
                //Icon(Icons.games),w
              ]),
            )));
  }
} // ignore: non_constant_identifier_names

//import 'dart:html';

// ignore_for_file: must_be_immutable

class customisedlist extends StatefulWidget {
  const customisedlist({Key? key}) : super(key: key);
  @override
  State<customisedlist> createState() => _customisedlistState();
}

class _customisedlistState extends State<customisedlist> {
  Widget build(BuildContext context) {
    List listt = [];
    return Scaffold(
      body: Scrollbar(
        isAlwaysShown: true,
        child: PaginateFirestore(
          itemBuilderType:
              PaginateBuilderType.listView, //Change types accordingly
          itemBuilder: (context, documentSnapshots, index) {
            final data = documentSnapshots[index].data() as Map?;
            print('---------');
            print(data!['customised menu'].toString());
            return ListTile(
              leading: const CircleAvatar(child: Icon(Icons.food_bank)),
              title: data == null
                  ? const Text('Error in data')
                  : Text(data['customised menu'].toString()),
            );
          },
          // orderBy is compulsory to enable pagination
          query: FirebaseFirestore.instance
              .collection('Menu')
              .where("cid", isEqualTo: FirebaseAuth.instance.currentUser!.uid),
          itemsPerPage: 5,
          // to fetch real-time data
          isLive: true,
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
      body: Scrollbar(
        isAlwaysShown: true,
        child: PaginateFirestore(
          itemBuilderType:
              PaginateBuilderType.listView, //Change types accordingly
          itemBuilder: (context, documentSnapshots, index) {
            final data = documentSnapshots[index].data() as Map?;
            return Container(
              child: listpredefined(
                desserts: data!['desserts'],
                maincourse: data['main course'],
                starters: data['starters'],
                menuname: data['menu name'],
              ),
            );
          },
          // orderBy is compulsory to enable pagination
          query: FirebaseFirestore.instance
              .collection('Menu')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection("menu"),
          itemsPerPage: 5,
          // to fetch real-time data
          isLive: true,
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
    return Align(
      // padding: const EdgeInsets.all(4.0),
      alignment: Alignment(0.03, -0.77),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {},
          child: SizedBox(
            width: 360.0,
            height: 158.0,
            child: Stack(
              children: <Widget>[
                Positioned(
                  right: 10.0,
                  child: Container(
                    alignment: Alignment(0.2, 0.0),
                    width: 345.0,
                    height: 158.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(30.0),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 150.0,
                          height: 142.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "${widget.menuname}'s menu",
                                style: GoogleFonts.roboto(
                                  fontSize: 20.0,
                                  color: const Color(0xFF4A4B4D),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                'starters: ${widget.starters}',
                                style: GoogleFonts.roboto(
                                  fontSize: 15.0,
                                  color: const Color(0xFFB6B7B7),
                                  height: 1.11,
                                ),
                              ),
                              Text(
                                'maincourse: ${widget.maincourse}',
                                style: GoogleFonts.roboto(
                                  fontSize: 15.0,
                                  color: const Color(0xFFB6B7B7),
                                  height: 1.11,
                                ),
                              ),
                              Text(
                                'desserts: ${widget.desserts}',
                                style: GoogleFonts.roboto(
                                  fontSize: 15.0,
                                  color: const Color(0xFFB6B7B7),
                                  height: 1.11,
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
                      ],
                    ),
                  ),
                ),

                // Positioned(
                //   right: 0,
                //   bottom: 61.0,
                //   child: Container(
                //     alignment: Alignment(0.04, -0.04),
                //     width: 33.0,
                //     height: 33.0,
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
