import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paginate_firestore/paginate_firestore.dart';

class predefineduser extends StatefulWidget {
  late String cid;
  predefineduser({required this.cid});
  @override
  State<predefineduser> createState() => _predefineduserState();
}

class _predefineduserState extends State<predefineduser> {
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
          child: listpredefined(
            desserts: dataa!['desserts'],
            maincourse: dataa['main course'],
            starters: dataa['starters'],
            menuname: dataa['menu name'],
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
      query: FirebaseFirestore.instance
          .collection('Menu')
          .doc(widget.cid)
          .collection('menu'),
      // to fetch real-time data
      isLive: true,
    );
  }
}

class listpredefined extends StatefulWidget {
  late List starters;
  late List maincourse;
  late List desserts;
  late String menuname;
  listpredefined({
    required this.starters,
    required this.maincourse,
    required this.desserts,
    required this.menuname,
  });

  @override
  State<listpredefined> createState() => _listpredefinedState();
}

class _listpredefinedState extends State<listpredefined> {
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
                            "${widget.menuname}'s menu",
                            style: GoogleFonts.roboto(
                              fontSize: 20.0,
                              color: const Color(0xFF4A4B4D),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'starters: ${widget.starters}',
                            style: GoogleFonts.roboto(
                              fontSize: 15.0,
                              color: const Color(0xFFB6B7B7),
                              height: 1.11,
                            ),
                          ),
                          Text(
                            'maincourse: ${widget.maincourse}',
                            style: GoogleFonts.roboto(
                              fontSize: 15.0,
                              color: const Color(0xFFB6B7B7),
                              height: 1.11,
                            ),
                          ),
                          Text(
                            'desserts: ${widget.desserts}',
                            style: GoogleFonts.roboto(
                              fontSize: 15.0,
                              color: const Color(0xFFB6B7B7),
                              height: 1.11,
                            ),
                          ),
                          // Text(
                          //   'spc: ${widget.speciality}',
                          //   style: GoogleFonts.roboto(
                          //     fontSize: 15.0,
                          //     color: const Color(0xFFB6B7B7),
                          //     height: 1.11,
                          //   ),
                          // ),
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
