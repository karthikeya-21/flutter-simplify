import 'package:flutter/material.dart';
import 'package:simplifyvms/components/photocard.dart';
import 'package:simplifyvms/models/PhotoModel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PhotoScreen extends StatefulWidget {
  final int albumid;
  PhotoScreen({required this.albumid});

  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  List<PhotoModel> photos = [];

  void getPictures() async {
    String url =
        'https://jsonplaceholder.typicode.com/photos?albumId=${widget.albumid}';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      setState(() {
        photos =
            jsonResponse.map((photo) => PhotoModel.fromJson(photo)).toList();
      });
    } else {
      setState(() {});
      throw Exception('Failed to load users');
    }
  }

  @override
  void initState() {
    super.initState();
    getPictures();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Photos'),
      ),
      body: photos != []
          ? ListView.builder(
              itemCount: photos.length,
              itemBuilder: (context, index) {
                return PhotoCard(photo: photos[index]);
              })
          : Center(
              child: Text('No Photos found in this album'),
            ),
    ));
  }
}
