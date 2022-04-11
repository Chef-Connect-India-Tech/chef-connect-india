import 'package:chef_connect_india/Helper/rating.dart';
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

  chef_list_view({
    required this.chefid,
    required this.cusineexpert,
    required this.level,
    required this.speciality,
    required this.experience,
    required this.profilepic,
    required this.rating,
    required this.city,
    required this.uid,
    required this.currentsalary,
  });

  @override
  State<chef_list_view> createState() => _chef_list_viewState();
}

class _chef_list_viewState extends State<chef_list_view> {
  var rating = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      // side: BorderSide(
                      //   color: AppColors.separatorGrey,
                      // ),
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
                                image: new NetworkImage(
                                    'https://www.eastcoastdaily.in/wp-content/uploads/2018/05/veg-paratha-1.png'),
                                fit: BoxFit.fill,
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
                                'Spicy Platter',
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
                                      rating: 3.5,
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
                                      '3.5',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 3.0,
                                    ),
                                    Text(
                                      '(5548 Delivery Reviews)',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey,
                                        fontSize: 13,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Text(
                                'North Indian, Chinese, Fast Food, Mughlai',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                  fontSize: 13,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Experince :' + ' 25',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                      fontSize: 13,
                                    ),
                                  ),
                                  Text(
                                    'City :' + ' Mg Road, Bangalore',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '\u20B9200 per person ' +
                                    String.fromCharCode(0x00B7) +
                                    ' 44 mins',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Divider(color: Color(0xFFF2F2F2)),
                        // SizedBox(
                        //   height: 1,
                        // )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
