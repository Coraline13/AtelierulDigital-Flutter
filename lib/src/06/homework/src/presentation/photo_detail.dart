import 'package:atelieruldigital_flutter/src/06/homework/src/containers/photo_container.dart';
import 'package:atelieruldigital_flutter/src/06/homework/src/models/photo.dart';
import 'package:flutter/material.dart';

class PhotoDetail extends StatelessWidget {
  const PhotoDetail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhotoContainer(
      builder: (BuildContext context, Photo photo) {
        print('PHOTO: $photo');
        return Scaffold(
          appBar: AppBar(
            title: Text(photo.altDescription ?? ''),
          ),
          body: Hero(
              tag: '${photo.id}',
              child: Image.network(photo.urls['regular']),),
        );
      },
    );
  }
}