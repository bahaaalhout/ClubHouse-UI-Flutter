// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trying/data.dart';
import 'package:trying/widget/user_profile_image.dart';

class RoomUserImage extends StatelessWidget {
  final String name;
  final bool isNew;
  final bool isMuted;
  final String ImageUrl;
  final double size;
  const RoomUserImage(
      {Key? key,
      required this.name,
      this.isNew = false,
      this.isMuted = false,
      required this.ImageUrl,
      this.size = 80})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Stack(
            children: [
              UserProfileImage(ImageUrl: ImageUrl, size: size),
              if (isNew)
                Positioned(
                  left: 0,
                  bottom: 0,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 4)
                      ],
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '🎉',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              if (isMuted)
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 4)
                      ],
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      CupertinoIcons.mic_slash_fill,
                      size: 12,
                      color: Colors.red,
                    ),
                  ),
                ),
            ],
          ),
        ),
        Flexible(
          child: Text(
            name,
            style: TextStyle(
              color: Colors.black,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
