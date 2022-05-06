import 'package:flutter/widgets.dart';
import 'package:jobo_ui_kit/src/theme/data/icons.dart';
import 'package:jobo_ui_kit/src/theme/theme.dart';

enum AppIconSize {
  small,
  regular,
  big,
}

extension AppIconsSizeExtension on AppIconSizeData {
  double resolve(AppIconSize size) {
    switch (size) {
      case AppIconSize.big:
        return big;
      case AppIconSize.regular:
        return regular;
      case AppIconSize.small:
        return small;
    }
  }
}

class AppIcon extends StatelessWidget {
  final IconData data;
  final Color? color;
  final AppIconSize size;
  const AppIcon(
    this.data, {
    Key? key,
    this.color,
  })  : size = AppIconSize.regular,
        super(key: key);

  const AppIcon.regular(
    this.data, {
    Key? key,
    this.color,
  })  : size = AppIconSize.regular,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final color = this.color ?? theme.colors.white;
    return Icon(
      data,
      color: color,
      size: theme.icons.sizes.resolve(size),
    );
  }
}
