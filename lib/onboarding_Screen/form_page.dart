import 'package:flutter/material.dart';

class scroll extends StatefulWidget {
  scroll({Key? key}) : super(key: key);

  @override
  State<scroll> createState() => _scrollState();
}

class _scrollState extends State<scroll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            height: 300,
            child: ListView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Row(
                    children: [
                      Container(
                        height: 300,
                        width: 300,
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
                          onTap: () {},
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/Private Chef.png',
                                height: 300,
                                width: 300,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 300,
                        width: 300,
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
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: Colors.white,
                                  content: Column(
                                    children: [
                                      TextFormField(
                                        decoration: InputDecoration(
                                          fillColor: Colors.grey.shade200,
                                          filled: true,
                                          hintText: 'Enter Name',
                                          hintStyle: TextStyle(
                                            color: Colors.black,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        decoration: InputDecoration(
                                          fillColor: Colors.grey.shade200,
                                          filled: true,
                                          hintText: 'Enter Mail Id',
                                          hintStyle: TextStyle(
                                            color: Colors.black,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        decoration: InputDecoration(
                                          fillColor: Colors.grey.shade200,
                                          filled: true,
                                          hintText: 'Enter Phone Number',
                                          hintStyle: TextStyle(
                                            color: Colors.black,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        decoration: InputDecoration(
                                          fillColor: Colors.grey.shade200,
                                          filled: true,
                                          hintText: 'Enter Address',
                                          hintStyle: TextStyle(
                                            color: Colors.black,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        minLines: 5,
                                        maxLines: 20,
                                        decoration: InputDecoration(
                                          fillColor: Colors.grey.shade200,
                                          filled: true,
                                          hintText: 'Enter Description',
                                          hintStyle: TextStyle(
                                            color: Colors.black,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Submit',
                                      ),
                                    )
                                  ],
                                );
                              },
                            );
                          },
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/Private Chef.png',
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 300,
                        width: 300,
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
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: Colors.white,
                                  content: Column(
                                    children: [
                                      TextFormField(
                                        decoration: InputDecoration(
                                          fillColor: Colors.grey.shade200,
                                          filled: true,
                                          hintText: 'Enter Name',
                                          hintStyle: TextStyle(
                                            color: Colors.black,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        decoration: InputDecoration(
                                          fillColor: Colors.grey.shade200,
                                          filled: true,
                                          hintText: 'Enter Mail Id',
                                          hintStyle: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Colors.black,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        decoration: InputDecoration(
                                          fillColor: Colors.grey.shade200,
                                          filled: true,
                                          hintText: 'Enter Phone Number',
                                          hintStyle: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Colors.black,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        decoration: InputDecoration(
                                          fillColor: Colors.grey.shade200,
                                          filled: true,
                                          hintText: 'Enter Address',
                                          hintStyle: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Colors.black,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        minLines: 5,
                                        maxLines: 20,
                                        decoration: InputDecoration(
                                          fillColor: Colors.grey.shade200,
                                          filled: true,
                                          hintText: 'Enter Description',
                                          hintStyle: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Colors.black,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Submit',
                                      ),
                                    )
                                  ],
                                );
                              },
                            );
                          },
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/Permanent Chef.png',
                                fit: BoxFit.fill,
                              ),
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
        ],
      ),
    );
  }
}
