// ignore_for_file: must_be_immutable

import 'package:chef_connect_india/user_portal/chef_details/chef_detail.dart';
import 'package:chef_connect_india/user_portal/chef_details/chef_details.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';

class chef_list_view extends StatefulWidget {
  var chefid;
  var cusineexpert;
  var level;
  var experience;
  var speciality;
  var profilepic;
  var rating;
  var city;
  var uid;
  var currentsalary;
  var costperday;

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
      required this.costperday});

  @override
  State<chef_list_view> createState() => _chef_list_viewState();
}

class _chef_list_viewState extends State<chef_list_view> {
  var rating = 5.0;

  @override
  Widget build(BuildContext context) {
    String cuisine_exp =
        widget.cusineexpert.replaceAll('[', '').replaceAll(']', '');
    return Center(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => chef_detail(
                      cid: widget.uid,
                      chefid: widget.chefid,
                      cheflevel: widget.level,
                      experience: widget.experience,
                      cuisine: widget.cusineexpert,
                      city: widget.city,
                      profilepic: widget.profilepic,
                      specialities: widget.speciality,
                      rating: widget.rating,
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
                        constraints: new BoxConstraints.expand(
                            height: 200.0, width: 450),
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 5.0,
                                ),
                              ],
                            ),
                          ],
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
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 2.0),
                            child: Row(
                              children: <Widget>[
                                SmoothStarRating(
                                  borderColor: Colors.grey.shade200,
                                  rating: widget.rating,
                                  starCount: 5,
                                  allowHalfRating: false,
                                  filledIconData: Icons.star,
                                  onRatingChanged: (value) {
                                    setState(() {
                                      rating = value;
                                    });
                                  },
                                  color: Color(0xFFFF4C4C),
                                ),
                                SizedBox(
                                  width: 3.0,
                                ),
                                Text(
                                  '${widget.rating}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  width: 3.0,
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
                          Text(
                            '${cuisine_exp}',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                              fontSize: 13,
                            ),
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Experince :' + ' ${widget.experience}',
                                style: TextStyle(
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
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '\u20B9${widget.costperday} per day ',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.grey,
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
