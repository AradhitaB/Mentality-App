import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Tracker extends StatelessWidget {
  static String tag = 'to-do';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: new AppBar(
        title: new Text("Relax"),
      ),
      body: WebView(
        initialUrl: "https://docs.google.com/spreadsheets/d/1xhLBGXgth0iGooMBro2TL8XCXhZoBCImLfiVyGzSsAI/edit?usp=sharing",
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}