// ignore_for_file: must_be_immutable

import 'package:chef_connect_india/Helper/models/bookings.dart';
import 'package:chef_connect_india/Helper/models/user.dart';
import 'package:chef_connect_india/Helper/utils.dart';
import 'package:chef_connect_india/user_portal/sucess_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class user_checkout extends StatefulWidget {
  String menu;
  //double price;
  List starters;
  List desserts;
  List maincourse;
  String chefId;
  String cid;
  var chefContact;
  user_checkout(
      {Key? key,
      required this.menu,
      //required this.price,
      required this.starters,
      required this.desserts,
      required this.maincourse,
      required this.chefId,
      required this.cid,
      required this.chefContact})
      : super(key: key);

  @override
  State<user_checkout> createState() => _user_checkoutState();
}

class _user_checkoutState extends State<user_checkout> {
  final formGlobalKey = GlobalKey<FormState>();
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final mealController = TextEditingController();
  final peopleController = TextEditingController();
  bool ischecked = false;
  bool ischecked1 = false;
  late String date = '';
  late String time = '';
  DateTime dateTime = DateTime.now();
  List _selected_meal = [];
  late String no_of_plates = '';
  TextEditingController _addressController = TextEditingController();

  // Widget buildDatePicker() => SizedBox(
  //       height: 180,
  //       child: CupertinoDatePicker(
  //         minimumYear: 1947,
  //         maximumYear: DateTime.now().year,
  //         initialDateTime: dateTime,
  //         mode: CupertinoDatePickerMode.date,
  //         onDateTimeChanged: (dateTime) =>
  //             setState(() => this.dateTime = dateTime),
  //       ),
  //     );
  // Widget buildTimePicker() => SizedBox(
  //       height: 180,
  //       child: CupertinoDatePicker(
  //         // minimumYear: 1947,
  //         // maximumYear: DateTime.now().,
  //         initialDateTime: dateTime,
  //         mode: CupertinoDatePickerMode.time,
  //         onDateTimeChanged: (dateTime) =>
  //             setState(() => this.dateTime = dateTime),
  //       ),
  //     );

  @override
  void initState() {
    dateController.text = "";
    timeController.text = "";
    super.initState();
  }

  bool withmaterialChecked = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    Future showToast(String message) async {
      await Fluttertoast.cancel();

      Fluttertoast.showToast(msg: message, fontSize: 18);
    }

    final isDialOpen = ValueNotifier(false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
          'Chef Connect - Booking',
          style: TextStyle(
            fontFamily: 'Montserrat',
          ),
        ),
      ),
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
      body: SafeArea(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("users")
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              var data = snapshot.data;

              return SingleChildScrollView(
                child: Stack(
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              // alignment: Alignment.topLeft,
                              width: width - 20,
                              // height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
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
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          // Text(
                                          //   "Selected ",
                                          //   style: GoogleFonts.roboto(
                                          //     fontSize: 20.0,
                                          //     color: const Color(0xFF4A4B4D),
                                          //     fontWeight: FontWeight.w700,
                                          //   ),
                                          // ),
                                          Text(
                                            "'${widget.menu}'s menu'",
                                            style: GoogleFonts.roboto(
                                              fontSize: 20.0,
                                              color: const Color(0xFF4A4B4D),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Column(
                                    //   children: [
                                    //     Row(
                                    //       children: [
                                    //         Text("Price"),
                                    //         Text((widget.price).toString())
                                    //       ],
                                    //     )
                                    //   ],
                                    // ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                        color: Colors
                                                            .orange.shade900,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                ),
                                              )
                                              .toList(),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                        color: Colors
                                                            .indigo.shade900,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                ),
                                              )
                                              .toList(),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                        color: Colors
                                                            .blue.shade900,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                ),
                                              )
                                              .toList(),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                10.0, 5.0, 10.0, 10.0),
                            child: Container(
                              padding: EdgeInsets.only(bottom: 15),
                              width: width - 20,
                              // height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
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
                                children: <Widget>[
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    'Select your prefered meal',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Montserrat',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  CustomCheckBoxGroup(
                                    buttonTextStyle: ButtonTextStyle(
                                      selectedColor: Colors.white,
                                      unSelectedColor: Colors.black,
                                      textStyle: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    autoWidth: false,
                                    enableButtonWrap: true,
                                    wrapAlignment: WrapAlignment.center,
                                    unSelectedColor: Colors.white,
                                    buttonLables: [
                                      "Breakfast",
                                      "Lunch",
                                      "Dinner",
                                    ],
                                    buttonValuesList: [
                                      "Breakfast",
                                      "Lunch",
                                      "Dinner",
                                    ],
                                    checkBoxButtonValues: (values) {
                                      setState(() {
                                        _selected_meal.add(values);
                                        // _selected_meal.remove(values);
                                      });
                                    },
                                    // defaultSelected: ["Breakfast"],
                                    horizontal: false,
                                    width: 120,
                                    // hight: 50,
                                    selectedColor: Colors.green.shade400,
                                    selectedBorderColor: Colors.green,
                                    padding: 2,
                                    enableShape: true,
                                    customShape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                        width: 0.5,
                                      ),
                                    ),
                                    // shapeRadius: 2,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                10.0, 5.0, 10.0, 10.0),
                            child: Container(
                              width: width - 20,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
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
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 65),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Number of Plates',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Montserrat',
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 10,
                                            ),
                                            child: CircleAvatar(
                                              foregroundColor: Colors.black,
                                              radius: 14,
                                              backgroundColor:
                                                  Colors.grey.shade200,
                                              child: IconButton(
                                                onPressed: () {
                                                  showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        content: Text(
                                                          'For more than 10 plates a helper will be required and extra charges will be incured',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Montserrat',
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 14.0,
                                                          ),
                                                        ),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            10,
                                                          ),
                                                        ),
                                                        actions: [
                                                          Center(
                                                            child:
                                                                ElevatedButton(
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                primary: Colors
                                                                    .indigo,
                                                              ),
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Text('OK'),
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                                icon: Icon(
                                                  Icons.question_mark,
                                                  size: 12.5,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  CustomRadioButton(
                                    enableShape: true,
                                    elevation: 3,
                                    autoWidth: false,
                                    enableButtonWrap: true,
                                    // absoluteZeroSpacing: true,
                                    spacing: 2,
                                    wrapAlignment: WrapAlignment.center,
                                    unSelectedColor: Colors.white,
                                    buttonLables: [
                                      "upto 4",
                                      "4-6",
                                      "6-8",
                                      "more than 10"
                                    ],
                                    buttonValues: [
                                      "upto 4",
                                      "4-6",
                                      "6-8",
                                      "more than 10"
                                    ],
                                    buttonTextStyle: ButtonTextStyle(
                                        selectedColor: Colors.white,
                                        unSelectedColor: Colors.black,
                                        textStyle: TextStyle(fontSize: 16)),
                                    padding: 2,
                                    // defaultSelected: ["4-6"],
                                    horizontal: false,
                                    width: 130,
                                    radioButtonValue: (value) {
                                      setState(() {
                                        no_of_plates = value.toString();
                                      });
                                    },
                                    selectedColor: Colors.green,
                                    selectedBorderColor: Colors.green,
                                    unSelectedBorderColor: Colors.grey,
                                    customShape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                        width: 0.5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              padding: EdgeInsets.all(20),
                              // height: 170,
                              width: width - 20,
                              // height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.16),
                                    offset: Offset(0, 3.0),
                                    blurRadius: 12.0,
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Form(
                                  key: formGlobalKey,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      TextFormField(
                                        controller: dateController,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.0),
                                              ),
                                            ),
                                            focusedBorder:
                                                new OutlineInputBorder(
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      10.0),
                                              borderSide: BorderSide(
                                                color: Colors.black,
                                                width: 1,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color: Colors.grey.shade500,
                                                width: 1,
                                              ),
                                            ),
                                            icon: Icon(Icons.calendar_today),
                                            labelText: "Select Date"),
                                        readOnly: true,
                                        validator: (value) {
                                          if (dateController.text.isEmpty) {
                                            return "Please Select Date";
                                          }
                                          return null;
                                        },
                                        onTap: () async {
                                          DateTime? pickedDate =
                                              await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime.now(),
                                                  lastDate: DateTime(2101));

                                          if (pickedDate != null) {
                                            print(pickedDate);
                                            String formattedDate =
                                                DateFormat('yyyy-MM-dd')
                                                    .format(pickedDate);

                                            setState(() {
                                              dateController.text =
                                                  formattedDate;
                                            });
                                          } else {
                                            Fluttertoast.showToast(
                                                msg: "Date not Selected",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.SNACKBAR,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor:
                                                    Colors.red.shade300,
                                                textColor: Colors.white,
                                                fontSize: 16.0);
                                          }
                                        },
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: TextFormField(
                                          controller: timeController,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.0),
                                              ),
                                            ),
                                            focusedBorder:
                                                new OutlineInputBorder(
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      10.0),
                                              borderSide: BorderSide(
                                                color: Colors.black,
                                                width: 1,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color: Colors.grey.shade500,
                                                width: 1,
                                              ),
                                            ),
                                            icon: Icon(Icons.timer),
                                            labelText: "Select Time",
                                          ),
                                          readOnly: true,
                                          validator: (value) {
                                            if (timeController.text.isEmpty) {
                                              return "Please Select Time";
                                            }
                                            return null;
                                          },
                                          onTap: () async {
                                            TimeOfDay? pickedTime =
                                                await showTimePicker(
                                              initialTime: TimeOfDay.now(),
                                              context: context,
                                            );

                                            if (pickedTime != null) {
                                              print(pickedTime.format(context));
                                              DateTime parsedTime =
                                                  DateFormat.jm().parse(
                                                      pickedTime
                                                          .format(context)
                                                          .toString());
                                              String formattedTime =
                                                  DateFormat('HH:mm')
                                                      .format(parsedTime);
                                              setState(() {
                                                timeController.text =
                                                    formattedTime;
                                              });
                                            } else {
                                              Fluttertoast.showToast(
                                                  msg: "Time not Selected",
                                                  toastLength:
                                                      Toast.LENGTH_SHORT,
                                                  gravity:
                                                      ToastGravity.SNACKBAR,
                                                  timeInSecForIosWeb: 1,
                                                  backgroundColor:
                                                      Colors.red.shade300,
                                                  textColor: Colors.white,
                                                  fontSize: 16.0);
                                            }
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 15.0),
                                        child: TextFormField(
                                          keyboardType:
                                              TextInputType.streetAddress,
                                          controller: _addressController,
                                          validator: (value) {
                                            if (_addressController
                                                .text.isEmpty) {
                                              return "Please Enter your Address";
                                            }
                                            return null;
                                          },
                                          style: TextStyle(color: Colors.black),
                                          minLines: 5,
                                          maxLines: 8,
                                          onSaved: (value) {
                                            _addressController.text = value!;
                                          },
                                          decoration: InputDecoration(
                                            counterStyle:
                                                TextStyle(color: Colors.black),
                                            hintText: 'Enter Full Address',
                                            icon: Icon(
                                                Icons.location_on_outlined),
                                            hintStyle: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Montserrat',
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.0),
                                              ),
                                            ),
                                            focusedBorder:
                                                new OutlineInputBorder(
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      10.0),
                                              borderSide: BorderSide(
                                                color: Colors.black,
                                                width: 1,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color: Colors.grey.shade500,
                                                width: 1,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                10.0, 5.0, 10.0, 10.0),
                            child: Container(
                              // padding: EdgeInsets.only(bottom: 15),
                              width: width - 20,
                              // height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.16),
                                    offset: Offset(0, 3.0),
                                    blurRadius: 12.0,
                                  ),
                                ],
                              ),
                              child: CheckboxListTile(
                                activeColor: Colors.green,
                                title: Text(
                                  'With Material',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    color: Colors.indigo[900],
                                    fontSize: 16,
                                  ),
                                ),
                                value: withmaterialChecked,
                                onChanged: (bool? value) => setState(
                                    () => withmaterialChecked = value!),
                                subtitle: !withmaterialChecked
                                    ? null
                                    : Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(12.0, 0, 0, 0),
                                        child: Text(
                                          'With Material incures Extra Cost',
                                          style: TextStyle(
                                              color: Color(0xFFe53935),
                                              fontSize: 12),
                                        ),
                                      ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                            ),
                            child: SizedBox(
                              height: 45,
                              width: 300,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.indigo,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () {
                                  // Navigator.pushAndRemoveUntil(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //       builder: (context) => Sucess_page(),
                                  //     ),
                                  //     (route) => false);
                                  if (formGlobalKey.currentState!.validate()) {
                                    postDetailsToFirestore(
                                        data['username'],
                                        data['mobile1'],
                                        data['selectedLocation']);
                                  }

                                  // print(
                                  //     '--------------------------------------------------');
                                  // print(_addressController.text);
                                  // print(time);
                                  // print(date);
                                  // print(_selected_meal.toSet().toList());
                                  // print(no_of_plates);
                                  // print(
                                  //     '--------------------------------------------------');
                                },
                                child: Text(
                                  'Proceed',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }

  postDetailsToFirestore(customerId, customerPhone, location) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    var mealslot = _selected_meal
        .toSet()
        .toList()
        .toString()
        .replaceAll('[', '')
        .replaceAll(']', '');
    var starters =
        widget.starters.toString().replaceAll('[', '').replaceAll(']', '');
    var maincourse =
        widget.maincourse.toString().replaceAll('[', '').replaceAll(']', '');
    var desserts =
        widget.desserts.toString().replaceAll('[', '').replaceAll(']', '');
    var bookingId =
        '${customerId.toString().substring(0, 2).toLowerCase()}${DateFormat('dd/MM/yyyy').format(DateTime.now()).replaceAll('/', '')}${DateFormat.Hms().format(DateTime.now()).replaceAll(':', '')}';
    BookingModel bookingModel = BookingModel();

    bookingModel.bookingDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
    bookingModel.bookingTime = DateFormat.Hms().format(DateTime.now());
    bookingModel.bookingType = 'Party';
    bookingModel.customerId = customerId;
    bookingModel.customerPhone = customerPhone;
    bookingModel.chefId = widget.chefId;
    bookingModel.cid = widget.cid;
    bookingModel.chefContact = widget.chefContact;
    bookingModel.location = location;
    bookingModel.selectedMenu = [widget.menu, starters, maincourse, desserts];
    bookingModel.requirementDate = dateController.text;
    bookingModel.requirementTime = timeController.text;
    bookingModel.bookingSlot = mealslot;
    bookingModel.numberOfPlates = no_of_plates;
    bookingModel.address = _addressController.text;
    bookingModel.withMaterial = withmaterialChecked;
    bookingModel.bookingId = bookingId;
    bookingModel.bookingStatus = 'Pending';

    await firebaseFirestore
        .collection("bookings")
        .doc(bookingId)
        .set(bookingModel.toMap());
    Fluttertoast.showToast(msg: "Booking successful:) ");
    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(
            builder: (context) => Sucess_page(
                  bookingId: bookingId,
                  customerId: customerId,
                )),
        (route) => false);
    // Fluttertoast.showToast(msg: "Account created successfully :) ");
  }
}
