import 'package:flutter/material.dart';
import 'package:trying/models/user.dart';

class Room {
  final String club;
  final String name;
  final List<User> speakers;
  final List<User> followedBySpeakers;
  final List<User> Others;

  Room({
    required this.club,
    required this.name,
    this.speakers = const [],
    this.followedBySpeakers = const [],
    this.Others = const [],
  });
}
