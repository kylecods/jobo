import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppImageData extends Equatable {
  final PictureProvider appLogo;
  final ImageProvider intro;

  const AppImageData({
    required this.appLogo,
    required this.intro,
  });

  factory AppImageData.main({required PictureProvider appLogo}) => AppImageData(
        appLogo: appLogo,
        intro: const AssetImage(
          'assets/images/get_started.png',
          package: 'jobo_ui_kit',
        ),
      );

  @override
  List<Object?> get props => [
        appLogo,
        intro,
      ];
}
