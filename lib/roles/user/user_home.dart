import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:glass_morphism/Helper/list.dart';

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
      body: SafeArea(
          child: Container(
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: CarouselSlider(
                items: _carouselImages
                    .map((item) => Padding(
                          padding: const EdgeInsets.only(left: 3, right: 3),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                    image: NetworkImage(item),
                                    fit: BoxFit.fitWidth)),
                          ),
                        ))
                    .toList(),
                options: CarouselOptions(
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 0.8,
                    autoPlayInterval: Duration(seconds: 5),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    onPageChanged: (val, carouselPageChangedReason) {
                      setState(() {
                        _dotPosition = val;
                      });
                    })),
          ),
          SizedBox(
            height: 10,
          ),
          DotsIndicator(
            dotsCount: _carouselImages.length == 0 ? 1 : _carouselImages.length,
            position: _dotPosition.toDouble(),
            decorator: DotsDecorator(
              activeColor: Colors.red,
              color: Colors.orangeAccent,
              spacing: EdgeInsets.all(2),
              activeSize: Size(8, 8),
              size: Size(6, 6),
            ),
          ),
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
                // print('Pressed');
              },
            )
          ]),
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("chefs")
                .where('dutystatus', isEqualTo: true)
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
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
    );
  }
}
