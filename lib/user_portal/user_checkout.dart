// ignore_for_file: must_be_immutable

import 'package:chef_connect_india/Helper/utils.dart';
import 'package:chef_connect_india/user_portal/sucess_page.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class user_checkout extends StatefulWidget {
  String menu;
  List starters;
  List desserts;
  List maincourse;
  user_checkout(
      {Key? key,
      required this.menu,
      required this.starters,
      required this.desserts,
      required this.maincourse})
      : super(key: key);

  @override
  State<user_checkout> createState() => _user_checkoutState();
}

class _user_checkoutState extends State<user_checkout> {
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
        child: SingleChildScrollView(
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Selected ",
                                      style: GoogleFonts.roboto(
                                        fontSize: 20.0,
                                        color: const Color(0xFF4A4B4D),
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                                  color: Colors.orange.shade900,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                                  color: Colors.indigo.shade900,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                                  color: Colors.blue.shade900,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
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
                      padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),
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
                                    padding: const EdgeInsets.only(left: 8.0),
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
                                                    DateFormat('dd/MM/yyyy')
                                                        .format(dateTime);
                                                // Utils.showSnackBar(context, 'Selected "$date_value"');
                                                date = date_value;
                                                setState(() {
                                                  date = date_value;
                                                });
                                                Navigator.of(context).pop();
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
                                    padding: const EdgeInsets.only(left: 8.0),
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
                                                Navigator.of(context).pop();
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
                      padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),
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
                              unSelectedColor: Theme.of(context).canvasColor,
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
                      padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),
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
                              unSelectedColor: Theme.of(context).canvasColor,
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
                      padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),
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
                                  counterStyle: TextStyle(color: Colors.black),
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
                                    borderRadius: BorderRadius.circular(10),
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
                      padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),
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
                            // Navigator.pushAndRemoveUntil(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => Sucess_page(),
                            //     ),
                            //     (route) => false);
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
        ),
      ),
    );
  }
}
