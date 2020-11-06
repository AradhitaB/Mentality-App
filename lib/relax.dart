import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/platform_interface.dart';
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

/*
class Relax extends StatefulWidget{
  static String tag = 'relax';

  @override
  _RelaxState createState() => _RelaxState();
}

class _RelaxState extends State<Relax>{
  Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Relax"),
      ),
      body: WebView(
        initialUrl: 'https://en.wikipedia.org/wiki/Kraken',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController){
          _controller.complete(webViewController);
        },
      ),
    );
  }
}


 */