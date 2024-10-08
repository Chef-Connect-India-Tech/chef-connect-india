import 'package:chef_connect_india/Helper/chef_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:flutter/material.dart';
import 'package:paginate_firestore/widgets/empty_separator.dart';
import 'package:url_launcher/url_launcher.dart';

class view_more extends StatefulWidget {
  String? selectedLocation;
  view_more({
    Key? key,
    required this.selectedLocation,
  }) : super(key: key);

  @override
  State<view_more> createState() => _view_moreState();
}

class _view_moreState extends State<view_more> {
  Future showToast(String message) async {
    await Fluttertoast.cancel();

    Fluttertoast.showToast(msg: message, fontSize: 18);
  }

  final isDialOpen = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        toolbarHeight: 70, // default is 56
        elevation: 50.0,
        centerTitle: true,
        title: Text('Chef Connect India - Chefs'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.filter_list,
              color: Colors.white,
            ),
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => Select_Mode(),
              //   ),
              // );
              showToast(
                'Coming Soon',
              );
            },
          ),
        ],
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
          //           launch("https://www.facebook.com/Chef-Connect");
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
            child: Image(image: AssetImage('assets/socialicons/instagram.png')),
            // backgroundColor: Colors.indigo,
            label: 'Instagram',
            onTap: () {
              launch("https://www.instagram.com/chefconnectindia");
            },
          ),
          SpeedDialChild(
              child: Image(image: AssetImage('assets/socialicons/twitter.png')),
              label: 'Twitter',
              onTap: () {
                launch("https://mobile.twitter.com/chefconnect_");
              }),
        ],
      ),
      body: PaginateFirestore(
        itemBuilderType: PaginateBuilderType.gridView,
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1 / 1.75,
            crossAxisSpacing: 6,
            mainAxisSpacing: 0),
        shrinkWrap: false,
        initialLoader: Center(
          child: CircularProgressIndicator(),
        ),
        bottomLoader: Center(
          // optional
          child: Transform.scale(
            scale: 0.01,
            child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black)),
          ),
        ),
        // onReachedEnd: ,
        separator: EmptySeparator(),
        padding: const EdgeInsets.all(0.0),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, documentSnapshots, index) {
          final dataa = documentSnapshots[index].data() as Map?;
          return SafeArea(
            child: GestureDetector(
              child: chef_list_view(
                chefid: dataa!['chefid'],
                cusineexpert: dataa['cuisineexpert'],
                level: dataa['professionallevel'].toString(),
                speciality: dataa['specialities'].toString(),
                experience: dataa['experience'],
                profilepic: dataa['profilepic'],
                city: dataa['city'].toString(),
                rating: dataa['rating'],
                uid: dataa['uid'].toString(),
                currentsalary: dataa['currentsalary'].toString(),
                costperday: dataa['cheffees'],
                chefContact: dataa['mobile1'],
              ),
            ),
          );
        },
        // itemsPerPage: 15,
        // orderBy is compulsory to enable pagination
        query: FirebaseFirestore.instance
            .collection('chefs')
            .orderBy('firstname')
            .where('verified', isEqualTo: true)
            .where('city', isEqualTo: widget.selectedLocation),
        // .where('dutystatus', isEqualTo: true),
        // to fetch real-time data
        isLive: true,
      ),
    );
  }
}
