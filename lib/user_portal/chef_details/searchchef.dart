import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:paginate_firestore/paginate_firestore.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    super.initState();
  }

  String city = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Card(
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search), hintText: 'Search...'),
            onChanged: (val) {
              setState(() {
                city = val;
              });
            },
          ),
        ),
      ),
      body: PaginateFirestore(
        itemBuilderType: PaginateBuilderType.listView,
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.all(0.0),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, documentSnapshots, index) {
          //a = documentSnapshots[index].id;
          final dataa = documentSnapshots[index].data() as Map?;
          return GestureDetector(
            onTap: () => {},
            // child: listcustomised(
            //   dishes: dataa!['customised menu'],
            //   customisedmenu: widget.items,
            //   //cid: dataa['cid'],
            // ),
            child: ListTile(
              leading: const CircleAvatar(child: Icon(Icons.person)),
              title: dataa == null
                  ? const Text('Error in data')
                  : Text(dataa['city'].toString()),
              subtitle: Text(documentSnapshots[index].id),
            ),
          );
        },

        // orderBy is compulsory to enable pagination
        query: FirebaseFirestore.instance.collection('chefs').where(
              "city",
              isEqualTo: "Jaipur",
            ),
        //  .where("cid", isEqualTo: widget.cid),
        // .doc(widget.cid)
        // .collection('customised menu'),
        // to fetch real-time datar
        isLive: true,
      ),
      // body: StreamBuilder<QuerySnapshot>(
      //   stream: (name != "" && name != null)
      //       ? FirebaseFirestore.instance
      //           .collection('Chefs')
      //           .where("searchkeys", arrayContains: name)
      //           .snapshots()
      //       : FirebaseFirestore.instance.collection("Chefs").snapshots(),
      //   builder: (context, snapshot) {
      //     return (snapshot.connectionState == ConnectionState.waiting)
      //         ? Center(child: CircularProgressIndicator())
      //         : GridView.builder(
      //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //              crossAxisCount: 1,
      //             mainAxisSpacing: 5,
      //             crossAxisSpacing: 15,
      //             childAspectRatio:5,
      //           ),

      //             itemCount: snapshot.data!.docs.length,
      //             itemBuilder: (context, index) {
      //               DocumentSnapshot data = snapshot.data!.docs[index];
      //               return GestureDetector(
      //                 onTap: ()=>Navigator.push(context,
      //                 MaterialPageRoute(builder: (_)=> Chef_profile_ui(chefs[index]),
      //                  )),
      //                 child: Card(
      //                   child: Row(
      //                     children: <Widget>[
      //                       Image.network(
      //                         data['image'],
      //                         width: 150,
      //                         height: 100,
      //                         fit: BoxFit.fill,
      //                       ),
      //                       SizedBox(
      //                         width: 25,
      //                       ),
      //                       Text(
      //                         data['name'],
      //                         style: TextStyle(
      //                           fontWeight: FontWeight.w700,
      //                           fontSize: 20,
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               );
      //             },
      //           );
      //   },
      // ),
    );
  }
}
// import 'package:cloud_firestore/cloud_firestore.dart';
// class SearchPage extends StatefulWidget {
//   const SearchPage({ Key? key }) : super(key: key);

//   @override
//   _SearchPageState createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   var queryResultSet = [];
//   var tempSearchStore = [];

//   initiateSearch(value) {
//     if (value.length == 0) {
//       setState(() {
//         queryResultSet = [];
//         tempSearchStore = [];
//       });
//     }

//     var capitalizedValue =
//         value.substring(0, 1).toUpperCase() + value.substring(1);

//     if (queryResultSet.length == 0 && value.length == 1) {
//       SearchService().searchByName(value).then((QuerySnapshot docs) {
//         for (int i = 0; i < docs.docs.length; ++i) {
//           queryResultSet.add(docs.docs[i].data);
//         }
//       });
//     } else {
//       tempSearchStore = [];
//       queryResultSet.forEach((element) {
//         if (element['name'].startsWith(capitalizedValue)) {
//           setState(() {
//             tempSearchStore.add(element);
//           });
//         }
//       });
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           // The search area here
//           title: Container(
//         width: double.infinity,
//         height: 40,
//         decoration: BoxDecoration(
//             color: Colors.white, borderRadius: BorderRadius.circular(5)),
//         child: Center(
//           child: TextField(
//             onChanged: (val) {
//                 initiateSearch(val);
//               },
//               decoration: InputDecoration(
//                   prefixIcon: IconButton(
//                     color: Colors.black,
//                     icon: Icon(Icons.arrow_back),
//                     iconSize: 20.0,
//                     onPressed: () {
//                      // Navigator.of(context).pop();
//                     },
//                   ),
//                   contentPadding: EdgeInsets.only(left: 25.0),
//                   hintText: 'Search...',
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(4.0))),
//             ),
//           ),

//             // decoration: InputDecoration(
//             //     prefixIcon: Icon(Icons.search),

//             //     suffixIcon: IconButton(
//             //       icon: Icon(Icons.clear),
//             //       onPressed: () {
//             //         /* Clear the search field */
//             //       },
//             //     ),
//             //     hintText: 'Search...',
//             //     border: InputBorder.none),
//           ),

//         ),
//         body: ListView(children: <Widget>[
//           GridView.count(
//               padding: EdgeInsets.only(left: 10.0, right: 10.0),
//               crossAxisCount: 2,
//               crossAxisSpacing: 4.0,
//               mainAxisSpacing: 4.0,
//               primary: false,
//               shrinkWrap: true,
//               children: tempSearchStore.map((element) {
//                 return buildResultCard(element);
//               }).toList())
//         ]
//       ));
//   }
// }
// Widget buildResultCard(data) {
//   return Card(
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
//     elevation: 2.0,
//     child: Container(
//       child: Center(
//         child: Text(data['name'],
//         textAlign: TextAlign.center,
//         style: TextStyle(
//           color: Colors.black,
//           fontSize: 20.0,
//         ),
//         )
//       )
//     )
//   );
// }
// class SearchService {
//   searchByName(String searchField) {
//     return FirebaseFirestore.instance
//         .collection('Chefs')
//         .where('name',
//             isEqualTo: searchField.substring(0, 1).toUpperCase())
//         .get();
//   }
// }
