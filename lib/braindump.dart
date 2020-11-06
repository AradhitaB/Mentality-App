import 'package:flutter/material.dart';
import 'note.dart';
/*
class Braindump extends StatelessWidget {
  static String tag = 'BrainDump';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: new AppBar(
        title: new Text("BrainDump"),
      ),
    );
  }
}
*/
class Braindump extends StatefulWidget {
  static String tag = 'Braindump';
  @override
  _BraindumpState createState() => new _BraindumpState();
}

class _BraindumpState extends State<Braindump> {

  final List<Note> note = [];

  void onCreateNote(String name, String body) {
    setState(() {
      note.add(Note(name, body));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Braindump',
      initialRoute: '/',
      routes: {
        '/': (context) => BraindumpList(notes: note),
        '/create': (context) => BraindumpCreation(onCreate: onCreateNote,),
      },
    );
  }
}


class BraindumpList extends StatelessWidget{

  final List<Note> notes;

  BraindumpList({@required this.notes});

  @override
  Widget build(BuildContext context) {
    final body = GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 4.0,
      mainAxisSpacing: 8.0,
      children: List.generate(notes.length, (index) {
        return Center(
          child: SelectNote(note: notes[index]),
        );
      }),
    );



    /*= Container(
        child: ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              return Card(
                  elevation: 5.0,
                  color: Colors.white60,
                  child: Center(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(choice.title, style:textStyle),

                    ],
                  ),
                  )
              );
            }
            )
    );
*/

    return Scaffold(
      appBar: new AppBar(
        title: new Text("Braindump Notes"),
      ),
      body: body,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.pushNamed(context, '/create');
        },
      ),
    );
  }
}

//Now, handling user input
class BraindumpCreation extends StatefulWidget {
  final onCreate;

  BraindumpCreation({@required this.onCreate});

  @override
  State<StatefulWidget> createState() {
    return BraindumpCreationState();
  }
}

class BraindumpCreationState extends State<BraindumpCreation>{

  final TextEditingController controllertitle = TextEditingController();
  final TextEditingController controllernote = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final body = Center(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children:<Widget>[
            TextField(autofocus: true, controller: controllertitle,
              decoration: InputDecoration(
                  labelText: 'Enter Title',
                  hintText: 'title'
              ),
            ),
            TextField(autofocus: false, controller: controllernote,
              decoration: InputDecoration(
                  labelText: 'Enter Note',
                  hintText: 'note'
              ),
            )
          ],
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text('New Note')),
      body: body,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.done),
        onPressed: () {
          widget.onCreate(controllertitle.text, controllernote.text);
          Navigator.pop(context);
        },
      ),
    );
  }
}

class SelectNote extends StatelessWidget{
  const SelectNote({Key key, this.note}) : super(key: key);
  final Note note;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.headline6;
    final TextStyle textStyleNote = Theme.of(context).textTheme.caption;
    return new GestureDetector(
        child: new Card(
            elevation: 5.0,
            color: Colors.white60,
            child:Padding(
                padding: EdgeInsets.all(16),
                child: Center(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(note.getTitle(), style:textStyle),
                    Text(note.getNote(), style:textStyleNote),
                  ],
                ),)
              ),
        ),
        onTap: () {
        }
    );
  }
}

