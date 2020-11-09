import 'package:flutter/material.dart';
import '../modules/to_do.dart';
import '../modules/tracker.dart';
import '../modules/braindump.dart';
import '../modules/relax.dart';

class MoodPage extends StatelessWidget {
  static String tag = 'mood-page';

  @override
  Widget build(BuildContext context) {
    final body = GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 8.0,
        children: List.generate(choices.length, (index) {
          return Center(
            child: SelectCard(choice: choices[index]),
          );
        }),
    );

    return Scaffold(
      appBar: new AppBar(
        title: new Text("Mentality"),
      ),
      body: body,
    );
  }
}

class Choice {
  const Choice({this.title, this.icon});
  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title:'To-Do', icon: Icons.format_list_bulleted),
  const Choice(title: 'Tracker', icon: Icons.track_changes),
  const Choice(title: 'Braindump', icon: Icons.note_add),
  const Choice(title: 'Relax', icon: Icons.beach_access),

];

class SelectCard extends StatelessWidget{
  const SelectCard({Key key, this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.headline4;
    return new GestureDetector(
        child: new Card(
            elevation: 5.0,
            color: Colors.lightBlue,
            child: Center(child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(child: Icon(choice.icon, size:50.0, color:textStyle.color)),
                Text(choice.title, style:textStyle),
              ],
            ),
            )
        ),
      onTap: () {
          if(choice.title == "To-Do") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Todo()),
            );
          }else if(choice.title == "Tracker"){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Tracker()),
            );
          }else if(choice.title == "Braindump"){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Braindump()),
            );
          }else if(choice.title == "Relax"){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Relax()),
            );
          }
      }
    );
  }
}
