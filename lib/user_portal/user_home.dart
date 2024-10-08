import 'package:chef_connect_india/Drawers/navigation_drawer.dart';
import 'package:chef_connect_india/Helper/chef_list.dart';
import 'package:chef_connect_india/Helper/models/bookings.dart';
// import 'package:chef_connect_india/Helper/list.dart';
import 'package:chef_connect_india/user_portal/chef_details/View_more.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:date_time_picker/date_time_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

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
  privatedb(customerId, customerPhone, selectedLocation) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var bookingId =
        '${customerId.toString().substring(0, 2).toLowerCase()}${DateFormat('dd/MM/yyyy').format(DateTime.now()).replaceAll('/', '')}${DateFormat.Hms().format(DateTime.now()).replaceAll(':', '')}';
    BookingModel bookingModel = BookingModel();
    bookingModel.bookingDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
    bookingModel.bookingTime = DateFormat.Hms().format(DateTime.now());
    bookingModel.bookingType = 'Private';
    bookingModel.customerId = customerId;
    bookingModel.customerPhone = customerPhone;
    bookingModel.address = addressController.text;
    bookingModel.chefCategory = LevelEditingController.text;
    bookingModel.requirementDate = dateController.text;
    bookingModel.preferedBudget = salaryEditingController.text;
    bookingModel.preferedChefGender = GenderEditingController.text;
    bookingModel.bookingStatus = 'Submitted';

    if (dateController.text.length == 0) {
      Fluttertoast.showToast(msg: "Date can't be empty");
    } else if (addressController.text.length == 0) {
      Fluttertoast.showToast(msg: "Address can't be empty");
    } else if (addressController.text.length < 21) {
      Fluttertoast.showToast(msg: "Please Enter Detailed Address");
    } else {
      await firebaseFirestore
          .collection("Queries")
          .doc(bookingId)
          .set(bookingModel.toMap());
      // print(GenderEditingController.text);
      // print(LevelEditingController.text);
      // print(salaryEditingController.text);
      // print(dateController.text);
      // print(addressController.text);
      // FirebaseFirestore.instance
      //     .collection('bookings')
      //     .doc('00private')
      //     .collection('private')
      //     .doc()
      //     .set({
      //   // 'Gender': GenderEditingController.text,
      //   // 'salary': salaryEditingController.text,
      //   // 'category': LevelEditingController.text,
      //   // 'date': dateController.text,
      //   // 'address': addressController.text,
      //   // 'cid': FirebaseAuth.instance.currentUser!.uid
      // }, SetOptions(merge: true));
      Fluttertoast.showToast(msg: "Query Successfully Submitted");
      Navigator.pop(context);
    }
  }

  kitchendb(customerId, customerPhone, selectedLocation) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var bookingId =
        '${customerId.toString().substring(0, 2).toLowerCase()}${DateFormat('dd/MM/yyyy').format(DateTime.now()).replaceAll('/', '')}${DateFormat.Hms().format(DateTime.now()).replaceAll(':', '')}';
    BookingModel bookingModel = BookingModel();
    bookingModel.bookingDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
    bookingModel.bookingTime = DateFormat.Hms().format(DateTime.now());
    bookingModel.bookingType = 'Kitchen';
    bookingModel.customerId = customerId;
    bookingModel.customerPhone = customerPhone;
    bookingModel.requirementDate = kitchendateController.text;
    bookingModel.restaurantName = hotelnameController.text;
    bookingModel.chefCount = numofchefsController.text;
    bookingModel.chefCategory = kitchenLevelController.text;
    bookingModel.preferedBudget = kitchensalaryController.text;
    bookingModel.address = kitchenaddressController.text;
    bookingModel.preferedCuisine = _myCusine;
    bookingModel.bookingId = bookingId;
    bookingModel.location = selectedLocation;
    bookingModel.bookingStatus = 'Submitted';

    if (hotelnameController.text.length == 0) {
      Fluttertoast.showToast(msg: "Hotel name can't be empty");
    } else if (numofchefsController.text.length == 0) {
      Fluttertoast.showToast(msg: "Number of chefs can't be zero");
    } else if (kitchendateController.text.length == 0) {
      Fluttertoast.showToast(msg: "Please Enter Date");
    } else if (kitchendateController.text.length < 6) {
      Fluttertoast.showToast(msg: "Please enter Correct Date-Format");
    } else if (kitchenaddressController.text.length == 0) {
      Fluttertoast.showToast(msg: "Address can't be empty");
    } else if (kitchenaddressController.text.length < 21) {
      Fluttertoast.showToast(msg: "Please Enter Detailed Address");
    } else {
      // print(hotelnameController.text);
      // print(numofchefsController.text);
      // print(kitchendateController.text);
      // print(kitchenLevelController.text);
      // print(_myCusine);
      // print(kitchensalaryController.text);
      // print(kitchenaddressController.text);
      await firebaseFirestore
          .collection("Queries")
          .doc(bookingId)
          .set(bookingModel.toMap());
      // FirebaseFirestore.instance
      //     .collection('bookings')
      //     .doc('01kitchen')
      //     .collection('Kitchen Professional')
      //     .doc()
      //     .set({
      //   // 'hotel name': hotelnameController.text,
      //   // 'numofchefs': numofchefsController.text,
      //   // 'date': kitchendateController.text,
      //   // 'level': kitchenLevelController.text,
      //   // 'cusine': _myCusine,
      //   // 'salary': kitchensalaryController.text,
      //   // 'address': kitchenaddressController.text,
      //   'cid': FirebaseAuth.instance.currentUser!.uid
      // }, SetOptions(merge: true));
      Fluttertoast.showToast(msg: "Query Successfully Submitted");
      Navigator.pop(context);
    }
  }

  DateTime selectedDate = DateTime.now();

  // Future<void> _selectDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //       context: context,
  //       initialDate: selectedDate,
  //       firstDate: DateTime(2015, 8),
  //       lastDate: DateTime(2101));
  //   if (picked != null && picked != selectedDate) {
  //     setState(() {
  //       selectedDate = picked;
  //     });
  //   }
  // }

  @override
  void initState() {
    _myCusine = [];
    super.initState();
  }

  DateTime _date = DateTime.now();
  final formGlobalKey = GlobalKey<FormState>();
  final TextEditingController dateCtl = TextEditingController();
  final dateController = TextEditingController();
  final addressController = TextEditingController();
  final GenderEditingController = new TextEditingController();
  final categoryofchefEditingController = new TextEditingController();
  final salaryEditingController = new TextEditingController();
  final LevelEditingController = new TextEditingController();
  //kitchen
  final hotelnameController = new TextEditingController();
  final numofchefsController = new TextEditingController();
  final kitchendateController = new TextEditingController();
  final kitchenLevelController = new TextEditingController();
  final kitchencusineController = new TextEditingController();
  final kitchensalaryController = new TextEditingController();
  final kitchenaddressController = new TextEditingController();

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
    "Helper"
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
          backgroundColor: Colors.indigo.shade700,
          toolbarHeight: 70, // default is 56
          elevation: 50.0,
          title: Text(
            'Chef Connect',
            style: TextStyle(
              fontSize: 25,
              fontFamily: 'Montserrat',
            ),
          ),
          centerTitle: true,
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
          closeManually: false,
          openCloseDial: isDialOpen,
          children: [
            SpeedDialChild(
                child: Icon(Icons.call),
                backgroundColor: Colors.green,
                label: 'Call',
                onTap: () {
                  var a = '+91 7353064599';
                  launch("tel: ${a}");
                }),
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
            //           launch("https://www.facebook.com/chefconnect.india");
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
              child:
                  Image(image: AssetImage('assets/socialicons/instagram.png')),
              // backgroundColor: Colors.indigo,
              label: 'Instagram',
              onTap: () {
                launch("https://www.instagram.com/chefconnectindia");
              },
            ),
            SpeedDialChild(
                child:
                    Image(image: AssetImage('assets/socialicons/twitter.png')),
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
                // print('-------------data-----${data}');
                // if (snapshot.hasData) {
                //   String location = data['selectedLocation'];
                // }
                // var location = data['selectedLocation'];
                return SingleChildScrollView(
                  child: SafeArea(
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            height: 260,
                            child: ListView(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 220,
                                        width: 220,
                                        decoration: BoxDecoration(
                                          // border: Border.all(color: Colors.grey.shade400, width: 5),
                                          borderRadius: BorderRadius.all(
                                            Radius.zero,
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

                                              Colors.white,
                                              Colors.white,
                                            ],
                                          ),
                                        ),
                                        child: InkWell(
                                          onTap: () {},
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                'assets/partychef.jpeg',
                                                height: 220,
                                                width: 220,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        height: 220,
                                        width: 220,
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
                                                height: 188,
                                                width: 220,
                                              ),
                                              SizedBox(
                                                width: 300,
                                                height: 32,
                                                child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .zero),
                                                    primary:
                                                        Colors.indigo.shade600,
                                                  ),
                                                  onPressed: () {
                                                    showDialog(
                                                      useSafeArea: true,
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return AlertDialog(
                                                          title: Text(
                                                            'Query For Private Chef',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Montserrat',
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                          backgroundColor:
                                                              Colors.white,
                                                          content:
                                                              SingleChildScrollView(
                                                            child: Form(
                                                              key:
                                                                  formGlobalKey,
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
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
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          fontSize:
                                                                              13,
                                                                          color: Colors
                                                                              .black,
                                                                          fontWeight:
                                                                              FontWeight.w500),
                                                                      prefixIcon:
                                                                          Icon(
                                                                        Icons
                                                                            .person,
                                                                        color: Colors
                                                                            .black45,
                                                                      ),
                                                                      fillColor:
                                                                          Colors
                                                                              .white70,
                                                                      hintText:
                                                                          'Prefered Chef Gender',
                                                                      hintStyle: TextStyle(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              14),
                                                                      filled:
                                                                          true,
                                                                      border:
                                                                          OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Colors.black,
                                                                          width:
                                                                              1,
                                                                        ),
                                                                      ),
                                                                      focusedBorder:
                                                                          new OutlineInputBorder(
                                                                        borderRadius:
                                                                            new BorderRadius.circular(10.0),
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Colors.black,
                                                                          width:
                                                                              1,
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
                                                                    validator:
                                                                        (value) {
                                                                      if (GenderEditingController
                                                                          .text
                                                                          .isEmpty) {
                                                                        return "Please Select Chef Gender";
                                                                      }
                                                                      return null;
                                                                    },
                                                                    autofocus:
                                                                        false,
                                                                    value:
                                                                        locValue,
                                                                    isExpanded:
                                                                        true,
                                                                    iconSize:
                                                                        25,
                                                                    icon: Icon(
                                                                        Icons
                                                                            .arrow_drop_down,
                                                                        color: Colors
                                                                            .black),
                                                                    items: SelectGender.map(
                                                                            buildMenuItem)
                                                                        .toList(),
                                                                    onChanged: (Gvalue) =>
                                                                        setState(
                                                                            () {
                                                                      this.locValue =
                                                                          Gvalue;
                                                                      GenderEditingController
                                                                              .text =
                                                                          Gvalue!;
                                                                    }),
                                                                    onSaved:
                                                                        (Gvalue) {
                                                                      GenderEditingController
                                                                              .text =
                                                                          Gvalue!;
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
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          fontSize:
                                                                              15,
                                                                          color: Colors
                                                                              .black,
                                                                          fontWeight:
                                                                              FontWeight.w500),
                                                                      prefixIcon:
                                                                          Icon(
                                                                        Icons
                                                                            .leaderboard,
                                                                        color: Colors
                                                                            .black45,
                                                                      ),
                                                                      fillColor:
                                                                          Colors
                                                                              .white70,
                                                                      // hintText: 'Select Current Salary',
                                                                      hintStyle: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              15),
                                                                      filled:
                                                                          true,
                                                                      border:
                                                                          OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Colors.black,
                                                                          width:
                                                                              1,
                                                                        ),
                                                                      ),
                                                                      focusedBorder:
                                                                          new OutlineInputBorder(
                                                                        borderRadius:
                                                                            new BorderRadius.circular(10.0),
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Colors.black,
                                                                          width:
                                                                              1,
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
                                                                    validator:
                                                                        (value) {
                                                                      if (LevelEditingController
                                                                          .text
                                                                          .isEmpty) {
                                                                        return "Please Select Chef Category";
                                                                      }
                                                                      return null;
                                                                    },
                                                                    autofocus:
                                                                        false,
                                                                    value:
                                                                        cheflevel,
                                                                    isExpanded:
                                                                        true,
                                                                    iconSize:
                                                                        25,
                                                                    icon: Icon(
                                                                        Icons
                                                                            .arrow_drop_down,
                                                                        color: Colors
                                                                            .black),
                                                                    items: levelofchef
                                                                        .map(
                                                                            buildMenuItem)
                                                                        .toList(),
                                                                    onChanged: (Dvalue) =>
                                                                        setState(
                                                                            () {
                                                                      this.chefvalue =
                                                                          Dvalue;
                                                                      LevelEditingController
                                                                              .text =
                                                                          Dvalue!;
                                                                    }),
                                                                    onSaved:
                                                                        (Dvalue) {
                                                                      LevelEditingController
                                                                              .text =
                                                                          Dvalue!;
                                                                    },
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  DropdownButtonFormField<
                                                                      String>(
                                                                    validator:
                                                                        (value) {
                                                                      if (salaryEditingController
                                                                          .text
                                                                          .isEmpty) {
                                                                        return "Please Select budget Range";
                                                                      }
                                                                      return null;
                                                                    },
                                                                    decoration:
                                                                        InputDecoration(
                                                                      labelText:
                                                                          'Budget For Chef',
                                                                      labelStyle:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: Colors
                                                                            .black,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                      prefixIcon:
                                                                          Icon(
                                                                        Icons
                                                                            .money,
                                                                        color: Colors
                                                                            .black45,
                                                                      ),
                                                                      fillColor:
                                                                          Colors
                                                                              .white70,
                                                                      // hintText: 'Select Current Salary',
                                                                      hintStyle: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              15),
                                                                      filled:
                                                                          true,
                                                                      border:
                                                                          OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Colors.black,
                                                                          width:
                                                                              1,
                                                                        ),
                                                                      ),
                                                                      focusedBorder:
                                                                          new OutlineInputBorder(
                                                                        borderRadius:
                                                                            new BorderRadius.circular(10.0),
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Colors.black,
                                                                          width:
                                                                              1,
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
                                                                    autofocus:
                                                                        false,
                                                                    value:
                                                                        salaryValue,
                                                                    isExpanded:
                                                                        true,
                                                                    iconSize:
                                                                        25,
                                                                    icon: Icon(
                                                                        Icons
                                                                            .arrow_drop_down,
                                                                        color: Colors
                                                                            .black),
                                                                    items: salary
                                                                        .map(
                                                                            buildMenuItem)
                                                                        .toList(),
                                                                    onChanged: (svalue) =>
                                                                        setState(
                                                                            () {
                                                                      this.salaryValue =
                                                                          svalue;
                                                                      salaryEditingController
                                                                              .text =
                                                                          svalue!;
                                                                    }),
                                                                    onSaved:
                                                                        (lvalue) {
                                                                      salaryEditingController
                                                                              .text =
                                                                          lvalue!;
                                                                    },
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  TextFormField(
                                                                    controller:
                                                                        dateController,
                                                                    decoration: InputDecoration(
                                                                        border: OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.all(
                                                                            Radius.circular(10.0),
                                                                          ),
                                                                        ),
                                                                        focusedBorder: new OutlineInputBorder(
                                                                          borderRadius:
                                                                              new BorderRadius.circular(10.0),
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Colors.black,
                                                                            width:
                                                                                1,
                                                                          ),
                                                                        ),
                                                                        enabledBorder: OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(10),
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Colors.grey.shade500,
                                                                            width:
                                                                                1,
                                                                          ),
                                                                        ),
                                                                        // icon: Icon(Icons
                                                                        //     .calendar_today),
                                                                        labelText: "Select Date"),
                                                                    readOnly:
                                                                        true,
                                                                    validator:
                                                                        (value) {
                                                                      if (dateController
                                                                          .text
                                                                          .isEmpty) {
                                                                        return "Please Select Date";
                                                                      }
                                                                      return null;
                                                                    },
                                                                    onTap:
                                                                        () async {
                                                                      DateTime? pickedDate = await showDatePicker(
                                                                          context:
                                                                              context,
                                                                          initialDate: DateTime
                                                                              .now(),
                                                                          firstDate: DateTime
                                                                              .now(),
                                                                          lastDate:
                                                                              DateTime(2101));

                                                                      if (pickedDate !=
                                                                          null) {
                                                                        print(
                                                                            pickedDate);
                                                                        String
                                                                            formattedDate =
                                                                            DateFormat('yyyy-MM-dd').format(pickedDate);

                                                                        setState(
                                                                            () {
                                                                          dateController.text =
                                                                              formattedDate;
                                                                        });
                                                                      } else {
                                                                        Fluttertoast.showToast(
                                                                            msg:
                                                                                "Date not Selected",
                                                                            toastLength: Toast
                                                                                .LENGTH_SHORT,
                                                                            gravity: ToastGravity
                                                                                .SNACKBAR,
                                                                            timeInSecForIosWeb:
                                                                                1,
                                                                            backgroundColor:
                                                                                Colors.red.shade300,
                                                                            textColor: Colors.white,
                                                                            fontSize: 16.0);
                                                                      }
                                                                    },
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  TextFormField(
                                                                    minLines: 5,
                                                                    maxLines:
                                                                        20,
                                                                    controller:
                                                                        addressController,
                                                                    validator:
                                                                        (value) {
                                                                      if (value!
                                                                          .isEmpty) {
                                                                        //allow upper and lower case alphabets and space
                                                                        return "Address can't be Empty";
                                                                      } else {
                                                                        return null;
                                                                      }
                                                                    },
                                                                    onSaved:
                                                                        (value) {
                                                                      addressController
                                                                              .text =
                                                                          value!;
                                                                    },
                                                                    decoration:
                                                                        InputDecoration(
                                                                      fillColor:
                                                                          Colors
                                                                              .white70,
                                                                      filled:
                                                                          true,
                                                                      hintText:
                                                                          'Enter Address',
                                                                      hintStyle:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: Colors
                                                                            .black,
                                                                      ),
                                                                      border:
                                                                          OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Colors.black,
                                                                          width:
                                                                              1,
                                                                        ),
                                                                      ),
                                                                      focusedBorder:
                                                                          new OutlineInputBorder(
                                                                        borderRadius:
                                                                            new BorderRadius.circular(10.0),
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Colors.black,
                                                                          width:
                                                                              1,
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
                                                                ],
                                                              ),
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
                                                                  child:
                                                                      ElevatedButton(
                                                                    style: ElevatedButton
                                                                        .styleFrom(
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                      ),
                                                                    ),
                                                                    onPressed:
                                                                        () {
                                                                      formGlobalKey
                                                                          .currentState!
                                                                          .reset();
                                                                      Navigator.pop(
                                                                          context);
                                                                    },
                                                                    child: Text(
                                                                      'Cancel',
                                                                      style:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 45,
                                                                  width: 100,
                                                                  child:
                                                                      ElevatedButton(
                                                                    style: ElevatedButton
                                                                        .styleFrom(
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                      ),
                                                                    ),
                                                                    onPressed:
                                                                        () {
                                                                      if (formGlobalKey
                                                                          .currentState!
                                                                          .validate()) {
                                                                        privatedb(
                                                                            data['username'],
                                                                            data['mobile1'],
                                                                            data['selectedLocation']);
                                                                      }
                                                                    },
                                                                    child: Text(
                                                                      'Submit',
                                                                      style:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                      ),
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
                                                    'Query For Private Chef',
                                                    style: TextStyle(
                                                      fontSize: 12,
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
                                        height: 220,
                                        width: 220,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                0.0,
                                              ),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.16),
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
                                                height: 188,
                                                width: 230,
                                                fit: BoxFit.fitWidth,
                                              ),
                                              SizedBox(
                                                width: 290,
                                                height: 32,
                                                child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.zero,
                                                    ),
                                                    primary: Colors.indigo,
                                                  ),
                                                  onPressed: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return AlertDialog(
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                              10,
                                                            ),
                                                          ),
                                                          title: Text(
                                                            'Query For Kitchen Professional',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Montserrat',
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                          backgroundColor:
                                                              Colors.white,
                                                          content:
                                                              SingleChildScrollView(
                                                            child: Form(
                                                              key:
                                                                  formGlobalKey,
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  TextFormField(
                                                                    controller:
                                                                        hotelnameController,
                                                                    onSaved:
                                                                        (value) {
                                                                      hotelnameController
                                                                              .text =
                                                                          value!;
                                                                    },
                                                                    validator:
                                                                        (value) {
                                                                      if (hotelnameController
                                                                          .text
                                                                          .isEmpty) {
                                                                        return "Hotel Name can't be empty!";
                                                                      }
                                                                      return null;
                                                                    },
                                                                    decoration:
                                                                        InputDecoration(
                                                                      fillColor:
                                                                          Colors
                                                                              .white70,
                                                                      filled:
                                                                          true,
                                                                      hintText:
                                                                          'Enter Hotel name',
                                                                      hintStyle:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: Colors
                                                                            .black,
                                                                      ),
                                                                      border:
                                                                          OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  TextFormField(
                                                                    controller:
                                                                        numofchefsController,
                                                                    onSaved:
                                                                        (value) {
                                                                      numofchefsController
                                                                              .text =
                                                                          value!;
                                                                    },
                                                                    validator:
                                                                        (value) {
                                                                      if (numofchefsController
                                                                          .text
                                                                          .isEmpty) {
                                                                        return "Enter Number of Chefs!";
                                                                      }
                                                                      return null;
                                                                    },
                                                                    decoration:
                                                                        InputDecoration(
                                                                      fillColor:
                                                                          Colors
                                                                              .white70,
                                                                      filled:
                                                                          true,
                                                                      hintText:
                                                                          'Number of Chefs Required',
                                                                      hintStyle:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: Colors
                                                                            .black,
                                                                      ),
                                                                      border:
                                                                          OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  TextFormField(
                                                                    controller:
                                                                        kitchendateController,
                                                                    decoration: InputDecoration(
                                                                        border: OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.all(
                                                                            Radius.circular(10.0),
                                                                          ),
                                                                        ),
                                                                        focusedBorder: new OutlineInputBorder(
                                                                          borderRadius:
                                                                              new BorderRadius.circular(10.0),
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Colors.black,
                                                                            width:
                                                                                1,
                                                                          ),
                                                                        ),
                                                                        enabledBorder: OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(10),
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Colors.grey.shade500,
                                                                            width:
                                                                                1,
                                                                          ),
                                                                        ),
                                                                        // icon: Icon(Icons
                                                                        //     .calendar_today),
                                                                        labelText: "Select Date"),
                                                                    readOnly:
                                                                        true,
                                                                    validator:
                                                                        (value) {
                                                                      if (kitchendateController
                                                                          .text
                                                                          .isEmpty) {
                                                                        return "Please Select Date";
                                                                      }
                                                                      return null;
                                                                    },
                                                                    onTap:
                                                                        () async {
                                                                      DateTime? pickedDate = await showDatePicker(
                                                                          context:
                                                                              context,
                                                                          initialDate: DateTime
                                                                              .now(),
                                                                          firstDate: DateTime
                                                                              .now(),
                                                                          lastDate:
                                                                              DateTime(2101));

                                                                      if (pickedDate !=
                                                                          null) {
                                                                        print(
                                                                            pickedDate);
                                                                        String
                                                                            formattedDate =
                                                                            DateFormat('yyyy-MM-dd').format(pickedDate);

                                                                        setState(
                                                                            () {
                                                                          kitchendateController.text =
                                                                              formattedDate;
                                                                        });
                                                                      } else {
                                                                        Fluttertoast.showToast(
                                                                            msg:
                                                                                "Date not Selected",
                                                                            toastLength: Toast
                                                                                .LENGTH_SHORT,
                                                                            gravity: ToastGravity
                                                                                .SNACKBAR,
                                                                            timeInSecForIosWeb:
                                                                                1,
                                                                            backgroundColor:
                                                                                Colors.red.shade300,
                                                                            textColor: Colors.white,
                                                                            fontSize: 16.0);
                                                                      }
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
                                                                          'Level Of Chef',
                                                                      labelStyle:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        fontSize:
                                                                            16,
                                                                        color: Colors
                                                                            .black,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                      ),
                                                                      prefixIcon:
                                                                          Icon(
                                                                        Icons
                                                                            .leaderboard,
                                                                        color: Colors
                                                                            .black45,
                                                                      ),
                                                                      fillColor:
                                                                          Colors
                                                                              .white70,
                                                                      // hintText: 'Select Current Salary',
                                                                      hintStyle: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              15),
                                                                      filled:
                                                                          true,
                                                                      border:
                                                                          OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Colors.black,
                                                                          width:
                                                                              1,
                                                                        ),
                                                                      ),
                                                                      focusedBorder:
                                                                          new OutlineInputBorder(
                                                                        borderRadius:
                                                                            new BorderRadius.circular(10.0),
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Colors.black,
                                                                          width:
                                                                              1,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    autofocus:
                                                                        false,
                                                                    value:
                                                                        chefvalue,
                                                                    isExpanded:
                                                                        true,
                                                                    iconSize:
                                                                        25,
                                                                    icon: Icon(
                                                                        Icons
                                                                            .arrow_drop_down,
                                                                        color: Colors
                                                                            .black),
                                                                    items: categoryofchef
                                                                        .map(
                                                                            buildMenuItem)
                                                                        .toList(),
                                                                    onChanged: (Evalue) =>
                                                                        setState(
                                                                            () {
                                                                      this.chefvalue =
                                                                          Evalue;
                                                                      kitchenLevelController
                                                                              .text =
                                                                          Evalue!;
                                                                    }),
                                                                    onSaved:
                                                                        (Evalue) {
                                                                      kitchenLevelController
                                                                              .text =
                                                                          Evalue!;
                                                                    },
                                                                    validator:
                                                                        (value) {
                                                                      if (kitchenLevelController
                                                                          .text
                                                                          .isEmpty) {
                                                                        return "Please Select Chef Level";
                                                                      }
                                                                      return null;
                                                                    },
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  MultiSelectFormField(
                                                                    border:
                                                                        OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Colors
                                                                            .white,
                                                                        width:
                                                                            2,
                                                                      ),
                                                                    ),
                                                                    autovalidate:
                                                                        AutovalidateMode
                                                                            .always,
                                                                    chipBackGroundColor:
                                                                        Colors
                                                                            .blue,
                                                                    chipLabelStyle: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        color: Colors
                                                                            .white),
                                                                    dialogTextStyle:
                                                                        TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.w600),
                                                                    checkBoxActiveColor:
                                                                        Colors
                                                                            .blue,
                                                                    checkBoxCheckColor:
                                                                        Colors
                                                                            .white,
                                                                    dialogShapeBorder:
                                                                        RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.all(Radius.circular(10.0))),
                                                                    title: Text(
                                                                      "Cusine",
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          fontSize:
                                                                              16),
                                                                    ),
                                                                    dataSource: [
                                                                      {
                                                                        "display":
                                                                            "Indian",
                                                                        "value":
                                                                            "Indian",
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
                                                                        "value":
                                                                            "Sushi",
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
                                                                      {
                                                                        "display":
                                                                            "Continental",
                                                                        "value":
                                                                            "Continental",
                                                                      },
                                                                    ],
                                                                    textField:
                                                                        'display',
                                                                    valueField:
                                                                        'value',
                                                                    okButtonLabel:
                                                                        'OK',
                                                                    cancelButtonLabel:
                                                                        'CANCEL',
                                                                    hintWidget:
                                                                        Text(
                                                                            'Select Cusine'),
                                                                    initialValue:
                                                                        _myCusine,
                                                                    onSaved:
                                                                        (value) {
                                                                      if (value ==
                                                                          null)
                                                                        return;
                                                                      setState(
                                                                          () {
                                                                        // cusineEditingController.text = value!;
                                                                        _myCusine =
                                                                            value;
                                                                      });
                                                                    },
                                                                    validator:
                                                                        (value) {
                                                                      if (value
                                                                          .isEmpty) {
                                                                        return "Please Select Cuisine";
                                                                      }
                                                                      return null;
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
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        fontSize:
                                                                            14,
                                                                        color: Colors
                                                                            .black,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                      ),
                                                                      prefixIcon:
                                                                          Icon(Icons
                                                                              .money),
                                                                      fillColor:
                                                                          Colors
                                                                              .white70,
                                                                      // hintText: 'Select Current Salary',
                                                                      hintStyle: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              15),
                                                                      filled:
                                                                          true,
                                                                      border:
                                                                          OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                      ),
                                                                      focusedBorder:
                                                                          new OutlineInputBorder(
                                                                        borderRadius:
                                                                            new BorderRadius.circular(10.0),
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Colors.black,
                                                                          width:
                                                                              1,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    autofocus:
                                                                        false,
                                                                    value:
                                                                        salaryValue,
                                                                    isExpanded:
                                                                        true,
                                                                    iconSize:
                                                                        25,
                                                                    icon: Icon(
                                                                        Icons
                                                                            .arrow_drop_down,
                                                                        color: Colors
                                                                            .black),
                                                                    items: salary
                                                                        .map(
                                                                            buildMenuItem)
                                                                        .toList(),
                                                                    onChanged: (svalue) =>
                                                                        setState(
                                                                            () {
                                                                      this.salaryValue =
                                                                          svalue;
                                                                      kitchensalaryController
                                                                              .text =
                                                                          svalue!;
                                                                    }),
                                                                    validator:
                                                                        (value) {
                                                                      if (kitchensalaryController
                                                                          .text
                                                                          .isEmpty) {
                                                                        return "Please Select Budget";
                                                                      }
                                                                      return null;
                                                                    },
                                                                    onSaved:
                                                                        (lvalue) {
                                                                      kitchensalaryController
                                                                              .text =
                                                                          lvalue!;
                                                                    },
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  TextFormField(
                                                                    controller:
                                                                        kitchenaddressController,
                                                                    onSaved:
                                                                        (value) {
                                                                      kitchenaddressController
                                                                              .text =
                                                                          value!;
                                                                    },
                                                                    validator:
                                                                        (value) {
                                                                      if (kitchenaddressController
                                                                          .text
                                                                          .isEmpty) {
                                                                        return "Please Enter Address";
                                                                      }
                                                                      return null;
                                                                    },
                                                                    minLines: 5,
                                                                    maxLines:
                                                                        20,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      fillColor:
                                                                          Colors
                                                                              .white70,
                                                                      filled:
                                                                          true,
                                                                      hintText:
                                                                          'Enter Address',
                                                                      hintStyle:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: Colors
                                                                            .black,
                                                                      ),
                                                                      border:
                                                                          OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Colors.black,
                                                                          width:
                                                                              1,
                                                                        ),
                                                                      ),
                                                                      focusedBorder:
                                                                          new OutlineInputBorder(
                                                                        borderRadius:
                                                                            new BorderRadius.circular(10.0),
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Colors.black,
                                                                          width:
                                                                              1,
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
                                                                ],
                                                              ),
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
                                                                  child:
                                                                      ElevatedButton(
                                                                    style: ElevatedButton
                                                                        .styleFrom(
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                      ),
                                                                    ),
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.pop(
                                                                          context);
                                                                    },
                                                                    child: Text(
                                                                      'Cancel',
                                                                      style:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 45,
                                                                  width: 100,
                                                                  child:
                                                                      ElevatedButton(
                                                                    style: ElevatedButton
                                                                        .styleFrom(
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                      ),
                                                                    ),
                                                                    onPressed:
                                                                        () {
                                                                      if (formGlobalKey
                                                                          .currentState!
                                                                          .validate()) {
                                                                        kitchendb(
                                                                            data['username'],
                                                                            data['mobile1'],
                                                                            data['selectedLocation']);
                                                                      }
                                                                    },
                                                                    child: Text(
                                                                      'Submit',
                                                                      style:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                      ),
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
                                                    'Query For Kitchen Professional ',
                                                    style: TextStyle(
                                                      fontSize: 11,
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  "Available Chefs",
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    color: Colors.indigo[900],
                                    fontSize: 16,
                                  ),
                                ),
                                Spacer(),
                                TextButton(
                                  child: Text(
                                    " View More >",
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      color: Colors.indigo[900],
                                      fontSize: 16,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => view_more(
                                            selectedLocation:
                                                data['selectedLocation']),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection("chefs")
                                .limit(2)
                                // .where('city',
                                //     isEqualTo: data['selectedLocation'])
                                .where('verified', isEqualTo: true)
                                // .where('dutystatus', isEqualTo: true)
                                .snapshots(),
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (!snapshot.hasData) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              return GridView(
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                // padding: const EdgeInsets.all(0.0),
                                scrollDirection: Axis.vertical,
                                primary: true,
                                gridDelegate:
                                    SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: 1 / 7.5,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 0,
                                ),
                                children: snapshot.data!.docs
                                    .map((DocumentSnapshot document) {
                                  print(document.data());
                                  return new chef_list_view(
                                    chefid: document['chefid']
                                        .toString()
                                        .toLowerCase(),
                                    cusineexpert: document['cuisineexpert'],
                                    level: document['level'].toString(),
                                    speciality:
                                        document['specialities'].toString(),
                                    experience: document['experience'],
                                    profilepic: document['profilepic'],
                                    city: document['city'].toString(),
                                    rating: document['rating'],
                                    currentsalary:
                                        document['currentsalary'].toString(),
                                    uid: document['uid'],
                                    costperday: document['cheffees'],
                                    chefContact: document['mobile1'],
                                  );
                                }).toList(),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
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
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'Montserrat',
          ),
        ),
      );

  DropdownMenuItem<String> buildMenuItem3(String levelofchef) =>
      DropdownMenuItem(
        value: cheflevel,
        child: Text(
          cheflevel!,
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'Montserrat',
          ),
        ),
      );
}
