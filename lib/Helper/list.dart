// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AwesomeListItem extends StatefulWidget {
  var title;
  var content;
  var color;
  var experience;
  var level;
  var city;
  var profilepic;

  AwesomeListItem(
      {required this.title,
      required this.content,
      required this.color,
      required this.level,
      required this.experience,
      required this.profilepic,
      required this.city});

  @override
  _AwesomeListItemState createState() => new _AwesomeListItemState();
}

class _AwesomeListItemState extends State<AwesomeListItem> {
  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(4.0),
      // ignore: deprecated_member_use
      child: RaisedButton(
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => RegisterPage(
          //       name: widget.title,
          //       rollno: widget.content,
          //       college: widget.clg,
          //       phone: widget.phone,
          //       branch: widget.branch,
          //     ),
          //   ),
          // );
        },
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Row(
            children: <Widget>[
              new Container(width: 10.0, height: 190.0, color: widget.color),
              new Expanded(
                child: new Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 40.0, horizontal: 20.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        widget.title.toString(),
                        style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: new Text(
                          widget.content.toString(),
                          style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: new Text(
                          widget.city.toString(),
                          style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: new Text(
                          widget.level.toString(),
                          style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: new Text(
                          widget.experience.toString(),
                          style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              new Container(
                height: 100.0,
                width: 100.0,
                color: Colors.white10,
                child: Stack(
                  children: <Widget>[
                    new Transform.translate(
                      offset: new Offset(5.0, 0.0),
                      child: new Container(
                        height: 100.0,
                        width: 100.0,
                        child: Image(
                          image: NetworkImage('${widget.profilepic}'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class list_view extends StatefulWidget {
  var chefid;
  var cusineexpert;
  var level;
  var experience;
  var speciality;
  var profilepic;

  list_view(
      {required this.chefid,
      required this.cusineexpert,
      required this.level,
      required this.speciality,
      required this.experience,
      required this.profilepic});

  @override
  State<list_view> createState() => _list_viewState();
}

class _list_viewState extends State<list_view> {
  @override
  Widget build(BuildContext context) {
    return Align(
      // padding: const EdgeInsets.all(4.0),
      alignment: Alignment(0.03, -0.77),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            print('onTap Food');
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
                            'ce: ${widget.cusineexpert}',
                            style: GoogleFonts.roboto(
                              fontSize: 15.0,
                              color: const Color(0xFFB6B7B7),
                              height: 1.11,
                            ),
                          ),
                          Text(
                            'lev: ${widget.level}',
                            style: GoogleFonts.roboto(
                              fontSize: 15.0,
                              color: const Color(0xFFB6B7B7),
                              height: 1.11,
                            ),
                          ),
                          Text(
                            'spc: ${widget.speciality}',
                            style: GoogleFonts.roboto(
                              fontSize: 15.0,
                              color: const Color(0xFFB6B7B7),
                              height: 1.11,
                            ),
                          ),
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
    );
  }
}
