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
        white: Color.fromARGB(255, 255, 255, 255),
        background: Color.fromARGB(255, 17, 16, 16),
        primary: Color.fromARGB(214, 22, 167, 150),
        grey: Color.fromARGB(129, 202, 202, 202),
        bottomNavbar: Color.fromARGB(249, 0, 0, 0),
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
