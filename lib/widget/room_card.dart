import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trying/models/room.dart';
import 'package:trying/screens/Room_screen.dart';
import 'package:trying/widget/user_profile_image.dart';

class RoomCard extends StatelessWidget {
  final Room room;
  const RoomCard({Key? key, required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          fullscreenDialog: true, builder: (_) => RoomScreen(room: room))),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${room.club} 🏠'.toUpperCase(),
                style: Theme.of(context).textTheme.overline!.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    letterSpacing: .1),
              ),
              Text(
                room.name,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    height: 100,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: UserProfileImage(
                              ImageUrl: room.speakers[0].imageURL, size: 50),
                        ),
                        Positioned(
                          left: 24,
                          top: 25,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: UserProfileImage(
                                ImageUrl: room.speakers[1].imageURL, size: 50),
                          ),
                        ),
                      ],
                    ),
                  )),
                  Expanded(
                      flex: 2,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...room.speakers.map((e) => Text(
                                  ' ${e.firstName} ${e.lastName} 💬',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(fontSize: 16),
                                )),
                            SizedBox(
                              height: 7,
                            ),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                      text:
                                          '${room.speakers.length + room.followedBySpeakers.length + room.Others.length}  '),
                                  WidgetSpan(
                                      child: Icon(
                                    CupertinoIcons.person_fill,
                                    size: 15,
                                    color: Colors.grey,
                                  )),
                                  TextSpan(
                                      text: ' / ${room.speakers.length}  '),
                                  WidgetSpan(
                                      child: Icon(
                                    CupertinoIcons.chat_bubble_fill,
                                    size: 15,
                                    color: Colors.grey,
                                  )),
                                ],
                              ),
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
