import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';

class user_checkout extends StatefulWidget {
  const user_checkout({Key? key}) : super(key: key);

  @override
  State<user_checkout> createState() => _user_checkoutState();
}

class _user_checkoutState extends State<user_checkout> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Chef Connect - Booking'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      // alignment: Alignment.topLeft,
                      width: width - 20,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Chef Id: ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    backgroundColor:
                                        Colors.black.withOpacity(.4)),
                              ),
                              Text(
                                "Chef Id",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    backgroundColor:
                                        Colors.black.withOpacity(.4)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Location: ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    backgroundColor:
                                        Colors.black.withOpacity(.4)),
                              ),
                              Text(
                                "Location",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    backgroundColor:
                                        Colors.black.withOpacity(.4)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      // alignment: Alignment.topLeft,
                      width: width - 20,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Select Date: ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    backgroundColor:
                                        Colors.black.withOpacity(.4)),
                              ),
                              Text(
                                "Chef Id",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    backgroundColor:
                                        Colors.black.withOpacity(.4)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Select Time: ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    backgroundColor:
                                        Colors.black.withOpacity(.4)),
                              ),
                              Text(
                                "Location",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    backgroundColor:
                                        Colors.black.withOpacity(.4)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: width - 20,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black,
                      ),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Select your prefered meal',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          CustomCheckBoxGroup(
                            buttonTextStyle: ButtonTextStyle(
                              selectedColor: Colors.white,
                              unSelectedColor: Colors.black,
                              textStyle: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            autoWidth: false,
                            enableButtonWrap: true,
                            wrapAlignment: WrapAlignment.center,
                            unSelectedColor: Theme.of(context).canvasColor,
                            buttonLables: [
                              "Breakfast",
                              "Lunch",
                              "Dinner",
                            ],
                            buttonValuesList: [
                              "Breakfast",
                              "Lunch",
                              "Dinner",
                            ],
                            checkBoxButtonValues: (values) {
                              print(values);
                            },
                            defaultSelected: ["Sunday"],
                            horizontal: false,
                            width: 120,
                            // hight: 50,
                            selectedColor:
                                Theme.of(context).colorScheme.secondary,
                            padding: 5,
                            enableShape: true,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: width - 20,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black,
                      ),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Number of Plates',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomRadioButton(
                            enableShape: true,
                            elevation: 3,
                            autoWidth: false,
                            enableButtonWrap: true,
                            // absoluteZeroSpacing: true,
                            spacing: 5,
                            wrapAlignment: WrapAlignment.center,
                            unSelectedColor: Theme.of(context).canvasColor,
                            buttonLables: [
                              'upto 4',
                              '4-6',
                              '6-8',
                              'more than 10'
                            ],
                            buttonValues: [
                              'upto 4',
                              '4-6',
                              '6-8',
                              'more than 10'
                            ],
                            buttonTextStyle: ButtonTextStyle(
                                selectedColor: Colors.white,
                                unSelectedColor: Colors.black,
                                textStyle: TextStyle(fontSize: 16)),
                            padding: 10,
                            horizontal: false,
                            width: 130,
                            radioButtonValue: (value) {
                              print(value);
                            },
                            selectedColor:
                                Theme.of(context).colorScheme.secondary,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      // alignment: Alignment.topLeft,
                      width: width - 20,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Full Address",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                backgroundColor: Colors.black.withOpacity(.4)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            style: TextStyle(color: Colors.white),
                            minLines: 5,
                            maxLines: 8,
                            decoration: InputDecoration(
                              counterStyle: TextStyle(color: Colors.white),
                              hintText: 'Address',
                              hintStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              focusedBorder: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
