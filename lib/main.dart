import 'package:flutter/material.dart';

import 'package:trying/constants.dart';
import 'package:trying/screens/Homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Club",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: kBackgroundcolor),
        scaffoldBackgroundColor: kBackgroundcolor,
        primaryColor: Colors.white,
        accentColor: kAccentcolor,
        iconTheme: IconThemeData(color: Colors.black),
        // fontFamily: GoogleFonts.montserrat().fontFamily,
        // textTheme: GoogleFonts.montserratTextTheme(),
      ),
      home: Homescreen(),
    );
  }
}
