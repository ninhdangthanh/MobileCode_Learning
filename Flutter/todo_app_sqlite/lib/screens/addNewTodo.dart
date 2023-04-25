import 'package:flutter/material.dart';

import '../database/model.dart';

class AddNewToDo extends StatefulWidget {
  @override
  _AddNewToDoState createState() => _AddNewToDoState();
}

class _AddNewToDoState extends State<AddNewToDo> {
  DatabaseConfiguration _databaseConfiguration = new DatabaseConfiguration();
  late ToDo todo;
  final _formKey = new GlobalKey<FormState>();

  final taskInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new Todo'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
        child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: taskInputController,
                ),

                // Expanded(
                //   child: SizedBox(height: 22.0,),
                // ),

                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    ToDo todo = ToDo(task: taskInputController.text);
                    _databaseConfiguration.addToDO(todo).then((id) => {
                          taskInputController.clear(),
                          print('added new todo to database ${id.id} !'),
                          Navigator.pushNamed(context, '/todo-list'),
                        });
                  },
                ),
              ],
            )),
      ),
    );
  }
}
