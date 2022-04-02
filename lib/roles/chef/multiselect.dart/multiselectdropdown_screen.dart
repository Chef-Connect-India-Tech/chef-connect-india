import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyHomePage1 extends StatefulWidget {
  MyHomePage1({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePage1State createState() => _MyHomePage1State();
}

class _MyHomePage1State extends State<MyHomePage1> {
  List favoriteMovies1 = [];
  Future<void> getData() async {
    var docc = 'pDSWbcECuimgt7HS6Xi6';
    // Get docs from collection reference
    FirebaseFirestore.instance
        .collection('Menu')
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

  List<String> selectedReportList = [];

  _showReportDialog() {
    var docc = 'pDSWbcECuimgt7HS6Xi6';
    // Get docs from collection reference
    FirebaseFirestore.instance
        .collection('Menu')
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("Select"),
              onPressed: () => _showReportDialog(),
            ),
            Text(selectedReportList.join(" , ")),
          ],
        ),
      ),
    );
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
