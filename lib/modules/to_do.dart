import 'package:flutter/material.dart';
import '../models/task.dart';

class Todo extends StatefulWidget {
  static String tag = 'to-do';
  @override
  _TodoState createState() => new _TodoState();
}

class _TodoState extends State<Todo> {

  final List<Task> task = [];

  void onCreateTask(String name) {
    setState(() {
      task.add(Task(name));
    });
  }

  void onTaskToggled(Task task) {
    setState(() {
      task.setFinished(!task.isFinished());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Todo',
      initialRoute: '/',
      routes: {
        '/': (context) => TodoList(tasks: task, onToggle: onTaskToggled),
        '/create': (context) => TodoCreation(onCreate: onCreateTask,),
      },
    );
  }
}


class TodoList extends StatelessWidget{

  final List<Task> tasks;
  final onToggle;

  TodoList({@required this.tasks, @required this.onToggle});

  @override
  Widget build(BuildContext context) {
    final body = Container(
        child: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return CheckboxListTile(
                title: Text(tasks[index].getTask()),
                value: tasks[index].isFinished(),
                onChanged: (_) => onToggle(tasks[index]),
              );
            }
        )
    );


    return Scaffold(
      appBar: new AppBar(
        title: new Text("Todo List"),
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
class TodoCreation extends StatefulWidget {
  final onCreate;

  TodoCreation({@required this.onCreate});

  @override
  State<StatefulWidget> createState() {
    return TodoCreationState();
  }
}

class TodoCreationState extends State<TodoCreation>{

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final body = Center(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: TextField(
          autofocus: true,
          controller: controller,
          decoration: InputDecoration(
              labelText: 'Enter task',
              hintText: 'Task'
          ),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text('New Task')),
      body: body,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.done),
          onPressed: () {
            widget.onCreate(controller.text);
            Navigator.pop(context);
          },
      ),
    );
  }
}