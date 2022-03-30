// import 'package:carousel_slider/carousel_slider.dart';
import 'package:chef_connect_india/Drawers/navigation_drawer.dart';
import 'package:chef_connect_india/onboarding_Screen/form_page.dart';
import 'package:chef_connect_india/roles/user/chef_details/View_more.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:chef_connect_india/Helper/list.dart';

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        // shadowColor: Colors.deepPurpleAccent,
        toolbarHeight: 70, // default is 56
        // toolbarOpacity: 0.5,
        elevation: 50.0,
        title: Text('Chef Connect India'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            Container(
              height: 300,
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
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
                                  'assets/Private Chef.png',
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
                                  10,
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
                                  Colors.purple.shade700,
                                  Colors.purple.shade600,
                                ],
                              )),
                          child: InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.white,
                                    content: Column(
                                      children: [
                                        TextFormField(
                                          decoration: InputDecoration(
                                            fillColor: Colors.grey.shade200,
                                            filled: true,
                                            hintText: 'Enter Name',
                                            hintStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        TextFormField(
                                          decoration: InputDecoration(
                                            fillColor: Colors.grey.shade200,
                                            filled: true,
                                            hintText: 'Enter Mail Id',
                                            hintStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        TextFormField(
                                          decoration: InputDecoration(
                                            fillColor: Colors.grey.shade200,
                                            filled: true,
                                            hintText: 'Enter Phone Number',
                                            hintStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        TextFormField(
                                          decoration: InputDecoration(
                                            fillColor: Colors.grey.shade200,
                                            filled: true,
                                            hintText: 'Enter Address',
                                            hintStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        TextFormField(
                                          minLines: 5,
                                          maxLines: 20,
                                          decoration: InputDecoration(
                                            fillColor: Colors.grey.shade200,
                                            filled: true,
                                            hintText: 'Enter Description',
                                            hintStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 40,
                                          ),
                                          ElevatedButton(
                                            onPressed: () {},
                                            child: Text(
                                              'Cancel',
                                            ),
                                          ),
                                          SizedBox(
                                            width: 50,
                                          ),
                                          ElevatedButton(
                                            onPressed: () {},
                                            child: Text(
                                              'Submit',
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/Private Chef.png',
                                  fit: BoxFit.cover,
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
                                  10,
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
                                  Colors.purple.shade700,
                                  Colors.purple.shade600,
                                ],
                              )),
                          child: InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.white,
                                    content: Column(
                                      children: [
                                        TextFormField(
                                          decoration: InputDecoration(
                                            fillColor: Colors.grey.shade200,
                                            filled: true,
                                            hintText: 'Enter Name',
                                            hintStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        TextFormField(
                                          decoration: InputDecoration(
                                            fillColor: Colors.grey.shade200,
                                            filled: true,
                                            hintText: 'Enter Mail Id',
                                            hintStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        TextFormField(
                                          decoration: InputDecoration(
                                            fillColor: Colors.grey.shade200,
                                            filled: true,
                                            hintText: 'Enter Phone Number',
                                            hintStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        TextFormField(
                                          decoration: InputDecoration(
                                            fillColor: Colors.grey.shade200,
                                            filled: true,
                                            hintText: 'Enter Address',
                                            hintStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        TextFormField(
                                          minLines: 5,
                                          maxLines: 20,
                                          decoration: InputDecoration(
                                            fillColor: Colors.grey.shade200,
                                            filled: true,
                                            hintText: 'Enter Description',
                                            hintStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 40,
                                          ),
                                          ElevatedButton(
                                            onPressed: () {},
                                            child: Text(
                                              'Cancel',
                                            ),
                                          ),
                                          SizedBox(
                                            width: 50,
                                          ),
                                          ElevatedButton(
                                            onPressed: () {},
                                            child: Text(
                                              'Submit',
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/Permanent Chef.png',
                                  fit: BoxFit.fill,
                                ),
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
            // AspectRatio(
            //   aspectRatio: 16 / 9,
            //   child: CarouselSlider(
            //       items: _carouselImages
            //           .map((item) => Padding(
            //                 padding: const EdgeInsets.only(left: 3, right: 3),
            //                 child: InkWell(
            //                   onTap: () {},
            //                   child: Container(
            //                     decoration: BoxDecoration(
            //                         borderRadius: BorderRadius.circular(12),
            //                         image: DecorationImage(
            //                             image: NetworkImage(item),
            //                             fit: BoxFit.fitWidth)),
            //                   ),
            //                 ),
            //               ))
            //           .toList(),
            //       options: CarouselOptions(
            //           enableInfiniteScroll: true,
            //           reverse: false,
            //           autoPlay: true,
            //           enlargeCenterPage: true,
            //           viewportFraction: 0.8,
            //           autoPlayInterval: Duration(seconds: 5),
            //           autoPlayAnimationDuration: Duration(milliseconds: 800),
            //           autoPlayCurve: Curves.fastOutSlowIn,
            //           enlargeStrategy: CenterPageEnlargeStrategy.height,
            //           onPageChanged: (val, carouselPageChangedReason) {
            //             setState(() {
            //               _dotPosition = val;
            //             });
            //           })),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // DotsIndicator(
            //   dotsCount:
            //       _carouselImages.length == 0 ? 1 : _carouselImages.length,
            //   position: _dotPosition.toDouble(),
            //   decorator: DotsDecorator(
            //     activeColor: Colors.red,
            //     color: Colors.orangeAccent,
            //     spacing: EdgeInsets.all(2),
            //     activeSize: Size(8, 8),
            //     size: Size(6, 6),
            //   ),
            // ),
            SizedBox(
              height: 20,
            ),
            Row(children: [
              Text(
                " Top Chefs",
                style: TextStyle(
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
              )
            ]),
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
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    print(document.data());
                    // return new AwesomeListItem(
                    //   title: document['chefid'].toString(),
                    //   content: document['cuisineexpert'].toString(),
                    //   city: document['city'].toString(),
                    //   level: document['professionallevel'].toString(),
                    //   experience: document['experience'].toString(),
                    //   profilepic: document['profilepic'],
                    //   color: Color(0xFFEF7A85),
                    // );
                    return new list_view(
                        chefid: document['chefid'],
                        cusineexpert: document['cuisineexpert'].toString(),
                        level: document['professionallevel'].toString(),
                        speciality: document['specialities'].toString(),
                        experience: document['experience'].toString(),
                        profilepic: document['profilepic']);
                  }).toList(),
                );
              },
            ),
          ]),
        )),
      ),
    );
  }
}
