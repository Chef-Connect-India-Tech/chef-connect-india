import 'package:chef_connect_india/Helper/model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class trail extends StatefulWidget {
  @override
  _trailState createState() => _trailState();
}

class _trailState extends State<trail> {
  List<ContactModel> contacts = [
    ContactModel("Zaman", "0778979454", false),
    ContactModel("Naim", "0766223795", false),
    ContactModel("Sardar", "0749112016", false),
    ContactModel("Baqer", "0775286570", false),
    ContactModel("Yasin", "0744795640", false),
    ContactModel("Hurmat", "0707404370", false),
    ContactModel("M.Ali", "0772680138", false),
  ];

  // ignore: deprecated_member_use
  List<ContactModel> selectedContacts =[];
  var verified;
  var  itemname;
  late String docid='SNSMHDIjfLNoAgBPtKcY';
  var variety;
 var docc='pDSWbcECuimgt7HS6Xi6';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Multi Selection ListView"),
        centerTitle: true,
        backgroundColor: Colors.green[700],
      ),
     body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Menu').doc(docc).collection('starters').snapshots(),
        builder: (context, snap) {
          if (!snap.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else
            return SafeArea(
              child: Container(
                child: Column(
                  children: [
                    Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: snap.data?.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        verified=snap.data?.docs[index]['isSelected'];
                        itemname=snap.data?.docs[index]['dish'];
                        //docid=snap.data?.docs[index]['docid'];
                            return ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.green[700],
                                  child: Icon(
                                    Icons.person_outline_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                                title: Text(
                                  snap.data?.docs[index]['dish'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                
                                trailing: snap.data?.docs[index]['isSelected']
                                    ? Icon(
                                        Icons.check_circle,
                                        color: Colors.green[700],
                                      )
                                    : Icon(
                                        Icons.check_circle_outline,
                                        color: Colors.grey,
                                      ),
                                onTap: () {
                                  var doc=snap.data?.docs[index]['docid'];
                                  print(doc);

                                  CollectionReference _collectionRef =
                                  FirebaseFirestore.instance.collection("Menu");
                              _collectionRef.doc(docc).collection('starters').doc(doc).update({
                                "isSelected": true,
                              }).then((value) => print("Updated Successfully"));
                                  //print(isSelected);
                                  print(snap.data?.docs[index]['docid']);
                                },
                              );
                      //    ContactItem(
                      //   snap.data?.docs[index]['dish'],
                      //   snap.data?.docs[index]['isSelected'],
                      //   snap.data?.docs[index]['docid'],
                      //   index,
                      // );
                         
                      },
                    ),
                  ),
                  selectedContacts.length > 0 ? Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 10,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    color: Colors.green[700],
                    child: Text(
                      "Delete (${selectedContacts.length})",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    onPressed: () {
                      print("Delete List Lenght: ${selectedContacts.length}");
                    },
                  ),
                ),
              ): Container(),
                  ],
                  
                ),
              ),
            );
        },
      ),
    );
    //   body: SafeArea(
    //     child: Container(
    //       child: Column(
    //         children: [
    //           Expanded(
    //             child: ListView.builder(
    //                 itemCount: contacts.length,
    //                 itemBuilder: (BuildContext context, int index) {
    //                   // return item
    //                   return ContactItem(
    //                     contacts[index].name,
    //                     contacts[index].phoneNumber,
    //                     contacts[index].isSelected,
    //                     index,
    //                   );
    //                 }),
    //           ),
    //           selectedContacts.length > 0 ? Padding(
    //             padding: const EdgeInsets.symmetric(
    //               horizontal: 25,
    //               vertical: 10,
    //             ),
    //             child: SizedBox(
    //               width: double.infinity,
    //               child: RaisedButton(
    //                 color: Colors.green[700],
    //                 child: Text(
    //                   "Delete (${selectedContacts.length})",
    //                   style: TextStyle(
    //                     color: Colors.white,
    //                     fontSize: 18,
    //                   ),
    //                 ),
    //                 onPressed: () {
    //                   print("Delete List Lenght: ${selectedContacts.length}");
    //                 },
    //               ),
    //             ),
    //           ): Container(),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }

  Widget ContactItem(
      String name, bool isSelected, String docid1,index) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.green[700],
        child: Icon(
          Icons.person_outline_outlined,
          color: Colors.white,
        ),
      ),
      title: Text(
        name,
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      
      trailing: isSelected
          ? Icon(
              Icons.check_circle,
              color: Colors.green[700],
            )
          : Icon(
              Icons.check_circle_outline,
              color: Colors.grey,
            ),
      onTap: () {
    //     CollectionReference _collectionRef =
    //     FirebaseFirestore.instance.collection("Menu");
    // _collectionRef.doc(docc).collection('starters').doc(docid1).update({
    //   "isSelected": true,
    // }).then((value) => print("Updated Successfully"));
    //     print(isSelected);
        print(docid1);
        // print(docc);
        //  isSelected = !isSelected;
        // //Firebasehelper.updatemenu1(docc,docid,true);
        //     if (isSelected == false) {
        //     Firebasehelper.updatemenu1(docc,docid1,true);
        //     isSelected= true;
        //   }
        //   else  if (isSelected == true) {
        //     Firebasehelper.updatemenu1(docc,docid1,false);
        //     isSelected= false;
        //   }
         //Firebasehelper.updatemenu(docc,docid, true);
        // if (verified == true) {
        //     Firebasehelper.updatemenu(docc,docid, false);
        //     verified=false;
        //     //selectedContacts.add(ContactModel(name, phoneNumber, true));
        //   }
        // // if (verified == true) {
        // //     Firebasehelper.updatemenu('0FZ85kT6leIndkeWCmvf', false);
        // //     //selectedContacts.add(ContactModel(name, phoneNumber, true));
        // //   }
        //   else
          //   if (verified == false) {
          //   Firebasehelper.updatemenu1(docc,docid, true);
          //   verified= true;
          //  // selectedContacts
          //    //   .removeWhere((element) => element.name == itemname);
          // }
        //   print(verified);
        
         
        // setState(() {
        //   verified != (verified) as String;
        //   print(verified);
        //   if (verified == true) {
        //     Firebasehelper.updatemenu('0FZ85kT6leIndkeWCmvf', 'false');
        //     //selectedContacts.add(ContactModel(name, phoneNumber, true));
        //   } else if (verified == false) {
        //     Firebasehelper.updatemenu('0FZ85kT6leIndkeWCmvf', true);
        //    // selectedContacts
        //      //   .removeWhere((element) => element.name == itemname);
        //   }
        // });
      },
    );
  }
}
class ContactModel{

  String name, phoneNumber;
  bool isSelected;

  ContactModel(this.name, this.phoneNumber, this.isSelected);

}