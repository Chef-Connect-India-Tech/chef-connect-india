import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Privacy_policy extends StatefulWidget {
  Privacy_policy({Key? key}) : super(key: key);

  @override
  State<Privacy_policy> createState() => _Privacy_policyState();
}

class _Privacy_policyState extends State<Privacy_policy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Chef Connect India Privacy Policy',
        ),
      ),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl:
            'https://github.com/Chef-Connect-India-Tech/Chef-Connect-india-privacy-policy',
      ),
    );
  }
}
