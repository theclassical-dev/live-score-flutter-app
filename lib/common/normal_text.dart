import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:livescore/core/app_layout.dart';

class NormalText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? color;
  const NormalText({
    super.key,
    required this.text,
    required this.fontSize,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.aleo(
          fontSize: AppLayout.getHeight(fontSize), color: color),
    );
  }
}
