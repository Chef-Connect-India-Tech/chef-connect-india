import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class chef_registration_two extends StatefulWidget {
  final String firstname;
  final String lastname;
  final String phonenumber;
  final String workexperience;
  final String worklocation;
  final String worktype;
  chef_registration_two(
      {required this.firstname,
      required this.lastname,
      required this.phonenumber,
      required this.workexperience,
      required this.worklocation,
      required this.worktype});

  @override
  State<chef_registration_two> createState() => _chef_registration_twoState();
}

class _chef_registration_twoState extends State<chef_registration_two> {
  final formGlobalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Image.asset(
              "assets/CCI.jpg",
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              scale: 1,
            ),
            SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 80),
                  child: Center(
                    child: GlassmorphicContainer(
                      width: 330,
                      height: 750,
                      borderRadius: 10,
                      blur: 0.1,
                      alignment: Alignment.bottomCenter,
                      border: 0,
                      linearGradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFFffffff).withOpacity(0.5),
                            Color(0xFFFFFFFF).withOpacity(0.5),
                          ],
                          stops: [
                            0.1,
                            1,
                          ]),
                      borderGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFFffffff).withOpacity(1.0),
                          Color((0xFFFFFFFF)).withOpacity(1.0),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Form(
                          key: formGlobalKey,
                          child: Column(children: [
                            // Text(widget.firstname),
                            // Text(widget.lastname),
                            // Text(widget.phonenumber),
                            // Text(widget.workexperience),
                            // Text(widget.worklocation),
                            // Text(widget.worktype)
                          ]),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
