// ignore_for_file: must_be_immutable

import 'package:chef_connect_india/user_portal/chef_details/chef_detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:chef_connect_india/user_portal/chef_details/chef_details.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';

class chef_list_view extends StatefulWidget {
  var chefid;
  List cusineexpert = [];
  var level;
  int experience;
  var speciality;
  var profilepic;
  var rating;
  var city;
  var uid;
  var currentsalary;
  int costperday;
  var chefContact;

  chef_list_view(
      {required this.chefid,
      required this.cusineexpert,
      required this.level,
      required this.speciality,
      required this.experience,
      required this.profilepic,
      required this.rating,
      required this.city,
      required this.uid,
      required this.currentsalary,
      required this.chefContact,
      required this.costperday});

  @override
  State<chef_list_view> createState() => _chef_list_viewState();
}

class _chef_list_viewState extends State<chef_list_view> {
  var rating = 5.0;
  var cuisine_name;
  var customised_items;

  @override
  Widget build(BuildContext context) {
    // String cuisine_exp =
    //     widget.cusineexpert.toString().replaceAll('[', '').replaceAll(']', '');
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            // height: 400,
            padding: EdgeInsets.all(5),
            child: InkWell(
              onTap: () async {
                var collection = FirebaseFirestore.instance.collection('chefs');
                var docSnapshot = await collection.doc(widget.uid).get();
                if (docSnapshot.exists) {
                  Map<String, dynamic> data = docSnapshot.data()!;
                  cuisine_name = data['cuisineexpert'];
                  print(cuisine_name);
                }
                List<String> _items = cuisine_name.cast<String>();

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => chef_detail(
                        cid: widget.uid,
                        chefid: widget.chefid,
                        cheflevel: widget.level,
                        experience: widget.experience,
                        cuisine: _items,
                        city: widget.city,
                        profilepic: widget.profilepic,
                        specialities: widget.speciality,
                        rating: widget.rating,
                        chefContact: widget.chefContact,
                        rate: widget.costperday),
                  ),
                );
              },
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Container(
                        constraints: new BoxConstraints.expand(
                            height: 200.0, width: 450),
                        alignment: Alignment.bottomLeft,
                        // padding: new EdgeInsets.only(
                        //     left: 16.0, bottom: 8.0, top: 8.0),
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.16),
                              offset: Offset(0, 3.0),
                              blurRadius: 12.0,
                            ),
                          ],
                          image: new DecorationImage(
                            image: new NetworkImage(widget.profilepic),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Chef Id: ${widget.chefid}',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(top: 2.0),
                          //   child: Row(
                          //     children: <Widget>[
                          //       SmoothStarRating(
                          //         size: 20,
                          //         borderColor: Colors.grey.shade200,
                          //         rating: 1,
                          //         starCount: 1,
                          //         allowHalfRating: false,
                          //         filledIconData: Icons.star,
                          //         onRatingChanged: (value) {
                          //           setState(() {
                          //             rating = value;
                          //           });
                          //         },
                          //         color: Color(0xFFFF4C4C),
                          //       ),
                          //       SizedBox(
                          //         width: 3.0,
                          //       ),
                          //       Text(
                          //         '${widget.rating}',
                          //         style: TextStyle(
                          //           fontWeight: FontWeight.w600,
                          //           fontFamily: 'Montserrat',
                          //           fontSize: 15,
                          //         ),
                          //       ),
                          //       SizedBox(
                          //         width: 3.0,
                          //       ),
                          //       // Text(
                          //       //   '('total no.of ratings')',
                          //       //   style: TextStyle(
                          //       //     fontWeight: FontWeight.w600,
                          //       //     color: Colors.grey,
                          //       //     fontSize: 13,
                          //       //   ),
                          //       // )
                          //     ],
                          //   ),
                          // ),
                          // Text(
                          //   '${cuisine_exp}',
                          //   style: TextStyle(
                          //     fontWeight: FontWeight.normal,
                          //     color: Colors.black,
                          //     fontSize: 13,
                          //   ),
                          // ),
                          Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Experince :' + ' ${widget.experience}',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                  fontSize: 13,
                                ),
                              ),
                              SizedBox(
                                width: 60,
                              ),
                              Text(
                                'City :' + ' ${widget.city}',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '\u20B9${(widget.costperday * 0.25) + widget.costperday} per day ',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class chef_grid_view extends StatefulWidget {
  var chefid;
  List cusineexpert = [];
  var level;
  int experience;
  var speciality;
  var profilepic;
  var rating;
  var city;
  var uid;
  var currentsalary;
  var costperday;
  var chefContact;

  chef_grid_view(
      {required this.chefid,
      required this.cusineexpert,
      required this.level,
      required this.speciality,
      required this.experience,
      required this.profilepic,
      required this.rating,
      required this.city,
      required this.uid,
      required this.currentsalary,
      required this.chefContact,
      required this.costperday});

  @override
  State<chef_grid_view> createState() => _chef_grid_viewState();
}

class _chef_grid_viewState extends State<chef_grid_view> {
  var rating = 5.0;
  var cuisine_name;

  @override
  Widget build(BuildContext context) {
    String cuisine_exp =
        widget.cusineexpert.toString().replaceAll('[', '').replaceAll(']', '');
    return Center(
      child: Column(
        children: [
          Container(
            width: 230,
            padding: EdgeInsets.all(5),
            child: InkWell(
              onTap: () async {
                var collection = FirebaseFirestore.instance.collection('chefs');
                var docSnapshot = await collection.doc(widget.uid).get();
                if (docSnapshot.exists) {
                  Map<String, dynamic> data = docSnapshot.data()!;
                  cuisine_name = data['cuisineexpert'];
                  print(cuisine_name);
                }
                List<String> _items = cuisine_name.cast<String>();

                // var cust_collection =
                //     FirebaseFirestore.instance.collection('Menu');
                // var cust_docSnapshot =
                //     await cust_collection.doc(widget.uid).get();
                // if (docSnapshot.exists) {
                //   Map<String, dynamic> cust_data = cust_docSnapshot.data()!;
                //   customised_items = cust_data['customised menu'];
                //   // print(name);
                // }
                // List<String> _cust_items = customised_items.cast<String>();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => chef_detail(
                      cid: widget.uid,
                      chefid: widget.chefid,
                      cheflevel: widget.level,
                      experience: widget.experience,
                      cuisine: _items,
                      city: widget.city,
                      profilepic: widget.profilepic,
                      specialities: widget.speciality,
                      rating: widget.rating,
                      chefContact: widget.chefContact,
                      rate: widget.costperday,
                    ),
                  ),
                );
              },
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Container(
                        constraints:
                            new BoxConstraints.expand(height: 95.0, width: 300),
                        alignment: Alignment.bottomLeft,
                        padding: new EdgeInsets.only(
                            left: 16.0, bottom: 8.0, top: 8.0),
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.16),
                              offset: Offset(0, 3.0),
                              blurRadius: 12.0,
                            ),
                          ],
                          image: new DecorationImage(
                            image: new NetworkImage(widget.profilepic),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 90,
                      padding: EdgeInsets.all(3),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Chef Id: ${widget.chefid}',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                          Divider(
                            height: 1,
                            thickness: 1,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 2.0, left: 3.0, right: 3.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: [
                                    SmoothStarRating(
                                      size: 15,
                                      borderColor: Colors.grey.shade200,
                                      rating: 1,
                                      starCount: 1,
                                      allowHalfRating: false,
                                      filledIconData: Icons.star,
                                      // onRatingChanged: (value) {
                                      //   setState(() {
                                      //     rating = value;
                                      //   });
                                      // },
                                      color: Color(0xFFFF4C4C),
                                    ),
                                    SizedBox(
                                      width: 3.0,
                                    ),
                                    Text(
                                      '${widget.rating}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),

                                Text(
                                  'Exp :' + ' ${widget.experience}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                    fontSize: 13,
                                  ),
                                ),
                                // Text(
                                //   '('total no.of ratings')',
                                //   style: TextStyle(
                                //     fontWeight: FontWeight.w600,
                                //     color: Colors.grey,
                                //     fontSize: 13,
                                //   ),
                                // )
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // SizedBox(
                              //   width: 60,
                              // ),
                              Text(
                                'City :' + ' ${widget.city}',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                  fontSize: 13,
                                ),
                              ),
                              Text(
                                '\u20B9${widget.costperday} per day ',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.redAccent,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            height: 1,
                            thickness: 1,
                          ),
                          // Text(
                          //   '${cuisine_exp}',
                          //   style: TextStyle(
                          //     fontWeight: FontWeight.normal,
                          //     color: Colors.black,
                          //     fontSize: 10,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
