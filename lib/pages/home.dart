import 'package:flutter/material.dart';
import 'package:todo_app/pages/txt_decoration.dart';
import 'package:todo_app/pages/widgets/empty_task_state.dart';
import 'package:todo_app/pages/widgets/task_list.dart';
import 'package:todo_app/providers/add_task.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  String task;
  String duration;
  @override
  Widget build(BuildContext context) {
    final taskVm = Provider.of<AddTask>(context);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xFFFAFAFA),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          buildShowModalBottomSheet(context, taskVm);
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          'Flutter TodoList',
          style: TextStyle(
            fontSize: 18,
            color: Color(0xff6b6b6b),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: taskVm.tasksList.isEmpty
            ? EmptyTaskState()
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: TaskList(taskVm: taskVm),
              ),
      ),
    );
  }

  Future buildShowModalBottomSheet(BuildContext context, AddTask taskVm) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'New task',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff3A3A3A),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Note what you want to get done and tick \nthem off as you complete them.',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xff9C9C9C),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: CircleAvatar(
                    backgroundColor: Color(0xffECECEC),
                    child: Icon(
                      Icons.close,
                      color: Color(0xff6B6B6B),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Label(
                      lblText: 'Task',
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    TextFormField(
                      onSaved: (value) => task = value,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter a task';
                        }
                        return null;
                      },
                      decoration: textInputDecoration(hint: 'Enter task'),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Label(
                      lblText: 'Duration',
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    TextFormField(
                      onSaved: (value) => duration = value,
                      decoration: textInputDecoration(hint: 'Enter duration'),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: double.infinity,
                      height: 50,
                      child: FlatButton(
                        onPressed: () async {
                          //Validate the form
                          if (!_formKey.currentState.validate()) {
                            return;
                          }
                          _formKey.currentState.save();
                          _addTask(taskVm);
                        },
                        child: Text(
                          'Save',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Color(0xff3A86FF),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _addTask(
    AddTask taskVm,
  ) {
    //Add task to the task list
    taskVm.addTasks(taskName: task, duration: duration);
    //Close bottomSheet
    Navigator.pop(context);
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        backgroundColor: Colors.grey.shade900,
        content: Text('Task added successfully'),
      ),
    );
  }
}
