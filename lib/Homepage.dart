import 'mood_page.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
/*
class HomePage extends StatelessWidget {
  static String tag = 'mood-page';
*/
  @override
  Widget build(BuildContext context) {
    final user = Container(
      child: Padding(
        padding: EdgeInsets.all(14.0),
        child: CircleAvatar(
          radius: 70.0,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/person.png'),
        ),
      ),
    );

    final welcome = Padding(
      padding: EdgeInsets.all(10.0),
      child: Text(
        'Welcome user',
        style: TextStyle(fontSize: 26.0, color: Colors.white),
      ),
    );

    final welcomemsg = Padding(
      padding: EdgeInsets.all(10.0),
      child: Text(
        'Mentality is here for you.',
        style: TextStyle(fontSize:18.0, color: Colors.white60),
      ),
    );

    final enter = Padding(
      padding: EdgeInsets.symmetric(vertical: 14.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22.0),
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MoodPage()),
          );
        },
        padding: EdgeInsets.all(12.0),
        color: Colors.lightBlueAccent,
        child: Text('Continue', style: TextStyle(color: Colors.white)),
      ),
    );


    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(26.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.blue,
          Colors.lightBlueAccent,
        ]),
      ),
      child: Column(
        children: <Widget>[user, welcome, welcomemsg, enter],
      ),
    );

  return Scaffold(
    body: body,
  );
  }
}
