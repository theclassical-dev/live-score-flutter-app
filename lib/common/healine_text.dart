import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:livescore/core/core.dart';

// ignore: must_be_immutable
class HeadlineText extends StatelessWidget {
  final String text;
  Color? color;
  double? fontsize;
  HeadlineText({super.key, required this.text, this.color, this.fontsize});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.aleo(
        fontSize: fontsize ?? AppLayout.getHeight(18),
        fontWeight: FontWeight.bold,
        color: color ?? Colors.black,
      ),
    );
  }
}
