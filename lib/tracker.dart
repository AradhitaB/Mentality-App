import 'package:flutter/material.dart';

class Tracker extends StatelessWidget {
  static String tag = 'to-do';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: new AppBar(
        title: new Text("Tracker"),
      ),
    );
  }
}