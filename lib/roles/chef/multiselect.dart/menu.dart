import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class predefinedmenu extends StatefulWidget {
  predefinedmenu({Key? key}) : super(key: key);

  @override
  State<predefinedmenu> createState() => _predefinedmenuState();
}

class _predefinedmenuState extends State<predefinedmenu> {
  List favoriteMovies1 = [];
  Future<void> getData() async {
    var docc = 'lHNpuzpJuz8CdzthmrBP';
    // Get docs from collection reference
    FirebaseFirestore.instance
        .collection('menu')
        .doc(docc)
        .collection("starters")
        .get()
        .then((snapshot) => {
              snapshot.docs.forEach((doc) {
                favoriteMovies1.add(doc['dish']);
              })
            });
    print(favoriteMovies1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Container(
                height: 180,
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
                    SizedBox(
                      height: 20,
                    ),
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Tabs',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
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
                          Expanded(
                            child: Text(
                              (selectedReportList.join(" , ")),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          // Text(data['address'])
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
              ),
              SizedBox(
                height: 15,
              ),
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
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<String> selectedReportList = [];

  _startersdialog() {
    var docc = 'lHNpuzpJuz8CdzthmrBP';
    // Get docs from collection reference
    FirebaseFirestore.instance
        .collection('menu')
        .doc(docc)
        .collection("starters")
        .get()
        .then((snapshot) => {
              snapshot.docs.forEach((doc) {
                favoriteMovies1.add(doc['dish']);
              })
            });
    print(favoriteMovies1);
    List<String> reportList1 = favoriteMovies1.cast<String>().toSet().toList();
    print(reportList1);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          //Here we will build the content of the dialog
          return AlertDialog(
            title: Text("Select Starters"),
            content: MultiSelectChip(
              reportList1,
              onSelectionChanged: (selectedList) {
                setState(() {
                  selectedReportList = selectedList;
                });
              },
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("Select"),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        });
  }
}

class MultiSelectChip extends StatefulWidget {
  final List<String> reportList1;
  final Function(List<String>) onSelectionChanged;

  MultiSelectChip(this.reportList1, {required this.onSelectionChanged});

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  // String selectedChoice = "";
  List<String> selectedChoices = [];

  _buildChoiceList() {
    List<Widget> choices = [];

    widget.reportList1.forEach((item) {
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
