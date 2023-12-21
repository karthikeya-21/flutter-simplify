import 'package:flutter/material.dart';
import '../models/PostModel.dart';
import '../models/CommentsModel.dart';
import 'commentbox.dart';
import 'CustomButton.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_share/flutter_share.dart';

class PostTile extends StatefulWidget {
  final PostModel post;
  PostTile({required this.post});

  @override
  State<PostTile> createState() => _PostTileState();
}

class _PostTileState extends State<PostTile> {
  Future<void> share() async {
    String content='${widget.post.title}\n\n${widget.post.body}';
    await FlutterShare.share(
        title: widget.post.title,
        text: widget.post.body,
        // linkUrl: 'https://flutter.dev/',
        chooserTitle: 'Share the Post'
    );
  }

  void getcomments() async{
    String url='https://jsonplaceholder.typicode.com/comments';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      setState(() {
        cmnts = jsonResponse.map((comment) => CommentsModel.fromJson(comment)).toList();
      });
    } else {
      setState(() {

      });
      throw Exception('Failed to load users');
    }
  }
  List<CommentsModel> getThreeRandomComments(List<CommentsModel> comments, {required int postId}) {
    List<CommentsModel> commentsList = comments.where((comment) => comment.postId == postId).toList();
    commentsList.shuffle();
    return commentsList.take(3).toList();
  }



  bool _isExpanded = false;
  List<CommentsModel> cmnts = [];

  @override
  void initState() {
    super.initState();
    getcomments();
  }

  @override
  Widget build(BuildContext context) {
    List<CommentsModel>comments=getThreeRandomComments(cmnts, postId: widget.post.id);
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.greenAccent),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.post.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(widget.post.body),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // CustomButton(
                //     icon: Icons.remove_red_eye,
                //     action: "Likes",
                //     onpressed: (){},
                //     color: Colors.white),
                CustomButton(
                    icon: Icons.comment,
                    action: "Comments",
                    onpressed: (){
                      setState(() {
                        _isExpanded=!_isExpanded;
                      });
                    },
                    color: Colors.white),
                CustomButton(
                    icon: Icons.share,
                    action: "Share",
                    onpressed: share,
                    // onpressed: (){
                    //
                    //   // Share.share(content,subject: 'Post');
                    //   // Share.share('Hello');
                    // },
                    color: Colors.white),
              ],
            ),
            if(_isExpanded)
              Column(
                children:[
                  Center(
                    child: Text('Comments',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
                  ),
                CommentBox(comment: comments[0],),
                CommentBox(comment: comments[1],),
                CommentBox(comment: comments[2],),
                ]
              ),
          ],
        ),
      ),
    );
  }
}
