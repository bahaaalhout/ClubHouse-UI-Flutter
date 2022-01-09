// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trying/data.dart';
import 'package:trying/widget/room_card.dart';
import 'package:trying/widget/user_profile_image.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.search,
            size: 28,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(
              CupertinoIcons.envelope_open,
              size: 25,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              CupertinoIcons.calendar,
              size: 25,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              CupertinoIcons.bell,
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
      body: Stack(
        alignment: Alignment.center,
        children: [
          ListView(
            padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
            children: [...roomList.map((e) => RoomCard(room: e))],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(.1),
                    Theme.of(context).scaffoldBackgroundColor,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.add,
                color: Colors.white,
                size: 20,
              ),
              label: Text(
                'Create Room',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                // ignore: deprecated_member_use
                primary: Theme.of(context).accentColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
