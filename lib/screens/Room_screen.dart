// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trying/data.dart';
import 'package:trying/models/room.dart';
import 'package:trying/widget/room_user_profile.dart';
import 'package:trying/widget/user_profile_image.dart';

class RoomScreen extends StatelessWidget {
  final Room room;
  const RoomScreen({Key? key, required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 130,
        leading: TextButton.icon(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              CupertinoIcons.chevron_down,
              size: 28,
              color: Colors.black,
            ),
            label: Text(
              'Hallway',
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
              ),
            )),
        actions: [
          IconButton(
            icon: Icon(
              CupertinoIcons.doc,
              size: 25,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: UserProfileImage(
              ImageUrl: currentUser.imageURL,
              size: 34,
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.white,
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${room.club} 🏠'.toUpperCase(),
                        style: Theme.of(context).textTheme.overline!.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            letterSpacing: .1),
                      ),
                      Icon(CupertinoIcons.ellipsis),
                    ],
                  ),
                  Text(
                    room.name,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ],
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(10),
              sliver: SliverGrid.count(
                crossAxisCount: 3,
                mainAxisSpacing: 15,
                children: room.speakers
                    .map((e) => RoomUserImage(
                          name: e.firstName,
                          ImageUrl: e.imageURL,
                          size: 60,
                          isNew: Random().nextBool(),
                          isMuted: Random().nextBool(),
                        ))
                    .toList(),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Followed by Speakers',
                    style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(10),
              sliver: SliverGrid.count(
                crossAxisCount: 4,
                mainAxisSpacing: 15,
                children: room.followedBySpeakers
                    .map((e) => RoomUserImage(
                          name: e.firstName,
                          ImageUrl: e.imageURL,
                          size: 50,
                          isNew: Random().nextBool(),
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 30,
        ),
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                '✌️   Leave Quitly',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: TextButton.styleFrom(
                  padding: EdgeInsets.all(15),
                  backgroundColor: Colors.grey[400],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      CupertinoIcons.add,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      CupertinoIcons.hand_raised,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
