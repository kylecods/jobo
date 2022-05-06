import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypographyData extends Equatable {
  const AppTypographyData({
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.title1,
    required this.title2,
    required this.title3,
  });

  factory AppTypographyData.main() => AppTypographyData(
        text1: GoogleFonts.nunitoSans(
          fontWeight: FontWeight.normal,
          fontSize: 14,
          decoration: TextDecoration.none,
        ),
        text2: GoogleFonts.nunitoSans(
          fontWeight: FontWeight.normal,
          fontSize: 10,
          decoration: TextDecoration.none,
        ),
        text3: GoogleFonts.nunitoSans(
          fontWeight: FontWeight.w200,
          fontSize: 11,
          decoration: TextDecoration.none,
        ),
        text4: GoogleFonts.nunitoSans(
          fontWeight: FontWeight.normal,
          fontSize: 12,
          decoration: TextDecoration.none,
        ),
        title1: GoogleFonts.nunitoSans(
          fontWeight: FontWeight.bold,
          fontSize: 48,
          decoration: TextDecoration.none,
        ),
        title2: GoogleFonts.nunitoSans(
          fontWeight: FontWeight.normal,
          fontSize: 18,
          decoration: TextDecoration.none,
        ),
        title3: GoogleFonts.nunitoSans(
          fontWeight: FontWeight.normal,
          fontSize: 18,
          decoration: TextDecoration.none,
        ),
      );

  final TextStyle text1;
  final TextStyle text2;
  final TextStyle text3;
  final TextStyle text4;
  final TextStyle title1;
  final TextStyle title2;
  final TextStyle title3;

  @override
  List<Object?> get props => [
        text1,
        text2,
        text3,
        text4,
        title1,
        title2,
        title3,
      ];
}
