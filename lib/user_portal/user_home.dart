import 'package:chef_connect_india/Drawers/navigation_drawer.dart';
import 'package:chef_connect_india/Helper/chef_list.dart';
import 'package:chef_connect_india/Helper/list.dart';
import 'package:chef_connect_india/user_portal/chef_details/View_more.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class user_home extends StatefulWidget {
  // final String city;
  // final String hiremode;
  const user_home({
    Key? key,
    // required this.city,
    // required this.hiremode
  }) : super(key: key);

  @override
  State<user_home> createState() => _user_homeState();
}

class _user_homeState extends State<user_home> {
  List<String> _carouselImages = [];
  var _dotPosition = 0;
  var _firestoreInstance = FirebaseFirestore.instance;

  fetchCarouselImages() async {
    QuerySnapshot qn =
        await _firestoreInstance.collection("offers_slider").get();
    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        _carouselImages.add(
          qn.docs[i]["image"],
        );
        print(qn.docs[i]["image"]);
      }
    });

    return qn.docs;
  }

  @override
  void initState() {
    fetchCarouselImages();
    _myCusine = [];
    _myCusineResult = '';
    super.initState();
  }

  final GenderEditingController = new TextEditingController();
  final categoryofchefEditingController = new TextEditingController();
  final salaryEditingController = new TextEditingController();
  final LevelEditingController = new TextEditingController();

  final SelectGender = ['Male', 'Female'];
  final categoryofchef = [
    "Trainee  apprentice ",
    "Commi 3",
    "Commi 2",
    "Commi 1",
    "Demi chef de partie ",
    "Chef de partie",
    "Sr . Chef de partie ",
    "Jr sous chef ",
    "Sous chef ",
    "Sr sous chef  Chef de cuisine",
    "Executive sous chef ",
    "Executive chef HOD  Unit chef ",
    "Corporate chef multi unit chef ",
    "Director culinary  vice president presiden",
  ];
  final levelofchef = [
    "Basic",
    "Intermediate",
    "Expert",
  ];
  final salary = [
    'under 10,000',
    '10,000 - 20,000',
    '20,000 - 40,000',
    'above 40,000'
  ];
  String? salaryValue;

  String? locValue;
  String? chefvalue;
  String? cheflevel;

  List? _myCusine;
  late String _myCusineResult;
  // final formKey = new GlobalKey<FormState>();

  // @override
  // void initState() {
  //   super.initState();
  //   _myCusine = [];
  //   _myCusineResult = '';
  // }
  Future showToast(String message) async {
    await Fluttertoast.cancel();

    Fluttertoast.showToast(msg: message, fontSize: 18);
  }

  final isDialOpen = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (isDialOpen.value) {
          isDialOpen.value = false;
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          // shadowColor: Colors.deepPurpleAccent,
          toolbarHeight: 70, // default is 56
          // toolbarOpacity: 0.5,
          elevation: 50.0,
          title: Text(
            'Chef Connect India',
            style: TextStyle(
              fontFamily: 'Montserrat',
            ),
          ),
        ),
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          backgroundColor: Colors.black,
          overlayColor: Colors.black,
          overlayOpacity: 0.4,
          spacing: 10,
          spaceBetweenChildren: 10,
          closeManually: true,
          openCloseDial: isDialOpen,
          children: [
            SpeedDialChild(
              child: Icon(Icons.mail),
              backgroundColor: Colors.red,
              label: 'Mail',
              onTap: () => showToast(
                'Selected Mail..',
              ),
            ),
            SpeedDialChild(
              child: Icon(Icons.copy),
              backgroundColor: Colors.green,
              label: 'Copy',
              onTap: () => showToast(
                'Selected Copy..',
              ),
            ),
            SpeedDialChild(
              child: Icon(Icons.facebook),
              backgroundColor: Colors.blue,
              label: 'Facebook',
              onTap: () => showToast(
                'Selected facebook..',
              ),
            ),
            SpeedDialChild(
              child: Icon(Icons.whatsapp),
              backgroundColor: Colors.indigo,
              label: 'Whatsapp',
              onTap: () => showToast(
                'Selected whatsapp..',
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 300,
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Row(
                            children: [
                              Container(
                                height: 300,
                                width: 300,
                                decoration: BoxDecoration(
                                  // border: Border.all(color: Colors.grey.shade400, width: 5),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      10,
                                    ),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade300,
                                      blurRadius: 10,
                                      offset: Offset(0, 3),
                                      spreadRadius: 5,
                                    )
                                  ],
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      // Colors.green,
                                      // Colors.blue,

                                      Colors.purple.shade700,
                                      Colors.purple.shade600,
                                    ],
                                  ),
                                ),
                                child: InkWell(
                                  onTap: () {},
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'assets/partychef.jpeg',
                                        height: 300,
                                        width: 300,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 300,
                                width: 300,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        0.0,
                                      ),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade300,
                                        blurRadius: 10,
                                        offset: Offset(0, 3),
                                        spreadRadius: 5,
                                      ),
                                    ],
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.white,
                                        Colors.white,
                                      ],
                                    )),
                                child: InkWell(
                                  onTap: () {},
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'assets/Private Chef.png',
                                        fit: BoxFit.fitWidth,
                                        height: 250,
                                        width: 400,
                                      ),
                                      SizedBox(
                                        width: 290,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.indigo,
                                          ),
                                          onPressed: () {
                                            showDialog(
                                              useSafeArea: true,
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text(
                                                    'Query for private chef',
                                                    style: TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  backgroundColor: Colors.white,
                                                  content:
                                                      SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        TextFormField(
                                                          decoration:
                                                              InputDecoration(
                                                            fillColor:
                                                                Colors.white70,
                                                            filled: true,
                                                            hintText:
                                                                'Enter Address',
                                                            hintStyle:
                                                                TextStyle(
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                            border:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                            ),
                                                            focusedBorder:
                                                                new OutlineInputBorder(
                                                              borderRadius:
                                                                  new BorderRadius
                                                                          .circular(
                                                                      10.0),
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                            ),
                                                            // enabledBorder:
                                                            //     OutlineInputBorder(
                                                            //   borderRadius:
                                                            //       BorderRadius
                                                            //           .circular(
                                                            //               10),
                                                            //   borderSide:
                                                            //       BorderSide(
                                                            //     color: Colors
                                                            //         .black,
                                                            //     width: 1,
                                                            //   ),
                                                            // ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        DropdownButtonFormField<
                                                            String>(
                                                          decoration:
                                                              InputDecoration(
                                                            labelText:
                                                                'Prefered Chef Gender',
                                                            labelStyle: TextStyle(
                                                                fontSize: 14,
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                            prefixIcon: Icon(
                                                              Icons.person,
                                                              color: Colors
                                                                  .black45,
                                                            ),
                                                            fillColor:
                                                                Colors.white70,
                                                            hintText:
                                                                'Prefered Chef Gender',
                                                            hintStyle: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 14),
                                                            filled: true,
                                                            border:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                            ),
                                                            focusedBorder:
                                                                new OutlineInputBorder(
                                                              borderRadius:
                                                                  new BorderRadius
                                                                          .circular(
                                                                      10.0),
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                            ),
                                                            // enabledBorder:
                                                            //     OutlineInputBorder(
                                                            //   borderRadius:
                                                            //       BorderRadius
                                                            //           .circular(
                                                            //               10),
                                                            //   borderSide:
                                                            //       BorderSide(
                                                            //     color: Colors
                                                            //         .black,
                                                            //     width: 1,
                                                            //   ),
                                                            // ),
                                                          ),
                                                          autofocus: false,
                                                          value: locValue,
                                                          isExpanded: true,
                                                          iconSize: 25,
                                                          icon: Icon(
                                                              Icons
                                                                  .arrow_drop_down,
                                                              color:
                                                                  Colors.black),
                                                          items: SelectGender.map(
                                                                  buildMenuItem)
                                                              .toList(),
                                                          onChanged: (Gvalue) =>
                                                              setState(() {
                                                            this.locValue =
                                                                Gvalue;
                                                            GenderEditingController
                                                                .text = Gvalue!;
                                                          }),
                                                          onSaved: (Gvalue) {
                                                            GenderEditingController
                                                                .text = Gvalue!;
                                                          },
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        DropdownButtonFormField<
                                                            String>(
                                                          decoration:
                                                              InputDecoration(
                                                            labelText:
                                                                ' category of chef',
                                                            labelStyle: TextStyle(
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                            prefixIcon: Icon(
                                                              Icons.leaderboard,
                                                              color: Colors
                                                                  .black45,
                                                            ),
                                                            fillColor:
                                                                Colors.white70,
                                                            // hintText: 'Select Current Salary',
                                                            hintStyle: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 15),
                                                            filled: true,
                                                            border:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                            ),
                                                            focusedBorder:
                                                                new OutlineInputBorder(
                                                              borderRadius:
                                                                  new BorderRadius
                                                                          .circular(
                                                                      10.0),
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                            ),
                                                            // enabledBorder:
                                                            //     OutlineInputBorder(
                                                            //   borderRadius:
                                                            //       BorderRadius
                                                            //           .circular(
                                                            //               10),
                                                            //   borderSide:
                                                            //       BorderSide(
                                                            //     color: Colors
                                                            //         .black,
                                                            //     width: 1,
                                                            //   ),
                                                            // ),
                                                          ),
                                                          autofocus: false,
                                                          value: cheflevel,
                                                          isExpanded: true,
                                                          iconSize: 25,
                                                          icon: Icon(
                                                              Icons
                                                                  .arrow_drop_down,
                                                              color:
                                                                  Colors.black),
                                                          items: levelofchef
                                                              .map(
                                                                  buildMenuItem)
                                                              .toList(),
                                                          onChanged: (Dvalue) =>
                                                              setState(() {
                                                            this.chefvalue =
                                                                Dvalue;
                                                            LevelEditingController
                                                                .text = Dvalue!;
                                                          }),
                                                          onSaved: (Dvalue) {
                                                            LevelEditingController
                                                                .text = Dvalue!;
                                                          },
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        DropdownButtonFormField<
                                                            String>(
                                                          decoration:
                                                              InputDecoration(
                                                            labelText:
                                                                'Budget For Chef',
                                                            labelStyle:
                                                                TextStyle(
                                                              fontSize: 15,
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                            prefixIcon: Icon(
                                                              Icons.money,
                                                              color: Colors
                                                                  .black45,
                                                            ),
                                                            fillColor:
                                                                Colors.white70,
                                                            // hintText: 'Select Current Salary',
                                                            hintStyle: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 15),
                                                            filled: true,
                                                            border:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                            ),
                                                            focusedBorder:
                                                                new OutlineInputBorder(
                                                              borderRadius:
                                                                  new BorderRadius
                                                                          .circular(
                                                                      10.0),
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                            ),
                                                            // enabledBorder:
                                                            //     OutlineInputBorder(
                                                            //   borderRadius:
                                                            //       BorderRadius
                                                            //           .circular(
                                                            //               10),
                                                            //   borderSide:
                                                            //       BorderSide(
                                                            //     color: Colors
                                                            //         .black,
                                                            //     width: 1,
                                                            //   ),
                                                            // ),
                                                          ),
                                                          autofocus: false,
                                                          value: salaryValue,
                                                          isExpanded: true,
                                                          iconSize: 25,
                                                          icon: Icon(
                                                              Icons
                                                                  .arrow_drop_down,
                                                              color:
                                                                  Colors.black),
                                                          items: salary
                                                              .map(
                                                                  buildMenuItem)
                                                              .toList(),
                                                          onChanged: (svalue) =>
                                                              setState(() {
                                                            this.salaryValue =
                                                                svalue;
                                                            salaryEditingController
                                                                .text = svalue!;
                                                          }),
                                                          onSaved: (lvalue) {
                                                            salaryEditingController
                                                                .text = lvalue!;
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  actions: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        SizedBox(
                                                          height: 45,
                                                          width: 100,
                                                          child: ElevatedButton(
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              ),
                                                            ),
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Text(
                                                              'Cancel',
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 45,
                                                          width: 100,
                                                          child: ElevatedButton(
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              ),
                                                            ),
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Text(
                                                              'Submit',
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          child: Text(
                                            'Enter your query for Private Chef',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 300,
                                width: 300,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        0.0,
                                      ),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.16),
                                        offset: Offset(0, 3.0),
                                        blurRadius: 12.0,
                                      ),
                                    ],
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.white,
                                        Colors.white,
                                      ],
                                    )),
                                child: InkWell(
                                  onTap: () {},
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'assets/kitchenprofessionals.jpeg',
                                        height: 250,
                                        width: 400,
                                        fit: BoxFit.fitWidth,
                                      ),
                                      SizedBox(
                                        width: 290,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.indigo,
                                          ),
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      10,
                                                    ),
                                                  ),
                                                  title: Text(
                                                    'Query For Kitchen Professional',
                                                    style: TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  backgroundColor: Colors.white,
                                                  content:
                                                      SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        TextFormField(
                                                          decoration:
                                                              InputDecoration(
                                                            fillColor:
                                                                Colors.white70,
                                                            filled: true,
                                                            hintText:
                                                                'Enter Hotel name',
                                                            hintStyle:
                                                                TextStyle(
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                            border:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        TextFormField(
                                                          decoration:
                                                              InputDecoration(
                                                            fillColor:
                                                                Colors.white70,
                                                            filled: true,
                                                            hintText:
                                                                'Number of Chefs Required',
                                                            hintStyle:
                                                                TextStyle(
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                            border:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        TextFormField(
                                                          decoration:
                                                              InputDecoration(
                                                            fillColor:
                                                                Colors.white70,
                                                            filled: true,
                                                            hintText:
                                                                'Date Required',
                                                            hintStyle:
                                                                TextStyle(
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                            border:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        DropdownButtonFormField<
                                                            String>(
                                                          decoration:
                                                              InputDecoration(
                                                            labelText:
                                                                'Level Of Chef',
                                                            labelStyle:
                                                                TextStyle(
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                            prefixIcon: Icon(
                                                              Icons.leaderboard,
                                                              color: Colors
                                                                  .black45,
                                                            ),
                                                            fillColor:
                                                                Colors.white70,
                                                            // hintText: 'Select Current Salary',
                                                            hintStyle: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 15),
                                                            filled: true,
                                                            border:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                            ),
                                                            focusedBorder:
                                                                new OutlineInputBorder(
                                                              borderRadius:
                                                                  new BorderRadius
                                                                          .circular(
                                                                      10.0),
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                            ),
                                                          ),
                                                          autofocus: false,
                                                          value: chefvalue,
                                                          isExpanded: true,
                                                          iconSize: 25,
                                                          icon: Icon(
                                                              Icons
                                                                  .arrow_drop_down,
                                                              color:
                                                                  Colors.black),
                                                          items: categoryofchef
                                                              .map(
                                                                  buildMenuItem)
                                                              .toList(),
                                                          onChanged: (Evalue) =>
                                                              setState(() {
                                                            this.chefvalue =
                                                                Evalue;
                                                            categoryofchefEditingController
                                                                .text = Evalue!;
                                                          }),
                                                          onSaved: (Evalue) {
                                                            categoryofchefEditingController
                                                                .text = Evalue!;
                                                          },
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        MultiSelectFormField(
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            borderSide:
                                                                BorderSide(
                                                              color:
                                                                  Colors.white,
                                                              width: 2,
                                                            ),
                                                          ),
                                                          autovalidate:
                                                              AutovalidateMode
                                                                  .disabled,
                                                          chipBackGroundColor:
                                                              Colors.blue,
                                                          chipLabelStyle:
                                                              TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .white),
                                                          dialogTextStyle:
                                                              TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                          checkBoxActiveColor:
                                                              Colors.blue,
                                                          checkBoxCheckColor:
                                                              Colors.white,
                                                          dialogShapeBorder:
                                                              RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              10.0))),
                                                          title: Text(
                                                            "Cusine",
                                                            style: TextStyle(
                                                                fontSize: 16),
                                                          ),
                                                          validator: (value) {
                                                            if (value == null ||
                                                                value.length ==
                                                                    0) {
                                                              return 'Please select one or more options';
                                                            }
                                                            return null;
                                                          },
                                                          dataSource: [
                                                            {
                                                              "display":
                                                                  "Indian",
                                                              "value": "Indian",
                                                            },
                                                            {
                                                              "display":
                                                                  "Chinese",
                                                              "value":
                                                                  "Chinese",
                                                            },
                                                            {
                                                              "display":
                                                                  "Italian",
                                                              "value":
                                                                  "Italian",
                                                            },
                                                            {
                                                              "display":
                                                                  "Sushi",
                                                              "value": "Sushi",
                                                            },
                                                            {
                                                              "display":
                                                                  "Mexican",
                                                              "value":
                                                                  "Mexican",
                                                            },
                                                            {
                                                              "display":
                                                                  "Multi Cuisine",
                                                              "value":
                                                                  "Multi Cuisine",
                                                            },
                                                          ],
                                                          textField: 'display',
                                                          valueField: 'value',
                                                          okButtonLabel: 'OK',
                                                          cancelButtonLabel:
                                                              'CANCEL',
                                                          hintWidget: Text(
                                                              'Select Cusine'),
                                                          initialValue:
                                                              _myCusine,
                                                          onSaved: (value) {
                                                            if (value == null)
                                                              return;
                                                            setState(() {
                                                              // cusineEditingController.text = value!;
                                                              _myCusine = value;
                                                            });
                                                          },
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        DropdownButtonFormField<
                                                            String>(
                                                          decoration:
                                                              InputDecoration(
                                                            labelText:
                                                                'Budget For Chef Types',
                                                            labelStyle:
                                                                TextStyle(
                                                              fontSize: 14,
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                            prefixIcon: Icon(
                                                                Icons.money),
                                                            fillColor:
                                                                Colors.white70,
                                                            // hintText: 'Select Current Salary',
                                                            hintStyle: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 15),
                                                            filled: true,
                                                            border:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            focusedBorder:
                                                                new OutlineInputBorder(
                                                              borderRadius:
                                                                  new BorderRadius
                                                                          .circular(
                                                                      10.0),
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                            ),
                                                          ),
                                                          autofocus: false,
                                                          value: salaryValue,
                                                          isExpanded: true,
                                                          iconSize: 25,
                                                          icon: Icon(
                                                              Icons
                                                                  .arrow_drop_down,
                                                              color:
                                                                  Colors.black),
                                                          items: salary
                                                              .map(
                                                                  buildMenuItem)
                                                              .toList(),
                                                          onChanged: (svalue) =>
                                                              setState(() {
                                                            this.salaryValue =
                                                                svalue;
                                                            salaryEditingController
                                                                .text = svalue!;
                                                          }),
                                                          onSaved: (lvalue) {
                                                            salaryEditingController
                                                                .text = lvalue!;
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  actions: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        SizedBox(
                                                          height: 45,
                                                          width: 100,
                                                          child: ElevatedButton(
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              ),
                                                            ),
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Text(
                                                              'Cancel',
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 45,
                                                          width: 100,
                                                          child: ElevatedButton(
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              ),
                                                            ),
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Text(
                                                              'Submit',
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          child: Text(
                                            'Enter your query for kitchen Professional ',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Available Chefs",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo[900],
                          fontSize: 20,
                        ),
                      ),
                      Spacer(),
                      TextButton(
                        child: Text(
                          " View More >",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo[900],
                            fontSize: 20,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => view_more(),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("chefs")
                        .limit(3)
                        // .where('dutystatus', isEqualTo: true)
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ListView(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(0.0),
                        scrollDirection: Axis.vertical,
                        primary: true,
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          print(document.data());
                          return new chef_list_view(
                            chefid: document['chefid'].toString().toLowerCase(),
                            cusineexpert: document['cuisineexpert'],
                            level: document['level'].toString(),
                            speciality: document['specialities'].toString(),
                            experience: document['experience'],
                            profilepic: document['profilepic'],
                            city: document['city'].toString(),
                            rating: document['rating'],
                            currentsalary: document['currentsalary'].toString(),
                            uid: document['uid'],
                            costperday: document['cheffees'],
                          );
                        }).toList(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String SelectGender) =>
      DropdownMenuItem(
        value: SelectGender,
        child: Text(
          SelectGender,
          style: TextStyle(fontSize: 18),
        ),
      );

  DropdownMenuItem<String> buildMenuItem1(String categoryofchef) =>
      DropdownMenuItem(
        value: categoryofchef,
        child: Text(
          categoryofchef,
          style: TextStyle(fontSize: 18),
        ),
      );

  DropdownMenuItem<String> buildMenuItem3(String levelofchef) =>
      DropdownMenuItem(
        value: cheflevel,
        child: Text(
          cheflevel!,
          style: TextStyle(fontSize: 18),
        ),
      );
}
