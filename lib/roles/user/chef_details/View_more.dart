import 'package:chef_connect_india/Helper/list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:flutter/material.dart';

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
        title: Text('Chef Connect India'),
      ),
      body: PaginateFirestore(
        itemBuilderType: PaginateBuilderType.listView,
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.all(0.0),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, documentSnapshots, index) {
          final dataa = documentSnapshots[index].data() as Map?;
          return GestureDetector(
            //  onTap: ()=> Navigator.push(context,
            //            MaterialPageRoute(builder: (_)=> Chef_profile_ui(
            //              name:  data!['firstname']),
            //            )),
            child: list_view(
              chefid: dataa!['chefid'],
              cusineexpert: dataa['cuisineexpert'].toString(),
              level: dataa['professionallevel'].toString(),
              speciality: dataa['specialities'].toString(),
              experience: dataa['experience'].toString(),
              profilepic: dataa['profilepic'],
              city: dataa['city'],
              rating: dataa['rating'],
            ),
            // ListTile(

            //   leading: const CircleAvatar(child: Icon(Icons.person)),
            //   title:
            //       dataa == null ? const Text('Error in data') : Text(dataa['firstname']),
            //   subtitle: Text(documentSnapshots[index].id),
            // ),
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
