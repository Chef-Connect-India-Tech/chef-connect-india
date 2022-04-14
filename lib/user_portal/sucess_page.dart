import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Sucess_page extends StatefulWidget {
  Sucess_page({Key? key}) : super(key: key);

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
                  'Reservation Completed \n           Sucessfully',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(35.0),
                  child: Text(
                    'Your reservation with a chef was\n     successful. We will process \n      payment after the work is \n                completed.',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 60),
                  child: Row(
                    children: [
                      Text(
                        'Your Order number:',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'KL1350',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, right: 20),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Need Help?',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, top: 10),
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
                      onPressed: () {},
                      child: Text(
                        'My Orders',
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
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
