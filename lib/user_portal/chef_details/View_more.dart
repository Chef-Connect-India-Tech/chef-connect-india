import 'package:chef_connect_india/Helper/chef_list.dart';
import 'package:chef_connect_india/Helper/list.dart';
import 'package:chef_connect_india/user_portal/chef_details/filterpage.dart';
import 'package:chef_connect_india/user_portal/chef_details/searchchef.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:flutter/material.dart';
import 'package:paginate_firestore/widgets/empty_separator.dart';

class view_more extends StatefulWidget {
  const view_more({Key? key}) : super(key: key);

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
        // shadowColor: Colors.deepPurpleAccent,
        toolbarHeight: 70, // default is 56
        // toolbarOpacity: 0.5,
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Select_Mode(),
                ),
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
        closeManually: true,
        openCloseDial: isDialOpen,
        children: [
          SpeedDialChild(
            child: Image(
              image: AssetImage('assets/socialicons/gmail.png'),
              height: 35,
            ),
            backgroundColor: Colors.transparent,
            label: 'Mail',
            onTap: () => showToast(
              'Selected Mail..',
            ),
          ),
          SpeedDialChild(
            child: Image(image: AssetImage('assets/socialicons/facebook.png')),
            // backgroundColor: Colors.blue,
            label: 'Facebook',
            onTap: () => showToast(
              'Selected facebook..',
            ),
          ),
          SpeedDialChild(
            child: Image(image: AssetImage('assets/socialicons/whatsapp.png')),
            // backgroundColor: Colors.indigo,
            label: 'Whatsapp',
            onTap: () => showToast(
              'Selected whatsapp..',
            ),
          ),
          SpeedDialChild(
            child: Image(image: AssetImage('assets/socialicons/instagram.png')),
            // backgroundColor: Colors.indigo,
            label: 'Instagram',
            onTap: () => showToast('Selected Instagram..'),
          ),
          SpeedDialChild(
            child: Image(image: AssetImage('assets/socialicons/twitter.png')),
            label: 'Twitter',
            onTap: () => showToast('Selected Twitter..'),
          ),
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
        // orderBy is compulsory to enable pagination
        query:
            FirebaseFirestore.instance.collection('chefs').orderBy('firstname'),
        // to fetch real-time data
        isLive: true,
      ),
    );
  }
}
