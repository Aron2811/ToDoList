import 'package:firstproject/frames/navBar.dart';
import 'package:firstproject/utils/todo_list.dart';
import 'package:flutter/material.dart';

class Todoframe extends StatefulWidget {
  @override
  State<Todoframe> createState() => _TodoframeState();
}

class _TodoframeState extends State<Todoframe> {
  final _controller = TextEditingController();
  List toDoList = [];

  void checkBoxChanged(int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
  }

  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: TextTheme()),
      home: Scaffold(
        backgroundColor: Color(0xFFCADCFC),
        drawer: NavBar(),
        appBar: AppBar(
          title: const Text("Todo List"),
          centerTitle: true,
          backgroundColor: Color(0xFF89ABE3),
        ),
        body: ListView.builder(
            itemCount: toDoList.length,
            itemBuilder: (BuildContext context, index) {
              return TodoList(
                taskName: toDoList[index][0],
                taskCompleted: toDoList[index][1],
                onChanged: (value) => checkBoxChanged(index),
                deleteFunction: (value) => deleteTask(index),
              );
            }),
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Add a todo',
                      filled: true,
                      fillColor: Color(0xFFB7C9E2),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFF6BADCE),
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              ),
              FloatingActionButton(
                onPressed: saveNewTask,
                child: const Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
