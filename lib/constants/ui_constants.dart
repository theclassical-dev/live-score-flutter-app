import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:livescore/features/match/view/matches.dart';
import 'package:livescore/theme/theme.dart';

class UIConstants {
  static AppBar appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Row(
          children: [
            Expanded(
              child: Text(
                'SCORELINE',
                style: GoogleFonts.acme(color: Pallete.blueColor, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Pallete.whiteColor,
                radius: 17,
                child: Icon(
                  Icons.search,
                  color: Pallete.blueColor,
                ),
              ),
              SizedBox(width: 10),
              CircleAvatar(
                backgroundColor: Pallete.whiteColor,
                radius: 17,
                child: Icon(
                  Icons.notification_add_outlined,
                  color: Pallete.blueColor,
                ),
              ),
            ],
          ),
        ),
      ],
      // centerTitle: false,
    );
  }

  static List<Widget> bottomTabBarPages = [
    const MatchView(),
    const Text('second screen', style: TextStyle(color: Colors.black)),
    const Text('third screen', style: TextStyle(color: Colors.black)),
    const Text('fourth screen', style: TextStyle(color: Colors.black)),
    const Text('fifth screen', style: TextStyle(color: Colors.black)),
  ];
}
