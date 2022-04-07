import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paginate_firestore/paginate_firestore.dart';

class customiseduser extends StatefulWidget {
  late String cid;
  customiseduser({required this.cid});
  @override
  State<customiseduser> createState() => _customiseduserState();
}

class _customiseduserState extends State<customiseduser> {
  @override
  var a = 'a';
  Widget build(BuildContext context) {
    return PaginateFirestore(
      itemBuilderType: PaginateBuilderType.listView,
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.all(0.0),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, documentSnapshots, index) {
        a = documentSnapshots[index].id;
        final dataa = documentSnapshots[index].data() as Map?;
        return GestureDetector(
          //onTap: () => {print(widget.cid), print(dataa!['cid'])},
          child: listcustomised(
            dishes: dataa!['customised menu'],
            //cid: dataa['cid'],
          ),
          // child: ListTile(
          //   leading: const CircleAvatar(child: Icon(Icons.person)),
          //   title: dataa == null
          //       ? const Text('Error in data')
          //       : Text(dataa['customised menu'].toString()),
          //   subtitle: Text(documentSnapshots[index].id),
          // ),
        );
      },

      // orderBy is compulsory to enable pagination
      query: FirebaseFirestore.instance
          .collection('Menu')
          .where("cid", isEqualTo: widget.cid),
      // .doc(widget.cid)
      // .collection('customised menu'),
      // to fetch real-time datar
      isLive: true,
    );
  }
}

class listcustomised extends StatefulWidget {
  late List dishes;
  // late List cid;
  listcustomised({
    required this.dishes,
    // required this.cid,
  });

  @override
  State<listcustomised> createState() => _listcustomisedState();
}

class _listcustomisedState extends State<listcustomised> {
  @override
  Widget build(BuildContext context) {
    return Align(
      // padding: const EdgeInsets.all(4.0),
      alignment: Alignment(0.03, -0.77),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {},
          child: SizedBox(
            width: 360.0,
            height: 158.0,
            child: Stack(
              children: <Widget>[
                Positioned(
                  right: 10.0,
                  child: Container(
                    alignment: Alignment(0.2, 0.0),
                    width: 320.0,
                    height: 158.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(30.0),
                        right: Radius.circular(10.0),
                      ),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.16),
                          offset: Offset(0, 3.0),
                          blurRadius: 12.0,
                        ),
                      ],
                    ),
                    child: SizedBox(
                      width: 150.0,
                      height: 142.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Dishes's:",
                            style: GoogleFonts.roboto(
                              fontSize: 20.0,
                              color: const Color(0xFF4A4B4D),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            '${widget.dishes}',
                            style: GoogleFonts.roboto(
                              fontSize: 15.0,
                              color: const Color(0xFFB6B7B7),
                              height: 1.11,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 61.0,
                  child: Container(
                    alignment: Alignment(0.04, -0.04),
                    width: 33.0,
                    height: 33.0,
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
