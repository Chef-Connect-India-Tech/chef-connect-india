//import 'dart:html';

// ignore_for_file: must_be_immutable

import 'package:chef_connect_india/user_portal/cust_checkout.dart';
import 'package:chef_connect_india/user_portal/custom_user_checkout.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

class customiseduser extends StatefulWidget {
  late String cid;
  late List items;
  var chefContact;
  String chefId;
  customiseduser({
    required this.cid,
    required this.items,
    required this.chefContact,
    required this.chefId,
  });
  @override
  State<customiseduser> createState() => _customiseduserState();
}

class _customiseduserState extends State<customiseduser> {
  late int price;
  void pp() async {
    var a = widget.cid;
    var collection = FirebaseFirestore.instance.collection('chefs');
    var docSnapshot = await collection.doc(a).get();
    if (docSnapshot.exists) {
      var data = docSnapshot.data()!;
      price = data['cheffees'];
      print(price);
    }
  }

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

  var a = 'a';
  Widget build(BuildContext context) {
    pp();
    Future showToast(String message) async {
      await Fluttertoast.cancel();

      Fluttertoast.showToast(msg: message, fontSize: 18);
    }

    final isDialOpen = ValueNotifier(false);

    print(widget.cid);
    print('lol---r');
    print(widget.chefId);
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
            onTap: () => showToast(
              'Selected Mail..',
            ),
          ),
          SpeedDialChild(
              child: Image(
                image: AssetImage('assets/socialicons/gmail.png'),
                height: 35,
              ),
              backgroundColor: Colors.transparent,
              label: 'Mail',
              onTap: () {
                launch('mailto:info@chefconnect.co.in');
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
        child: PaginateFirestore(
          itemBuilderType: PaginateBuilderType.listView,
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.all(0.0),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, documentSnapshots, index) {
            a = documentSnapshots[index].id;
            return GestureDetector(
              child: Container(
                child: Column(
                  children: [
                    Column(
                      children: [
                        ListBody(
                          children: widget.items
                              .map((item) => CheckboxListTile(
                                    value: _selectedItems.contains(item),
                                    title: Text(item),
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    onChanged: (isChecked) =>
                                        _itemChange(item, isChecked!),
                                  ))
                              .toList(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },

          // orderBy is compulsory to enable pagination
          query: FirebaseFirestore.instance
              .collection('Menu')
              .where("cid", isEqualTo: widget.cid),
          isLive: true,
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 15),
        child: GestureDetector(
          child: SizedBox(
            height: 40,
            width: MediaQuery.of(context).size.width - 100,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.indigo,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: () {
                var len = ((_selectedItems).length);
                if (len == 0) {
                  Fluttertoast.showToast(msg: "Please select dishes");
                } else if (len < 7) {
                  double rate = price + price * 0.25;
                  Fluttertoast.showToast(msg: "Price is ${rate}");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => custom_user_checkout(
                            price: rate,
                            cid: widget.cid,
                            chefContact: widget.chefContact,
                            chefId: widget.chefId,
                            dishes: _selectedItems,
                          )),
                    ),
                  );
                } else {
                  print(price);
                  double rate = price + price * 0.25;
                  Fluttertoast.showToast(
                      msg: "Price is ${rate + (len - 6) * 100}");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => custom_user_checkout(
                            price: rate,
                            cid: widget.cid,
                            chefContact: widget.chefContact,
                            chefId: widget.chefId,
                            dishes: _selectedItems,
                          )),
                    ),
                  );
                }
                print(_selectedItems);
                print('Book A  Chef button pressed');
                double rate = price + price * 0.25;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => custom_user_checkout(
                          price: rate,
                          cid: widget.cid,
                          chefContact: widget.chefContact,
                          chefId: widget.chefId,
                          dishes: _selectedItems,
                        )),
                  ),
                );
              },
              child: Text(
                'Proceed to Check Out',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
