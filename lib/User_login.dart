import 'package:flutter/material.dart';
import 'package:glass_morphism/Registration_user.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class USer_login extends StatefulWidget {
  USer_login({Key? key}) : super(key: key);

  @override
  State<USer_login> createState() => _USer_loginState();
}

class _USer_loginState extends State<USer_login> {
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
                      height: 620,
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
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          CircleAvatar(
                            backgroundColor: Color(0xFF092349),
                            radius: 80,
                            child: Image.asset('assets/CCI1.png'),
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                fillColor: Colors.white60,
                                hintText: 'Phone Number',
                                hintStyle: TextStyle(
                                    color: Colors.black, fontSize: 15),
                                filled: true,
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 14, horizontal: 15),
                                  child: Text(
                                    " (+91) ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                suffixIcon: InkWell(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 15),
                                    child: Text(
                                      'Send OTP',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 18, 68, 138),
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                ),
                                focusedBorder: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.white60,
                                    width: 2,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 30,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 1.5,
                                    color: Colors.black,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 12),
                                  ),
                                ),
                                Text(
                                  "Enter 6 digit OTP",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 1.5,
                                    color: Colors.black,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 12),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 90,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 50,
                            width: 200,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  primary: Colors.white54,
                                  side: BorderSide(
                                    color: Colors.white70,
                                    width: 2,
                                  )),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Registration_user(),
                                  ),
                                );
                              },
                              child: Text(
                                'Validate OTP',
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 18, 68, 138)),
                              ),
                            ),
                          )
                        ],
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
