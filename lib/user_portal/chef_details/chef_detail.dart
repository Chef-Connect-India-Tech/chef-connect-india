import 'package:chef_connect_india/user_portal/chef_details/menu/menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';

class chef_detail extends StatefulWidget {
  var chefid;
  var cheflevel;
  int experience;
  List cuisine = [];
  var city;
  var profilepic;
  var specialities;
  double rating;
  var cid;

  chef_detail({
    Key? key,
    required this.chefid,
    required this.cheflevel,
    required this.experience,
    required this.cuisine,
    required this.city,
    required this.profilepic,
    required this.rating,
    required this.specialities,
    required this.cid,
  }) : super(key: key);

  @override
  State<chef_detail> createState() => _chef_detailState();
}

class _chef_detailState extends State<chef_detail> {
  var cuisine_name;
  var customised_items;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    // String cuisine_exp = widget.cuisine.replaceAll('[', '').replaceAll(']', '');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: Text(widget.chefid),
      ),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 48, left: 20, right: 20),
                        height: 200,
                        width: width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.16),
                              offset: Offset(0, 3.0),
                              blurRadius: 12.0,
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 60.0,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                  ),
                                  radius: 60.0,
                                  backgroundImage: NetworkImage(
                                    widget.profilepic,
                                  ),
                                ),
                              ),
                              Center(
                                child: Container(
                                  padding: EdgeInsets.only(top: 12),
                                  child: Text(
                                    '${widget.chefid}',
                                    style: TextStyle(
                                      fontFamily: 'SF Pro',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 24.0,
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: Container(
                                  padding: EdgeInsets.only(top: 8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'City: ',
                                        style: TextStyle(
                                          fontFamily: 'SF Pro',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                        ),
                                      ),
                                      Text(
                                        '${widget.city}',
                                        style: TextStyle(
                                          fontFamily: 'SF Pro',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 20.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Center(
                                    child: Container(
                                      padding: EdgeInsets.only(top: 16),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Chef Level: ',
                                            style: TextStyle(
                                              fontFamily: 'SF Pro',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                          Text(
                                            '${widget.cheflevel}',
                                            style: TextStyle(
                                              fontFamily: 'SF Pro',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Container(
                                      padding: EdgeInsets.only(top: 16),
                                      child: Row(
                                        children: [
                                          SmoothStarRating(
                                            borderColor: Colors.grey.shade200,
                                            rating: widget.rating,
                                            starCount: 1,
                                            allowHalfRating: false,
                                            filledIconData: Icons.star,
                                            color: Color.fromARGB(
                                                255, 255, 179, 0),
                                          ),
                                          Text(
                                            '${widget.rating}',
                                            style: TextStyle(
                                              fontFamily: 'SF Pro',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    height: 180,
                    width: width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
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
                        Container(
                          padding:
                              EdgeInsets.only(top: 16, left: 16, right: 16),
                          child: Row(
                            // mainAxisAlignment:
                            //     MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Experience: ',
                                style: TextStyle(
                                  fontFamily: 'SF Pro',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                              ),
                              Text(
                                '${widget.experience}',
                                style: TextStyle(
                                  fontFamily: 'SF Pro',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.0,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.only(top: 16, left: 16, right: 16),
                          child: Column(
                            // mainAxisAlignment:
                            //     MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Cuisine Expert : ',
                                    style: TextStyle(
                                      fontFamily: 'SF Pro',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Wrap(
                                spacing: 5.0,
                                children: widget.cuisine
                                    .map((e) => Chip(
                                          label: Text(e),
                                        ))
                                    .toList(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Card(
                      elevation: 5,
                      child: SizedBox(
                        height: 50,
                        width: 250,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            primary: Colors.white,
                            onPrimary: Color.fromARGB(255, 18, 68, 138),
                          ),
                          onPressed: () async {
                            var cust_collection =
                                FirebaseFirestore.instance.collection('Menu');
                            var cust_docSnapshot =
                                await cust_collection.doc(widget.cid).get();
                            if (cust_docSnapshot.exists) {
                              Map<String, dynamic> cust_data =
                                  cust_docSnapshot.data()!;
                              customised_items = cust_data['customised menu'];
                              // print(name);
                            }
                            List<String> _cust_items =
                                customised_items.cast<String>();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MenuTab(
                                      cid: widget.cid,
                                      customisedmenu: _cust_items)),
                            );
                            print("button pressed");
                          },
                          child: Text(
                            'Select Menu',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
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
    );
  }
}
