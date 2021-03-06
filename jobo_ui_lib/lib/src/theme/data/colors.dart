import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';

class AppColorsData extends Equatable {
  final Color background;
  final Color primary;
  final Color grey;
  final Color white;
  final Color bottomNavbar;

  const AppColorsData({
    required this.white,
    required this.background,
    required this.primary,
    required this.grey,
    required this.bottomNavbar,
  });

  factory AppColorsData.main() => const AppColorsData(
        white: Color(0x00ffffff),
        background: Color(0x00000000),
        primary: Color(0x0011A191),
        grey: Color(0x007B7B7B),
        bottomNavbar: Color(0x000C0B0B),
      );
  @override
  List<Object?> get props => [
        background,
        primary,
        grey,
        white,
        bottomNavbar,
      ];
}
