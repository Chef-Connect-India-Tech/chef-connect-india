import 'package:flutter/material.dart';

class Chef_profile extends StatefulWidget {
  Chef_profile({Key? key}) : super(key: key);

  @override
  State<Chef_profile> createState() => _Chef_profileState();
}

class _Chef_profileState extends State<Chef_profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 45,
                          backgroundColor: Colors.white,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Chef ID',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'City',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Text(
                              'Level',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              width: 210,
                            ),
                            Text(
                              'Rating',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  height: 250,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              'Experince',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              'Cusine Expert',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  height: 140,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Specialities',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 200,
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              height: 140,
                              width: 160,
                              decoration: BoxDecoration(
                                // border: Border.all(color: Colors.grey.shade400, width: 5),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    10,
                                  ),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 10,
                                    offset: Offset(0, 3),
                                    spreadRadius: 5,
                                  )
                                ],
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    // Colors.green,
                                    // Colors.blue,

                                    Colors.purple.shade700,
                                    Colors.purple.shade600,
                                  ],
                                ),
                              ),
                              child: InkWell(
                                onTap: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => Splashscreenbmi(),
                                  //   ),
                                  // );
                                },
                                child: Align(
                                  child: Column(
                                    children: [
                                      // Image.asset(
                                      //   'images/chef.png',
                                      //   height: 90,
                                      //   width: 70,
                                      // ),
                                      Text(
                                        '',
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.white,
                                          fontFamily: 'Roboto',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 140,
                              width: 160,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      10,
                                    ),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade300,
                                      blurRadius: 10,
                                      offset: Offset(0, 3),
                                      spreadRadius: 5,
                                    ),
                                  ],
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.purple.shade700,
                                      Colors.purple.shade600,
                                    ],
                                  )),
                              child: InkWell(
                                onTap: () {},
                                child: Column(
                                  children: [
                                    // Image.asset(
                                    //   'images/chef.png',
                                    //   height: 90,
                                    //   width: 70,
                                    // ),
                                    Text(
                                      '',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontFamily: 'Roboto',
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 140,
                              width: 160,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      10,
                                    ),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade300,
                                      blurRadius: 10,
                                      offset: Offset(0, 3),
                                      spreadRadius: 5,
                                    ),
                                  ],
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.purple.shade700,
                                      Colors.purple.shade600,
                                    ],
                                  )),
                              child: InkWell(
                                onTap: () {},
                                child: Column(
                                  children: [
                                    // Image.asset(
                                    //   'images/chef.png',
                                    //   height: 90,
                                    //   width: 70,
                                    // ),
                                    Text(
                                      '',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontFamily: 'Roboto',
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 140,
                              width: 160,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      10,
                                    ),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade300,
                                      blurRadius: 10,
                                      offset: Offset(0, 3),
                                      spreadRadius: 5,
                                    ),
                                  ],
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.purple.shade700,
                                      Colors.purple.shade600,
                                    ],
                                  )),
                              child: InkWell(
                                onTap: () {},
                                child: Column(
                                  children: [
                                    // Image.asset(
                                    //   'images/chef.png',
                                    //   height: 90,
                                    //   width: 70,
                                    // ),
                                    Text(
                                      '',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontFamily: 'Roboto',
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 140,
                              width: 160,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      10,
                                    ),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade300,
                                      blurRadius: 10,
                                      offset: Offset(0, 3),
                                      spreadRadius: 5,
                                    ),
                                  ],
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.purple.shade700,
                                      Colors.purple.shade600,
                                    ],
                                  )),
                              child: InkWell(
                                onTap: () {},
                                child: Column(
                                  children: [
                                    // Image.asset(
                                    //   'images/chef.png',
                                    //   height: 90,
                                    //   width: 70,
                                    // ),
                                    Text(
                                      '',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontFamily: 'Roboto',
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 140,
                              width: 160,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      10,
                                    ),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade300,
                                      blurRadius: 10,
                                      offset: Offset(0, 3),
                                      spreadRadius: 5,
                                    ),
                                  ],
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.purple.shade700,
                                      Colors.purple.shade600,
                                    ],
                                  )),
                              child: InkWell(
                                onTap: () {},
                                child: Column(
                                  children: [
                                    // Image.asset(
                                    //   'images/chef.png',
                                    //   height: 90,
                                    //   width: 70,
                                    // ),
                                    Text(
                                      '',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontFamily: 'Roboto',
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 140,
                              width: 160,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      10,
                                    ),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade300,
                                      blurRadius: 10,
                                      offset: Offset(0, 3),
                                      spreadRadius: 5,
                                    ),
                                  ],
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.purple.shade700,
                                      Colors.purple.shade600,
                                    ],
                                  )),
                              child: InkWell(
                                onTap: () {},
                                child: Column(
                                  children: [
                                    // Image.asset(
                                    //   'images/chef.png',
                                    //   height: 90,
                                    //   width: 70,
                                    // ),
                                    Text(
                                      '',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontFamily: 'Roboto',
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Menu',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      height: 140,
                      width: 160,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Pre-Defined \n     Menu',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: 140,
                      width: 160,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Customized\n      Menu',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
