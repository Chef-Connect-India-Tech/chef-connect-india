import 'package:chef_connect_india/Helper/chef_list.dart';
import 'package:chef_connect_india/Helper/list.dart';
import 'package:chef_connect_india/user_portal/chef_details/filterpage.dart';
import 'package:chef_connect_india/user_portal/chef_details/searchchef.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:flutter/material.dart';
import 'package:paginate_firestore/widgets/empty_separator.dart';

class view_more extends StatefulWidget {
  const view_more({Key? key}) : super(key: key);

  @override
  State<view_more> createState() => _view_moreState();
}

class _view_moreState extends State<view_more> {
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
      body: PaginateFirestore(
        itemBuilderType: PaginateBuilderType.gridView,
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
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
