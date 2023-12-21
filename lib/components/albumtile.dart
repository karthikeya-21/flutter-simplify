import 'package:flutter/material.dart';
import 'package:simplifyvms/models/AlbumModel.dart';
import 'package:simplifyvms/screens/photoscreen.dart';

class AlbumTile extends StatelessWidget{
  final AlbumModel album;
  AlbumTile({required this.album});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(15)),
        child: ListTile(
          onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>PhotoScreen(albumid:album.id)));
          },
          title: Text(album.title),
          trailing: Icon(Icons.navigate_next_rounded),
        ),
      ),
    );
  }

}