import 'package:flutter/widgets.dart';
import 'package:tap_builder/tap_builder.dart';

import 'app_button_layout.dart';

class AppButton extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final Widget? widgetIcon;
  final VoidCallback? onTap;
  final MainAxisSize mainAxisSize;
  const AppButton({
    Key? key,
    this.icon,
    this.widgetIcon,
    this.text,
    this.onTap,
    this.mainAxisSize = MainAxisSize.min,
  })  : assert(
          text != null,
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TapBuilder(
      onTap: onTap,
      builder: (context, state, hasFocus) {
        switch (state) {
          case TapState.hover:
            return Semantics(
              enabled: true,
              selected: true,
              child: AppButtonLayout.hovered(
                icon: icon,
                widgetIcon: widgetIcon,
                text: text,
                mainAxisSize: mainAxisSize,
              ),
            );
          case TapState.pressed:
            return Semantics(
              enabled: true,
              selected: true,
              child: AppButtonLayout.pressed(
                icon: icon,
                widgetIcon: widgetIcon,
                text: text,
                mainAxisSize: mainAxisSize,
              ),
            );
          case TapState.disabled:
            return Semantics(
              enabled: false,
              selected: false,
              child: AppButtonLayout.disabled(
                icon: icon,
                widgetIcon: widgetIcon,
                text: text,
                mainAxisSize: mainAxisSize,
              ),
            );
          default:
            return Semantics(
              enabled: false,
              selected: false,
              child: AppButtonLayout.inactive(
                icon: icon,
                widgetIcon: widgetIcon,
                text: text,
                mainAxisSize: mainAxisSize,
              ),
            );
        }
      },
    );
  }
}
