import 'package:flutter/material.dart';

import 'data/data.dart';

class AppTheme extends InheritedWidget {
  final AppThemeData data;

  const AppTheme({Key? key, required this.data, required Widget child})
      : super(
          key: key,
          child: child,
        );

  static AppThemeData of(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<AppTheme>();

    return widget!.data;
  }

  @override
  bool updateShouldNotify(covariant AppTheme oldWidget) {
    return data != oldWidget.data;
  }
}
