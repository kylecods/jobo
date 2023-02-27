import 'package:flutter/widgets.dart';

import '../../theme/theme.dart';
import '../base/icon.dart';
import '../base/text.dart';
import 'app_button_states.dart';

class AppButtonLayout extends StatelessWidget {
  final IconData? icon;
  final Widget? widgetIcon;
  final String? text;
  final MainAxisSize mainAxisSize;

  final AppButtonState _state;
  final Color? inactiveBackgroundColor;
  final Color? hoveredBackgroundColor;
  final Color? pressedBackgroundColor;
  final Color? primary;
  const AppButtonLayout.disabled({
    Key? key,
    this.icon,
    this.text,
    this.mainAxisSize = MainAxisSize.min,
    this.inactiveBackgroundColor,
    this.hoveredBackgroundColor,
    this.pressedBackgroundColor,
    this.primary,
    this.widgetIcon,
  })  : _state = AppButtonState.disabled,
        assert(text != null),
        super(key: key);
  const AppButtonLayout.hovered({
    Key? key,
    this.icon,
    this.text,
    this.mainAxisSize = MainAxisSize.min,
    this.inactiveBackgroundColor,
    this.hoveredBackgroundColor,
    this.pressedBackgroundColor,
    this.primary,
    this.widgetIcon,
  })  : _state = AppButtonState.hovered,
        assert(text != null),
        super(key: key);
  const AppButtonLayout.inactive({
    Key? key,
    this.icon,
    this.text,
    this.mainAxisSize = MainAxisSize.min,
    this.inactiveBackgroundColor,
    this.hoveredBackgroundColor,
    this.pressedBackgroundColor,
    this.primary,
    this.widgetIcon,
  })  : _state = AppButtonState.inactive,
        assert(text != null),
        super(key: key);
  const AppButtonLayout.pressed({
    Key? key,
    this.icon,
    this.text,
    this.mainAxisSize = MainAxisSize.min,
    this.inactiveBackgroundColor,
    this.hoveredBackgroundColor,
    this.pressedBackgroundColor,
    this.primary,
    this.widgetIcon,
  })  : _state = AppButtonState.pressed,
        assert(text != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final text = this.text;
    final icon = this.icon;
    final hasBoth = (text != null && icon != null);
    final primary = this.primary ?? theme.colors.white.withAlpha(255);
    final backgroundColor = () {
      switch (_state) {
        case AppButtonState.disabled:
          return theme.colors.primary.withAlpha(50);
        case AppButtonState.inactive:
          return inactiveBackgroundColor ?? theme.colors.primary.withAlpha(255);
        case AppButtonState.hovered:
          return hoveredBackgroundColor ?? theme.colors.primary.withAlpha(130);
        case AppButtonState.pressed:
          return pressedBackgroundColor ?? theme.colors.primary.withAlpha(120);
      }
    }();

    return AnimatedContainer(
      duration: Duration.zero,
      decoration: BoxDecoration(
        borderRadius: theme.radius.asBorderRadius().regular,
        color: backgroundColor,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: mainAxisSize,
        children: [
          icon != null
              ? AppIcon.regular(
                  icon,
                  color: primary,
                )
              : widgetIcon ?? const SizedBox(),
          if (hasBoth)
            const SizedBox(
              width: 5.0,
            ),
          if (text != null)
            AppText.text1(
              text,
              color: primary.withAlpha(255),
            ),
        ],
      ),
    );
  }
}
