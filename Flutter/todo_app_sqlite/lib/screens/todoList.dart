import 'package:flutter/material.dart';
import 'package:todo_app_sqlite/screens/updateTodo.dart';
import '../database/model.dart';

class AllToDos extends StatefulWidget {
  @override
  _AllToDosState createState() => _AllToDosState();
}

class _AllToDosState extends State<AllToDos> {
  final DatabaseConfiguration _databaseConfiguration = DatabaseConfiguration();
  late ToDo todo;

  late List<ToDo> todoList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your ToDos'),
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, '/add-new-todo');
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: FutureBuilder(
            future: _databaseConfiguration.getAllToDos(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                todoList = snapshot.data!;
              }
              return ListView.builder(
                itemCount: todoList.length,
                itemBuilder: (BuildContext context, int index) {
                  ToDo todo = todoList[index];
                  print('there is homepage with todo: ${todo.toString()}');
                  return Card(
                    child: Row(
                      children: <Widget>[
                        Text('task : ${todo.task}'),
                        const Expanded(
                          child: SizedBox(),
                        ),
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        UpdateTodo(todo.id as int)));
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            _databaseConfiguration.deleteToDO(todo);
                            setState(() {
                              todoList.removeAt(index);
                            });
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            }),
      ),
    );
  }
}
