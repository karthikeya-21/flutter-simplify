import 'package:flutter/material.dart';
import '../models/CommentsModel.dart';


class CommentBox extends StatelessWidget{
  final CommentsModel comment;
  CommentBox({required this.comment});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(comment.name,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
            Text(comment.email,style: TextStyle(fontSize: 8),),
            Text(comment.body,style: TextStyle(fontSize: 10),),
          ],
        ),
      ),
    );
  }

}