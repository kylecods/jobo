import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';

class AppRadiusData extends Equatable {
  final Radius small;
  final Radius regular;
  final Radius big;
  const AppRadiusData({
    required this.small,
    required this.regular,
    required this.big,
  });

  const AppRadiusData.main()
      : small = const Radius.circular(10),
        regular = const Radius.circular(12),
        big = const Radius.circular(20);

  AppBorderRadiusData asBorderRadius() => AppBorderRadiusData(this);

  @override
  List<Object?> get props => [
        small,
        regular,
        big,
      ];
}

class AppBorderRadiusData extends Equatable {
  final AppRadiusData _radius;
  const AppBorderRadiusData(this._radius);

  BorderRadius get small => BorderRadius.all(_radius.small);
  BorderRadius get regular => BorderRadius.all(_radius.regular);
  BorderRadius get large => BorderRadius.all(_radius.big);

  @override
  List<Object?> get props => [_radius];
}
