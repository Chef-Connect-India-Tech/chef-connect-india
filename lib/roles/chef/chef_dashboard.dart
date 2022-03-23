// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
// import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class chef_dashboard extends StatefulWidget {
  const chef_dashboard({Key? key}) : super(key: key);

  @override
  State<chef_dashboard> createState() => _chef_dashboardState();
}

class _chef_dashboardState extends State<chef_dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //By default
            // LiteRollingSwitch(
            //   value: false,
            //   onChanged: (bool state) {
            //     print('turned ${(state) ? 'on' : 'off'}');
            //   },
            // ),

            //Customized
            // Padding(
            //   padding: EdgeInsets.only(top: 20),
            //   child: LiteRollingSwitch(
            //     value: true,
            //     textOn: 'active',
            //     textOff: 'inactive',
            //     colorOn: Colors.deepOrange,
            //     colorOff: Colors.blueGrey,
            //     iconOn: Icons.lightbulb_outline,
            //     iconOff: Icons.power_settings_new,
            //     onChanged: (bool state) {
            //       print('turned ${(state) ? 'on' : 'off'}');
            //     },
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
