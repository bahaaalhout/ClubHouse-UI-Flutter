import 'package:flutter/material.dart';
import 'package:trying/data.dart';

class UserProfileImage extends StatelessWidget {
  final String ImageUrl;
  final double size;
  const UserProfileImage({Key? key, required this.ImageUrl, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(size / 2 - size / 10),
        child: Image.network(
          ImageUrl,
          width: size,
          height: size,
          fit: BoxFit.cover,
        ));
  }
}
