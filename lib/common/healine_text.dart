import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:livescore/core/core.dart';

class HeadlineText extends StatelessWidget {
  final String text;
  const HeadlineText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.aleo(
        fontSize: AppLayout.getHeight(18),
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }
}
