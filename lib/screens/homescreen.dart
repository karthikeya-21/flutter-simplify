import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../components/usertile.dart';
import '../models/UserModel.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> users = [];
  void getUsersData() async {
    String url = 'https://jsonplaceholder.typicode.com/users';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      setState(() {
        users = jsonResponse.map((user) => UserModel.fromJson(user)).toList();
      });
    } else {
      setState(() {});
      throw Exception('Failed to load users');
    }
  }

  @override
  void initState() {
    super.initState();
    getUsersData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('SimplifyVms'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: users != []
              ? ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    return UserTile(user: users[index]);
                  })
              : Text("No users Found"),
        ),
      ),
    );
  }
}
