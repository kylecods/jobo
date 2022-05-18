import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobo_ui_kit/jobo_ui_kit.dart';
import 'package:jobo_ui_kit/src/theme/data/data.dart';

class AppAdaptiveTheme extends StatelessWidget {
  final PictureProvider appLogo;
  final Widget child;
  const AppAdaptiveTheme({
    Key? key,
    required this.appLogo,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = AppThemeData.main(appLogo: appLogo);

    return AppTheme(
      data: theme,
      child: child,
    );
  }
}
