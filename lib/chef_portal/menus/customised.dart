import 'package:flutter/material.dart';

// class custom_menu extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Flutter Widgets Library"),
//       ),
//       body: ListView(
//         children: [
//           tileBldr(
//             context,
//             onTap: () {
//               // Navigator.push(
//               //     context,
//               //     MaterialPageRoute(
//               //         builder: (context) => DynamicWrappedWidget()));
//             },
//             title: "Dynamic Wrapped Widgets",
//           ),
//         ],
//       ),
//     );
//   }
// }

// // tile helper
// Widget tileBldr(BuildContext context, {String? title, Function? onTap}) =>
//     ListTile(
//       onTap: onTap!(),
//       title: Text(title ?? "data title"),
//     );

class custom_menu extends StatefulWidget {
  @override
  _custom_menuState createState() => _custom_menuState();
}

class _custom_menuState extends State<custom_menu> {
  final TextEditingController _input = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // input field
            TextField(
              controller: _input,
              onEditingComplete: () {
                if (_input.text.isNotEmpty) {
                  setState(() {
                    intrests.add(_input.text);
                    _input.clear();
                  });
                }

                print(intrests);
              },
              decoration: InputDecoration(
                hintText: "enter your dishes",
              ),
            ),
            SizedBox(height: 20),

            // inrests
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black26),
                borderRadius: BorderRadius.circular(14),
              ),
              child: intrests.length == 0
                  ? Text(
                      "no data",
                      style: TextStyle(color: Colors.blueGrey),
                      textAlign: TextAlign.center,
                    )
                  : Wrap(
                      runSpacing: 6,
                      spacing: 6,
                      children: List.from(
                        intrests.map(
                          (e) => chipBuilder(
                            onTap: () {
                              setState(() {
                                intrests.remove(e);
                              });
                            },
                            title: e,
                          ),
                        ),
                      ),
                    ),
            ),

            // empty list btn
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      intrests.clear();
                    });
                  },
                  child: Text(
                    "Empty List",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// intrests
List<String> intrests = [];

// chips helper
Widget chipBuilder({required Function onTap, required String title}) {
  return Container(
    padding: const EdgeInsets.fromLTRB(10, 10, 12, 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.blue.shade400,
    ),
    child: Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        GestureDetector(
          onTap: onTap(),
          child: Icon(
            Icons.clear,
            color: Colors.blue.shade50,
            size: 20,
          ),
        ),
        SizedBox(width: 4),
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}
