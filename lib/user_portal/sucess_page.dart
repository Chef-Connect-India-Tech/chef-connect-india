// ignore_for_file: must_be_immutable

import 'package:chef_connect_india/user_portal/user_bookings.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class Sucess_page extends StatefulWidget {
  String? bookingId;
  String customerId;
  Sucess_page({Key? key, required this.bookingId, required this.customerId})
      : super(key: key);

  @override
  State<Sucess_page> createState() => _Sucess_pageState();
}

class _Sucess_pageState extends State<Sucess_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                LottieBuilder.asset(
                  'assets/success.json',
                ),
                Text(
                  'Booking Sucessful',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 5),
                //   child: TextButton(
                //     onPressed: () {
                //       var a = "+91 73530 64599";
                //       launch("tel: ${a}");
                //     },
                //     child: Text(
                //       'For queries you can contact us',
                //       style: TextStyle(
                //         fontFamily: 'Montserrat',
                //         fontSize: 16,
                //         fontWeight: FontWeight.w600,
                //       ),
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Your Order number:',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '${widget.bookingId}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: TextButton(
                        onPressed: () {
                          var a = "+91 73530 64599";
                          launch("tel: ${a}");
                        },
                        child: Text(
                          'For queries you can contact us',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: SizedBox(
                        height: 45,
                        width: 250,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              color: Colors.green,
                              width: 2,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => user_bookings(
                                          customerId: widget.customerId,
                                        )),
                                (route) => false);
                          },
                          child: Text(
                            'My Bookings',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.green.shade700,
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
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
        ),
      ),
    );
  }
}
