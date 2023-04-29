import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class FullPhotoWidget extends StatelessWidget {
  const FullPhotoWidget({Key? key, required this.imageLink}) : super(key: key);

  final String imageLink;

  @override
  Widget build(BuildContext context) {
    return PhotoView(
      imageProvider: NetworkImage(imageLink),
      maxScale: 1.5,
      minScale: 0.5,
    );
  }
}
