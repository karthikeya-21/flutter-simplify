import 'package:flutter/material.dart';
import 'package:simplifyvms/models/UserModel.dart';
import 'package:simplifyvms/screens/homescreen.dart';
import 'package:simplifyvms/screens/todoscreen.dart';
import 'CustomButton.dart';
import '../screens/postscreen.dart';
import '../screens/albumscreen.dart';

class UserTile extends StatelessWidget {
  final UserModel user;

  UserTile({required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(15),
        ),
        // height: 250,
        // width: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${user.name}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('${user.email}', style: TextStyle(fontSize: 14)),
            SizedBox(height: 8),
            Text('${user.address.street},', style: TextStyle(fontSize: 14)),
            SizedBox(height: 8),
            Text('${user.address.suite},', style: TextStyle(fontSize: 14)),
            SizedBox(height: 8),
            Text('${user.address.city},', style: TextStyle(fontSize: 14)),
            SizedBox(height: 8),
            Text('${user.address.zipcode},', style: TextStyle(fontSize: 14)),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(icon: Icons.post_add_outlined, action: "POSTS", onpressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PostScreen(userId: user.id,)),);
                }, color: Colors.blue),
                CustomButton(icon: Icons.photo, action: "ALBUMS", onpressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AlbumScreen(userId: user.id)),);
                }, color: Colors.red),
                CustomButton(icon: Icons.work, action: "TO-DOS", onpressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>TodoScreen(userId: user.id,)),);

                }, color: Colors.yellow),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
