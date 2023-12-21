import 'package:flutter/material.dart';
import 'package:simplifyvms/models/TodoModel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class TodoScreen extends StatefulWidget {
  final int userId;
  TodoScreen({required this.userId});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<TodoModel> todos=[];

  void getTodos() async{
    String url='https://jsonplaceholder.typicode.com/todos?userId=${widget.userId}';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      setState(() {
        todos = jsonResponse.map((todo) => TodoModel.fromJson(todo)).toList();
      });
    } else {
      setState(() {});
      throw Exception('Failed to load users');
    }
  }

  @override
  void initState() {
    super.initState();
    getTodos();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,

        title: Text("To-Do's"),
      ),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context,index){
            final TodoModel todo=todos[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                textColor: todo.completed? Colors.white:Colors.black,
                tileColor: todo.completed?Colors.green:Colors.grey,
                title: Text(todo.title),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(todo.completed? Icons.done:Icons.close),
                    Text(todo.completed?"Done":"Pending"),
                  ],
                ),
              ),
            );
      })
    ));
  }
}
