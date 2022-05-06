import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'images.dart';
import 'typography.dart';
import 'colors.dart';
import 'icons.dart';
import 'radius.dart';

class AppThemeData extends Equatable {
  final AppIconsData icons;
  final AppColorsData colors;
  final AppRadiusData radius;
  final AppImageData image;
  final AppTypographyData typography;
  final TargetPlatform? _platform;
  TargetPlatform get platform => defaultTargetPlatform;

  const AppThemeData({
    required this.icons,
    required this.colors,
    required this.radius,
    required this.image,
    required this.typography,
    TargetPlatform? platform,
  }) : _platform = platform;

  factory AppThemeData.main({
    required PictureProvider appLogo,
  }) =>
      AppThemeData(
        icons: AppIconsData.main(),
        colors: AppColorsData.main(),
        radius: const AppRadiusData.main(),
        image: AppImageData.main(appLogo: appLogo),
        typography: AppTypographyData.main(),
      );
  @override
  List<Object?> get props => [];
}
