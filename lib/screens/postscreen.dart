import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/PostModel.dart';
import '../components/posttile.dart';


class PostScreen extends StatefulWidget {
  final int userId;
  PostScreen({required this.userId});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<dynamic> posts = [];
  void getposts() async {
    String url =
        'https://jsonplaceholder.typicode.com/posts/?userId=${widget.userId}';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      setState(() {
        posts = jsonResponse.map((post) => PostModel.fromJson(post)).toList();
      });
    } else {
      setState(() {});
      throw Exception('Failed to load users');
    }
  }

  @override
  void initState() {
    super.initState();
    getposts();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Posts'),
        ),
        body: posts != []
            ? ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: PostTile(post: posts[index]),
                  );
                })
            : Center(
                child: Text('No posts found'),
              ),
      ),
    );
  }
}
