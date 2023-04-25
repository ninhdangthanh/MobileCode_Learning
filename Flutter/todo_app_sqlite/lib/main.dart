import 'package:flutter/material.dart';
import 'package:todo_app_sqlite/screens/addNewTodo.dart';
import 'package:todo_app_sqlite/screens/loading.dart';
import 'package:todo_app_sqlite/screens/todoList.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Loading(),
        '/todo-list': (context) => AllToDos(),
        '/add-new-todo': (context) => AddNewToDo(),
      },
    ));
