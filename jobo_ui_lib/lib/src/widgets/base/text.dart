import 'package:flutter/widgets.dart';
import 'package:jobo_ui_kit/src/theme/theme.dart';

enum AppTextLevel {
  text1,
  text2,
  text3,
  text4,
  title1,
  title2,
  title3,
}

class AppText extends StatelessWidget {
  final String data;
  final AppTextLevel level;
  final Color? color;
  final double? fontSize;
  final int? maxLines;
  const AppText(
    this.data, {
    Key? key,
    this.color,
    this.fontSize,
    this.maxLines,
    this.level = AppTextLevel.text1,
  }) : super(key: key);

  const AppText.text1(
    this.data, {
    Key? key,
    this.color,
    this.fontSize,
    this.maxLines,
  })  : level = AppTextLevel.text1,
        super(key: key);
  const AppText.text2(
    this.data, {
    Key? key,
    this.color,
    this.fontSize,
    this.maxLines,
  })  : level = AppTextLevel.text2,
        super(key: key);
  const AppText.text3(
    this.data, {
    Key? key,
    this.color,
    this.fontSize,
    this.maxLines,
  })  : level = AppTextLevel.text3,
        super(key: key);
  const AppText.text4(
    this.data, {
    Key? key,
    this.color,
    this.fontSize,
    this.maxLines,
  })  : level = AppTextLevel.text4,
        super(key: key);
  const AppText.title1(
    this.data, {
    Key? key,
    this.color,
    this.fontSize,
    this.maxLines,
  })  : level = AppTextLevel.title1,
        super(key: key);
  const AppText.title2(
    this.data, {
    Key? key,
    this.color,
    this.fontSize,
    this.maxLines,
  })  : level = AppTextLevel.title2,
        super(key: key);
  const AppText.title3(
    this.data, {
    Key? key,
    this.color,
    this.fontSize,
    this.maxLines,
  })  : level = AppTextLevel.title3,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final color = this.color ?? theme.colors.white;

    final style = () {
      switch (level) {
        case AppTextLevel.text1:
          return theme.typography.text1;
        case AppTextLevel.text2:
          return theme.typography.text2;
        case AppTextLevel.text3:
          return theme.typography.text3;
        case AppTextLevel.text4:
          return theme.typography.text4;
        case AppTextLevel.title1:
          return theme.typography.title1;
        case AppTextLevel.title2:
          return theme.typography.title2;
        case AppTextLevel.title3:
          return theme.typography.title3;
      }
    }();
    return Text(
      data,
      style: style.copyWith(
        color: color,
        fontSize: fontSize,
      ),
      maxLines: maxLines,
    );
  }
}
