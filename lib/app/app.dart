import 'package:app/views/Homeview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Flutter Learn",
        theme: ThemeData(
            primarySwatch: Colors.deepOrange,
            fontFamily: GoogleFonts.dmSans().fontFamily),
        home: Homeview());
  }
}
