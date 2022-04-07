import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:paginate_firestore/paginate_firestore.dart';

class customiseduser extends StatefulWidget {
  const customiseduser({Key? key}) : super(key: key);

  @override
  State<customiseduser> createState() => _customiseduserState();
}

class _customiseduserState extends State<customiseduser> {
  @override
  Widget build(BuildContext context) {
    return PaginateFirestore(
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
            // child: list_view(
            //   chefid: dataa!['chefid'],
            //   cusineexpert: dataa['cuisineexpert'].toString(),
            //   level: dataa['professionallevel'].toString(),
            //   speciality: dataa['specialities'].toString(),
            //   experience: dataa['experience'].toString(),
            //   profilepic: dataa['profilepic'],
            //   city: dataa['city'].toString(),
            //   rating: dataa['rating'].toString(),
            //   uid: dataa['uid'].toString(),
            // ),
            // ListTile(

            //   leading: const CircleAvatar(child: Icon(Icons.person)),
            //   title:
            //       dataa == null ? const Text('Error in data') : Text(dataa['firstname']),
            //   subtitle: Text(documentSnapshots[index].id),
            // ),
            );
      },
      // orderBy is compulsory to enable pagination
      query: FirebaseFirestore.instance.collection('Menu').orderBy('firstname'),
      // to fetch real-time data
      isLive: true,
    );
  }
}
