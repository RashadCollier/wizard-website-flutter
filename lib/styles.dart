import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class ThemeText {
  static TextStyle title = TextStyle(
      fontFamily: GoogleFonts.sacramento().fontFamily,
      fontSize: 160,
      foreground: Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 4
        ..color = Colors.black,
      shadows: const [
        Shadow(
          color: Colors.white,
          blurRadius: 10,
        ),
        Shadow(
          color: Colors.black,
          blurRadius: 20,
          offset: Offset(-2, -2),
        ),
        Shadow(
          color: Colors.white,
          blurRadius: 10,
        ),
      ]);

  static TextStyle subtitle = TextStyle(
    fontFamily: GoogleFonts.roboto().fontFamily,
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 24,
  );

  static TextStyle descriptor = TextStyle(
    fontFamily: GoogleFonts.roboto().fontFamily,
    color: Colors.white,
    fontSize: 16,
  );
}
