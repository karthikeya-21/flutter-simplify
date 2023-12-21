import 'package:flutter/material.dart';
import 'package:simplifyvms/models/PhotoModel.dart';

class PhotoCard extends StatelessWidget{
  final PhotoModel photo;
  PhotoCard({required this.photo});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Image.network(photo.url),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(photo.title),
              ),
            ],
          ),
        ),
      ),
    );
  }

}