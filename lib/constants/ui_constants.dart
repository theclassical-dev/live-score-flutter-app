import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:livescore/theme/theme.dart';

class UIConstants {
  static AppBar appBar() {
    return AppBar(
      leading: const Padding(
        padding: EdgeInsets.all(10),
        child: CircleAvatar(
          // radius: 10,
          backgroundColor: Pallete.greyColor,
          child: Icon(
            Icons.person,
            color: Pallete.whiteColor,
          ),
        ),
      ),
      title: Text(
        'SCORELINE',
        style: GoogleFonts.acme(color: Colors.black54, fontSize: 15),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: CircleAvatar(
            // radius: 10,
            backgroundColor: Colors.transparent,
            child: Icon(
              Icons.search,
              color: Pallete.greyColor,
            ),
          ),
        ),
      ],
      centerTitle: true,
    );
  }

  static List<Widget> bottomTabBarPages = [
    const Text(
      'first screen',
      style: TextStyle(color: Colors.black),
    ),
    const Text('second screen'),
    const Text('third screen'),
  ];
}
