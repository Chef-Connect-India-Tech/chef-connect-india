// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class AwesomeListItem extends StatefulWidget {
  var title;
  var content;
  var color;
  var phone;
  var branch;
  var clg;

  AwesomeListItem(
      {required this.title,
      required this.content,
      required this.color,
      required this.branch,
      required this.phone,
      required this.clg});

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
                        widget.title,
                        style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: new Text(
                          widget.branch,
                          style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: new Text(
                          widget.phone,
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
                          image: AssetImage('assets/cci_logo.png'),
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
