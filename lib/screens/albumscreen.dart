import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:simplifyvms/components/albumtile.dart';
import 'package:simplifyvms/models/AlbumModel.dart';

class AlbumScreen extends StatefulWidget {
  final int userId;
  AlbumScreen({required this.userId});

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  List<AlbumModel> albums = [];

  void getUserAlbums() async {
    String url =
        'https://jsonplaceholder.typicode.com/albums?userId=${widget.userId}';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      setState(() {
        albums =
            jsonResponse.map((album) => AlbumModel.fromJson(album)).toList();
      });
    } else {
      setState(() {});
      throw Exception('Failed to load users');
    }
  }

  @override
  void initState() {
    super.initState();
    getUserAlbums();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Albums'),
            ),
            body: albums != []
                ? ListView.builder(
                    itemCount: albums.length,
                    itemBuilder: (context, index) {
                      return AlbumTile(album: albums[index]);
                    })
                : Center(
                    child: Text("No Albums found for this User"),
                  )));
  }
}
