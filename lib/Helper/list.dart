// ignore_for_file: must_be_immutable, unused_local_variable

import 'package:chef_connect_india/user_portal/chef_details/chef_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

// class AwesomeListItem extends StatefulWidget {
//   var title;
//   var content;
//   var color;
//   var experience;
//   var level;
//   var city;
//   var profilepic;

//   AwesomeListItem(
//       {required this.title,
//       required this.content,
//       required this.color,
//       required this.level,
//       required this.experience,
//       required this.profilepic,
//       required this.city});

//   @override
//   _AwesomeListItemState createState() => new _AwesomeListItemState();
// }

// class _AwesomeListItemState extends State<AwesomeListItem> {
//   @override
//   Widget build(BuildContext context) {
//     return new Padding(
//       padding: const EdgeInsets.all(4.0),
//       // ignore: deprecated_member_use
//       child: RaisedButton(
//         onPressed: () {
//           // Navigator.push(
//           //   context,
//           //   MaterialPageRoute(
//           //     builder: (context) => RegisterPage(
//           //       name: widget.title,
//           //       rollno: widget.content,
//           //       college: widget.clg,
//           //       phone: widget.phone,
//           //       branch: widget.branch,
//           //     ),
//           //   ),
//           // );
//         },
//         child: Padding(
//           padding: const EdgeInsets.all(0.0),
//           child: Row(
//             children: <Widget>[
//               new Container(width: 10.0, height: 190.0, color: widget.color),
//               new Expanded(
//                 child: new Padding(
//                   padding: const EdgeInsets.symmetric(
//                       vertical: 40.0, horizontal: 20.0),
//                   child: new Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       new Text(
//                         widget.title.toString(),
//                         style: TextStyle(
//                             color: Colors.grey.shade800,
//                             fontSize: 18.0,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       new Padding(
//                         padding: const EdgeInsets.only(top: 16.0),
//                         child: new Text(
//                           widget.content.toString(),
//                           style: TextStyle(
//                               color: Colors.grey.shade500,
//                               fontSize: 12.0,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                       new Padding(
//                         padding: const EdgeInsets.only(top: 16.0),
//                         child: new Text(
//                           widget.city.toString(),
//                           style: TextStyle(
//                               color: Colors.grey.shade500,
//                               fontSize: 12.0,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                       new Padding(
//                         padding: const EdgeInsets.only(top: 16.0),
//                         child: new Text(
//                           widget.level.toString(),
//                           style: TextStyle(
//                               color: Colors.grey.shade500,
//                               fontSize: 12.0,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                       new Padding(
//                         padding: const EdgeInsets.only(top: 16.0),
//                         child: new Text(
//                           widget.experience.toString(),
//                           style: TextStyle(
//                               color: Colors.grey.shade500,
//                               fontSize: 12.0,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               new Container(
//                 height: 100.0,
//                 width: 100.0,
//                 color: Colors.white10,
//                 child: Stack(
//                   children: <Widget>[
//                     new Transform.translate(
//                       offset: new Offset(5.0, 0.0),
//                       child: new Container(
//                         height: 100.0,
//                         width: 100.0,
//                         child: Image(
//                           image: NetworkImage('${widget.profilepic}'),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class list_view extends StatefulWidget {
  var chefid;
  var cusineexpert;
  var level;
  int experience;
  var speciality;
  var profilepic;
  var rating;
  var city;
  var uid;
  var currentsalary;

  list_view({
    required this.chefid,
    required this.cusineexpert,
    required this.level,
    required this.speciality,
    required this.experience,
    required this.profilepic,
    required this.rating,
    required this.city,
    required this.uid,
    required this.currentsalary,
  });

  @override
  State<list_view> createState() => _list_viewState();
}

class _list_viewState extends State<list_view> {
  @override
  Widget build(BuildContext context) {
    String cuisine_exp =
        widget.cusineexpert.replaceAll(new RegExp(r"\p{P}", unicode: true), "");
    return Align(
      // padding: const EdgeInsets.all(4.0),
      alignment: Alignment(0.03, -0.77),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Expanded(
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => chef_pro(
                    cid: widget.uid,
                    chefid: widget.chefid,
                    cheflevel: widget.level,
                    experience: widget.experience,
                    cuisine: widget.cusineexpert,
                    city: widget.city,
                    profilepic: widget.profilepic,
                    specialities: widget.speciality,
                    rating: widget.rating,
                  ),
                ),
              );
              //print('onTap Food');
            },
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
                              'id: ${widget.chefid}',
                              style: GoogleFonts.roboto(
                                fontSize: 20.0,
                                color: const Color(0xFF4A4B4D),
                                fontWeight: FontWeight.w700,
                              ),
                            ),

                            Text(
                              'ce: ${cuisine_exp}',
                              style: GoogleFonts.roboto(
                                fontSize: 15.0,
                                color: const Color(0xFFB6B7B7),
                                height: 1.11,
                              ),
                            ),
                            Divider(
                              height: 1,
                              thickness: 0.5,
                            ),
                            Text(
                              'Expected Sal: ${widget.currentsalary}',
                              style: GoogleFonts.roboto(
                                fontSize: 15.0,
                                color: const Color(0xFFB6B7B7),
                                height: 1.11,
                              ),
                            ),
                            Divider(
                              height: 1,
                              thickness: 0.5,
                            ),
                            // Text(
                            //   'spc: ${widget.speciality}',
                            //   style: GoogleFonts.roboto(
                            //     fontSize: 15.0,
                            //     color: const Color(0xFFB6B7B7),
                            //     height: 1.11,
                            //   ),
                            // ),
                            Text(
                              'exp: ${widget.experience}',
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
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.16),
                            offset: Offset(0, 3.0),
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: SvgPicture.string(
                        // Group 6835
                        '<svg viewBox="0.0 0.0 5.69 11.38" ><path  d="M 0 0 L 5.691650390625 5.691650390625" fill="none" stroke="#fc6011" stroke-width="2" stroke-miterlimit="4" stroke-linecap="round" /><path transform="translate(0.0, 5.69)" d="M 5.691650390625 0 L 0 5.691650390625" fill="none" stroke="#fc6011" stroke-width="2" stroke-miterlimit="4" stroke-linecap="round" /></svg>',
                        width: 5.69,
                        height: 11.38,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 21.0,
                    child: Container(
                      width: 110.0,
                      height: 115.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 3.0,
                          color: Colors.indigoAccent,
                        ),
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(55.0, 57.5)),
                        image: DecorationImage(
                          image: NetworkImage(widget.profilepic),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class booking_list_view extends StatefulWidget {
  var chefid;
  var customerId;
  var bookingId;
  var location;
  var date;
  var time;
  var cost;
  var status;
  var bookingSlot;
  var numberOfPlates;
  var address;

  booking_list_view({
    required this.chefid,
    required this.customerId,
    required this.bookingId,
    required this.location,
    required this.date,
    required this.time,
    required this.cost,
    required this.status,
    required this.bookingSlot,
    required this.numberOfPlates,
    required this.address,
  });

  @override
  State<booking_list_view> createState() => _booking_list_viewState();
}

class _booking_list_viewState extends State<booking_list_view> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: Colors.white.withOpacity(.4),
                  child: Container(
                    width: 300,
                    height: 160,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "${widget.bookingId}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),

                          Container(
                            child: Column(children: [
                              Text(
                                "${widget.status}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "${widget.location}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "${widget.cost}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ]),
                          ),

                          // SizedBox(
                          //   height: 40,
                          // ),
                          //Spacer(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Positioned(
                  top: 100,
                  right: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      //shadowColor: Colors.white38,
                      primary: Colors.white,
                      elevation: 10,
                      padding: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {},
                    child: Container(
                      width: 120,
                      child: Center(
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 100,
                  right: 100,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      //shadowColor: Colors.white38,
                      primary: Colors.white,
                      elevation: 10,
                      padding: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      // _signIn();
                    },
                    child: Container(
                      width: 100,
                      child: Center(
                        child: Text(
                          "Accept",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
