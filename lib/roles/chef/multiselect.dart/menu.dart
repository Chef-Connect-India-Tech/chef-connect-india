import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class predefinedmenu extends StatefulWidget {
  predefinedmenu({Key? key}) : super(key: key);

  @override
  State<predefinedmenu> createState() => _predefinedmenuState();
}

class _predefinedmenuState extends State<predefinedmenu> {
  var a = FirebaseAuth.instance.currentUser!.uid;
  List starterslist = [];
  List maincourselist = [];
  List dessertslist = [];
  Future<void> _pushdata() async {
    print('=====================>>>>>>>>>>>>>>>>>>>sx');
    print(a);
    FirebaseFirestore.instance
        .collection('chefs')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
      'startersselectedlist': selectedList0.join(" , "),
    }, SetOptions(merge: true));
  }

  Future<void> _pushdata1() async {
    print('=====================>>>>>>>>>>>>>>>>>>>sx');
    print(a);
    FirebaseFirestore.instance
        .collection('chefs')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
      'DesertsSelectedlist': selectedList1.join(" , "),
    }, SetOptions(merge: true));
  }

  Future<void> _pushdata2() async {
    print('=====================>>>>>>>>>>>>>>>>>>>sx');
    print(a);
    FirebaseFirestore.instance
        .collection('chefs')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
      'MaincourseSelectedlist': selectedList2.join(" , "),
    }, SetOptions(merge: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        // shadowColor: Colors.deepPurpleAccent,
        toolbarHeight: 70, // default is 56
        // toolbarOpacity: 0.5,
        elevation: 50.0,
        title: Text('MENU'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("chefs")
                .doc(FirebaseAuth.instance.currentUser!.uid)
                // .collection("menu")
                // .doc(FirebaseAuth.instance.currentUser!.uid)
                .snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              var data = snapshot.data;
              if (data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Starters',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 160,
                          ),
                          InkWell(
                            onTap: ()
                                //async {
                                //await openDialog(data);
                                {
                              _startersdialog();
                            },
                            child: Icon(
                              Icons.edit,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                          height: 150,
                          width: 360,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.16),
                                offset: Offset(0, 3.0),
                                blurRadius: 12.0,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  // Expanded(
                                  //   child: Text(
                                  //     (selectedList.join(" , ")),
                                  //   ),
                                  // ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    (() {
                                      if (data['startersselectedlist'] ==
                                          null) {
                                        return "Null";
                                      }
                                      return data['startersselectedlist'];
                                    })(),
                                    style: GoogleFonts.roboto(
                                      fontSize: 15.0,
                                      color: const Color(0xFF4A4B4D),
                                      // fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Main Course',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 160,
                          ),
                          InkWell(
                            onTap: ()
                                //async {
                                //await openDialog(data);
                                {
                              _maincoursedialog();
                            },
                            child: Icon(
                              Icons.edit,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                          height: 150,
                          width: 360,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.16),
                                offset: Offset(0, 3.0),
                                blurRadius: 12.0,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  // Expanded(
                                  //   child: Text(
                                  //     (selectedList.join(" , ")),
                                  //   ),
                                  // ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    (() {
                                      if (data['DesertsSelectedlist'] == null) {
                                        return "Null";
                                      }
                                      return data['DesertsSelectedlist'];
                                    })(),
                                    style: GoogleFonts.roboto(
                                      fontSize: 15.0,
                                      color: const Color(0xFF4A4B4D),
                                      // fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Desserts',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          InkWell(
                            onTap: ()
                                //async {
                                //await openDialog(data);
                                {
                              _dessertsdialog();
                            },
                            child: Icon(
                              Icons.edit,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                          height: 150,
                          width: 360,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.16),
                                offset: Offset(0, 3.0),
                                blurRadius: 12.0,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  // Expanded(
                                  //   child: Text(
                                  //     (selectedList.join(" , ")),
                                  //   ),
                                  // ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    (() {
                                      if (data['MaincourseSelectedlist'] ==
                                          null) {
                                        return "Null";
                                      }
                                      return data['MaincourseSelectedlist'];
                                    })(),
                                    style: GoogleFonts.roboto(
                                      fontSize: 15.0,
                                      color: const Color(0xFF4A4B4D),
                                      // fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  List<String> selectedList0 = [];
  List<String> selectedList1 = [];
  List<String> selectedList2 = [];

  _startersdialog() {
    var docc = 'j1YKrWBIXKjSWizr0Qe0';
    // Get docs from collection reference
    FirebaseFirestore.instance
        .collection('menu')
        .doc(docc)
        .collection("starters")
        .get()
        .then((snapshot) => {
              snapshot.docs.forEach((doc) {
                starterslist.add(doc['dish']);
              })
            });
    print(starterslist);
    List<String> Listofsets = starterslist.cast<String>().toSet().toList();
    print(Listofsets);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          //Here we will build the content of the dialog
          return AlertDialog(
            title: Text("Select Starters"),
            content: MultiSelectChip(
              Listofsets,
              onSelectionChanged: (selectedList) {
                setState(() {
                  selectedList0 = selectedList;
                });
              },
            ),
            actions: <Widget>[
              Row(
                children: [
                  FlatButton(
                      child: Text("Select"),
                      onPressed: () {
                        _pushdata();
                        Navigator.of(context).pop();
                      }),
                  FlatButton(
                      child: Text("No"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                ],
              )
            ],
          );
        });
  }

  _maincoursedialog() {
    var docc = 'j1YKrWBIXKjSWizr0Qe0';
    // Get docs from collection reference
    FirebaseFirestore.instance
        .collection('menu')
        .doc(docc)
        .collection("main course")
        .get()
        .then((snapshot) => {
              snapshot.docs.forEach((doc) {
                maincourselist.add(doc['dish']);
              })
            });
    print(maincourselist);
    List<String> Listofsets = maincourselist.cast<String>().toSet().toList();
    print(Listofsets);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          //Here we will build the content of the dialog
          return AlertDialog(
            title: Text("Select Starters"),
            content: MultiSelectChip(
              Listofsets,
              onSelectionChanged: (selectedList) {
                setState(() {
                  selectedList1 = selectedList;
                });
              },
            ),
            actions: <Widget>[
              Row(
                children: [
                  FlatButton(
                      child: Text("Select"),
                      onPressed: () {
                        _pushdata1();
                        Navigator.of(context).pop();
                      }),
                  FlatButton(
                      child: Text("No"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                ],
              )
            ],
          );
        });
  }

  _dessertsdialog() {
    var docc = 'j1YKrWBIXKjSWizr0Qe0';
    // Get docs from collection reference
    FirebaseFirestore.instance
        .collection('menu')
        .doc(docc)
        .collection("desserts")
        .get()
        .then((snapshot) => {
              snapshot.docs.forEach((doc) {
                dessertslist.add(doc['dish']);
              })
            });
    print(dessertslist);
    List<String> Listofsets = dessertslist.cast<String>().toSet().toList();
    print(Listofsets);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          //Here we will build the content of the dialog
          return AlertDialog(
            title: Text("Select Starters"),
            content: MultiSelectChip(
              Listofsets,
              onSelectionChanged: (selectedList) {
                setState(() {
                  selectedList2 = selectedList;
                });
              },
            ),
            actions: <Widget>[
              Row(
                children: [
                  FlatButton(
                      child: Text("Select"),
                      onPressed: () {
                        _pushdata2();
                        Navigator.of(context).pop();
                      }),
                  FlatButton(
                      child: Text("No"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                ],
              )
            ],
          );
        });
  }
}

class MultiSelectChip extends StatefulWidget {
  final List<String> Listofsets;
  final Function(List<String>) onSelectionChanged;

  MultiSelectChip(this.Listofsets, {required this.onSelectionChanged});

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  // String selectedChoice = "";
  List<String> selectedChoices = [];
  List<Widget> choices1 = [];
  _buildChoiceList() {
    List<Widget> choices = [];

    widget.Listofsets.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          label: Text(item),
          selected: selectedChoices.contains(item),
          onSelected: (selected) {
            setState(() {
              selectedChoices.contains(item)
                  ? selectedChoices.remove(item)
                  : selectedChoices.add(item);
              widget.onSelectionChanged(selectedChoices);
            });
          },
        ),
      ));
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}
