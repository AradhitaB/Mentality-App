import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class Relax extends StatelessWidget {
  static String tag = 'relax';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: new AppBar(
        title: new Text("Relax"),
      ),
      body: WebView(
        initialUrl: "https://help.instagram.com/resources/63617265",
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
