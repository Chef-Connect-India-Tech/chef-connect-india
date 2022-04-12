import 'package:flutter/material.dart';

class chef_detail extends StatefulWidget {
  var chefid;
  var cheflevel;
  int experience;
  var cuisine;
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
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: Text(widget.chefid),
      ),
      body: SafeArea(
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
                                  // child: CircleAvatar(
                                  //     backgroundColor: Colors.grey.shade300,
                                  //     radius: 18.0,
                                  //     child: IconButton(
                                  //         onPressed: () {},
                                  //         icon: Icon(
                                  //           Icons.camera_alt,
                                  //           size: 18,
                                  //           color: Colors.black,
                                  //         ))),
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
                                child: Text(
                                  '${widget.city}',
                                  style: TextStyle(
                                    fontFamily: 'SF Pro',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Center(
                                  child: Container(
                                    padding: EdgeInsets.only(top: 16),
                                    child: Text(
                                      '${widget.cheflevel}',
                                      style: TextStyle(
                                        fontFamily: 'SF Pro',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    padding: EdgeInsets.only(top: 16),
                                    child: Text(
                                      '${widget.rating}',
                                      style: TextStyle(
                                        fontFamily: 'SF Pro',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 20.0,
                                      ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
