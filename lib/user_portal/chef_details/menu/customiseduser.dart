//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:paginate_firestore/paginate_firestore.dart';

class customiseduser extends StatefulWidget {
  late String cid;
  late List items;
  customiseduser({
    required this.cid,
    required this.items,
  });
  @override
  State<customiseduser> createState() => _customiseduserState();
}

class _customiseduserState extends State<customiseduser> {
  var name;
  // late List aa;

  // @override
  // void initState() {
  //   super.initState();
  //   aa = widget.items;
  // }

  var a = 'a';
  Widget build(BuildContext context) {
    print('customised user');
    print(widget.items);
    return PaginateFirestore(
      itemBuilderType: PaginateBuilderType.listView,
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.all(0.0),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, documentSnapshots, index) {
        a = documentSnapshots[index].id;
        final dataa = documentSnapshots[index].data() as Map?;
        return GestureDetector(
          //onTap: () => {print(widget.cid), print(dataa!['cid'])},
          child: listcustomised(
            dishes: dataa!['customised menu'],
            customisedmenu: widget.items,
            //cid: dataa['cid'],
          ),
          // child: ListTile(
          //   leading: const CircleAvatar(child: Icon(Icons.person)),
          //   title: dataa == null
          //       ? const Text('Error in data')
          //       : Text(dataa['customised menu'].toString()),
          //   subtitle: Text(documentSnapshots[index].id),
          // ),
        );
      },

      // orderBy is compulsory to enable pagination
      query: FirebaseFirestore.instance
          .collection('Menu')
          .where("cid", isEqualTo: widget.cid),
      // .doc(widget.cid)
      // .collection('customised menu'),
      // to fetch real-time datar
      isLive: true,
    );
  }
}

class listcustomised extends StatefulWidget {
  late List dishes;
  late List customisedmenu;
  // late List cid;
  listcustomised({
    required this.dishes,
    required this.customisedmenu,
    // required this.cid,
  });

  @override
  State<listcustomised> createState() => _listcustomisedState();
}

class _listcustomisedState extends State<listcustomised> {
  var name;
  var selectingmode = false;
  List _selectedItems = [];
  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(itemValue);
      } else {
        _selectedItems.remove(itemValue);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print('list');
    print(widget.customisedmenu);

    return Column(children: [
      TextButton(
        onPressed: () {
          var len = ((_selectedItems).length);
          if (len == 0) {
            Fluttertoast.showToast(msg: "Please select dishes");
          } else if (len < 7) {
            Fluttertoast.showToast(msg: "Price is 2500");
          } else {
            Fluttertoast.showToast(msg: "Price is ${2500 + (len - 6) * 100}");
          }
          print(_selectedItems);
        },
        child: Text('data'),
      ),
      ListBody(
        children: widget.customisedmenu
            .map((item) => CheckboxListTile(
                  value: _selectedItems.contains(item),
                  title: Text(item),
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (isChecked) => _itemChange(item, isChecked!),
                ))
            .toList(),
      )
    ]);
    // C
    // SingleChildScrollView(
    //   child: Container(
    //     constraints:
    //         BoxConstraints(minHeight: MediaQuery.of(context).size.height),
    //     child: Column(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Container(child: Text('Lorem ipsum...'), color: Colors.black),
    //           Container(child: Text('Action'), color: Colors.blue),
    //         ]),
    //   ),
    // );
    //   Column(
    // children: [
    //   Container(
    //       //height: double.infinity,
    //       child: SingleChildScrollView(
    //     child: ListBody(
    //       children: widget.customisedmenu
    //           .map((item) => CheckboxListTile(
    //                 value: _selectedItems.contains(item),
    //                 title: Text(item),
    //                 controlAffinity: ListTileControlAffinity.leading,
    //                 onChanged: (isChecked) => _itemChange(item, isChecked!),
    //               ))
    //           .toList(),
    //     ),
    //   )),

    // Expanded(
    //   child: Container(
    //     // A fixed-height child.
    //     child: SingleChildScrollView(
    //       child: ListBody(
    //         children: widget.customisedmenu
    //             .map((item) => CheckboxListTile(
    //                   value: _selectedItems.contains(item),
    //                   title: Text(item),
    //                   controlAffinity: ListTileControlAffinity.leading,
    //                   onChanged: (isChecked) =>
    //                       _itemChange(item, isChecked!),
    //                 ))
    //             .toList(),
    //       ),
    //     ),
    //   ),
    // ),
    //     Container(
    //       // Another fixed-height child.
    //       color: const Color(0xff008000), // Green
    //       height: 120.0,
    //       alignment: Alignment.center,
    //       child: const Text('Fixed Height Content'),
    //     ),
    //   ],
    // );

    // Align(
    //   alignment: Alignment.bottomCenter,
    //   child: RaisedButton(
    //     onPressed: () {},
    //     child: const Text('Bottom Button!', style: TextStyle(fontSize: 20)),
    //     color: Colors.blue,
    //     textColor: Colors.white,
    //     elevation: 5,
    //   ),
    // ),

    //   ],
    // );
    // InkWell(
    //   child:
    //   Container(
    //     // title: const Text('Select Topics'),
    //     // content: SingleChildScrollView(
    //     child:

    // );
    // actions: [
    //   TextButton(ß
    //     child: const Text('Cancel'),
    //     onPressed: _cancel,
    //   ),
    //   ElevatedButton(
    //     child: const Text('Submit'),
    //     onPressed: _submit,
    //   ),
    // ],
    // );
    //  ),
    // onTap: () {},
    // );
  }
}

class MultiSelectt extends StatefulWidget {
  final List<String> items;
  const MultiSelectt({Key? key, required this.items}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MultiSelecttState();
}

class _MultiSelecttState extends State<MultiSelectt> {
  // this variable holds the selected items
  final List<String> _selectedItems = [];

// This function is triggered when a checkbox is checked or unchecked
  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(itemValue);
      } else {
        _selectedItems.remove(itemValue);
      }
    });
  }

  // this function is called when the Cancel button is pressed
  void _cancel() {
    Navigator.pop(context);
  }

// this function is called when the Submit button is tapped
  void _submit() {
    print('--=========--------------');
    print(_selectedItems);
    Navigator.pop(context, _selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return
        // TextButton(
        //   onPressed: () {
        //     print("object");
        //   }, child: Text('data'),
        // );
        ListBody(
      children: widget.items
          .map((item) => CheckboxListTile(
                value: _selectedItems.contains(item),
                title: Text(item),
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (isChecked) => _itemChange(item, isChecked!),
              ))
          .toList(),
    );
    //   ),
    //   actions: [
    //     TextButton(
    //       child: const Text('Cancel'),
    //       onPressed: _cancel,
    //     ),
    //     ElevatedButton(
    //       child: const Text('Submit'),
    //       onPressed: _submit,
    //     ),
    //   ],
    // );
  }
}
