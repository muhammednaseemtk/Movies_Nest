import 'package:flutter/material.dart';
import 'package:movie_nest/core/url.dart';

class MovieImageController extends ChangeNotifier {
  String? imagePath;

  void setImagePath(String? path) {
    imagePath = path;
  }

  ImageProvider get image {
    if (imagePath == null || imagePath!.isEmpty) {
      return const AssetImage('asset/image/it1.jpg');
    }
    return NetworkImage(Url.imageBaseUrl + imagePath!);
  }
}
