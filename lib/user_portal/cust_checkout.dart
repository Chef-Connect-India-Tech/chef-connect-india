// ignore_for_file: must_be_immutable

import 'package:chef_connect_india/Helper/models/bookings.dart';
import 'package:chef_connect_india/Helper/utils.dart';
import 'package:chef_connect_india/user_portal/sucess_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class user_custom_checkout extends StatefulWidget {
  List dishes;
  String chefId;
  String cid;
  var chefContact;
  user_custom_checkout(
      {Key? key,
      required this.dishes,
      required this.chefId,
      required this.cid,
      required this.chefContact})
      : super(key: key);

  @override
  State<user_custom_checkout> createState() => _user_custom_checkoutState();
}

class _user_custom_checkoutState extends State<user_custom_checkout> {
  late String date = '';
  late String time = '';
  DateTime dateTime = DateTime.now();
  List _selected_meal = [];
  late String no_of_plates = '';
  TextEditingController _addressController = TextEditingController();

  Widget buildDatePicker() => SizedBox(
        height: 180,
        child: CupertinoDatePicker(
          minimumYear: 1947,
          maximumYear: DateTime.now().year,
          initialDateTime: dateTime,
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (dateTime) =>
              setState(() => this.dateTime = dateTime),
        ),
      );
  Widget buildTimePicker() => SizedBox(
        height: 180,
        child: CupertinoDatePicker(
          // minimumYear: 1947,
          // maximumYear: DateTime.now().,
          initialDateTime: dateTime,
          mode: CupertinoDatePickerMode.time,
          onDateTimeChanged: (dateTime) =>
              setState(() => this.dateTime = dateTime),
        ),
      );
  @override
  Widget build(BuildContext context) {
    print(widget.cid);
    print(widget.cid);
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chef Connect - Booking',
          style: TextStyle(
            fontFamily: 'Montserrat',
          ),
        ),
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
                                      child: Text(
                                        "Selected Dishes",
                                        style: GoogleFonts.roboto(
                                          fontSize: 20.0,
                                          color: const Color(0xFF4A4B4D),
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Text(
                                        //   'Dishes:',
                                        //   style: GoogleFonts.roboto(
                                        //       fontSize: 18.0,
                                        //       color: const Color(0xFF4A4B4D),
                                        //       height: 1.11,
                                        //       fontWeight: FontWeight.w500),
                                        // ),
                                        Wrap(
                                          spacing: 5.0,
                                          children: widget.dishes
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
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                10.0, 5.0, 10.0, 10.0),
                            child: Container(
                              width: width - 20,
                              height: 100,
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
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "Select Date: ",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Montserrat',
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "${date}",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Montserrat',
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: CircleAvatar(
                                              backgroundColor: Colors.black,
                                              radius: 15,
                                              child: IconButton(
                                                onPressed: () {
                                                  Utils.showSheet(
                                                    context,
                                                    child: buildDatePicker(),
                                                    onClicked: () {
                                                      final date_value =
                                                          DateFormat(
                                                                  'dd/MM/yyyy')
                                                              .format(dateTime);
                                                      // Utils.showSnackBar(context, 'Selected "$date_value"');
                                                      date = date_value;
                                                      setState(() {
                                                        date = date_value;
                                                      });
                                                      Navigator.of(context)
                                                          .pop();
                                                      // Navigator.pop(context);
                                                    },
                                                  );
                                                },
                                                icon: Icon(
                                                  Icons.edit,
                                                  size: 15,
                                                ),
                                              )),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "Select Time: ",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Montserrat',
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "${time}",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Montserrat',
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: CircleAvatar(
                                              backgroundColor: Colors.black,
                                              radius: 15,
                                              child: IconButton(
                                                onPressed: () {
                                                  Utils.showSheet(
                                                    context,
                                                    child: buildTimePicker(),
                                                    onClicked: () {
                                                      final date_value =
                                                          DateFormat.Hms()
                                                              .format(dateTime);
                                                      // Utils.showSnackBar(context, 'Selected "$date_value"');
                                                      time = date_value;
                                                      setState(() {
                                                        time = date_value;
                                                      });
                                                      Navigator.of(context)
                                                          .pop();
                                                      // Navigator.pop(context);
                                                    },
                                                  );
                                                },
                                                icon: Icon(
                                                  Icons.edit,
                                                  size: 15,
                                                ),
                                              )),
                                        )
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
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    'Select your prefered meal',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Montserrat',
                                      fontSize: 20,
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
                                    unSelectedColor:
                                        Theme.of(context).canvasColor,
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
                                    selectedColor:
                                        Theme.of(context).colorScheme.secondary,
                                    padding: 5,
                                    enableShape: true,
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
                                    child: Text(
                                      'Number of Plates',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Montserrat',
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  CustomRadioButton(
                                    enableShape: true,
                                    elevation: 3,
                                    autoWidth: false,
                                    enableButtonWrap: true,
                                    // absoluteZeroSpacing: true,
                                    spacing: 5,
                                    wrapAlignment: WrapAlignment.center,
                                    unSelectedColor:
                                        Theme.of(context).canvasColor,
                                    buttonLables: [
                                      'upto 4',
                                      '4-6',
                                      '6-8',
                                      'more than 10'
                                    ],
                                    buttonValues: [
                                      'upto 4',
                                      '4-6',
                                      '6-8',
                                      'more than 10'
                                    ],
                                    buttonTextStyle: ButtonTextStyle(
                                        selectedColor: Colors.white,
                                        unSelectedColor: Colors.black,
                                        textStyle: TextStyle(fontSize: 16)),
                                    padding: 10,
                                    horizontal: false,
                                    width: 130,
                                    radioButtonValue: (value) {
                                      setState(() {
                                        no_of_plates = value.toString();
                                      });
                                    },
                                    selectedColor:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                10.0, 5.0, 10.0, 10.0),
                            child: Container(
                              // alignment: Alignment.topLeft,
                              width: width - 20,
                              // height: 210,
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        10.0, 10.0, 10.0, 0),
                                    child: Text(
                                      "Full Address",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Montserrat',
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: TextFormField(
                                      keyboardType: TextInputType.streetAddress,
                                      controller: _addressController,
                                      style: TextStyle(color: Colors.black),
                                      minLines: 5,
                                      maxLines: 8,
                                      onSaved: (value) {
                                        _addressController.text = value!;
                                      },
                                      decoration: InputDecoration(
                                        counterStyle:
                                            TextStyle(color: Colors.black),
                                        hintText: 'Address',
                                        hintStyle: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Montserrat',
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                        ),
                                        focusedBorder: new OutlineInputBorder(
                                          borderRadius:
                                              new BorderRadius.circular(10.0),
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
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                10.0, 5.0, 10.0, 10.0),
                            child: SizedBox(
                              height: 45,
                              width: 300,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () {
                                  postDetailsToFirestore(
                                      data['username'],
                                      data['mobile1'],
                                      data['selectedLocation']);
                                  print(
                                      '--------------------------------------------------');
                                  print(_addressController.text);
                                  print(time);
                                  print(date);
                                  print(_selected_meal.toSet().toList());
                                  print(no_of_plates);
                                  print(
                                      '--------------------------------------------------');
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
    var dishes =
        widget.dishes.toString().replaceAll('[', '').replaceAll(']', '');

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
    bookingModel.selectedMenu = [dishes];
    bookingModel.requirementDate = date;
    bookingModel.requirementTime = time;
    bookingModel.bookingSlot = mealslot;
    bookingModel.numberOfPlates = no_of_plates;
    bookingModel.address = _addressController.text;
    bookingModel.withMaterial = false;
    bookingModel.bookingId = bookingId;
    bookingModel.bookingStatus = 'Submited';

    await firebaseFirestore
        .collection("bookings")
        .doc()
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
