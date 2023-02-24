import 'package:flutter/widgets.dart';
import 'package:jobo_ui_kit/jobo_ui_kit.dart';
import 'package:tap_builder/tap_builder.dart';

class AppButton extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final VoidCallback? onTap;
  final MainAxisSize mainAxisSize;
  const AppButton({
    Key? key,
    this.icon,
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
                text: text,
                mainAxisSize: mainAxisSize,
              ),
            );
          default:
            return Semantics(
              enabled: true,
              selected: true,
              child: AppButtonLayout.inactive(
                icon: icon,
                text: text,
                mainAxisSize: mainAxisSize,
              ),
            );
        }
      },
    );
  }
}

enum AppButtonState {
  hovered,
  pressed,
  inactive,
}

class AppButtonLayout extends StatelessWidget {
  const AppButtonLayout.inactive({
    Key? key,
    this.icon,
    this.text,
    this.mainAxisSize = MainAxisSize.min,
    this.inactiveBackgroundColor,
    this.hoveredBackgroundColor,
    this.pressedBackgroundColor,
    this.primary,
  })  : _state = AppButtonState.inactive,
        assert(icon != null),
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
  })  : _state = AppButtonState.hovered,
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
  })  : _state = AppButtonState.pressed,
        assert(text != null),
        super(key: key);

  final IconData? icon;
  final String? text;
  final MainAxisSize mainAxisSize;
  final AppButtonState _state;
  final Color? inactiveBackgroundColor;
  final Color? hoveredBackgroundColor;
  final Color? pressedBackgroundColor;
  final Color? primary;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final text = this.text;
    final icon = this.icon;
    final hasBoth = (text != null && icon != null);
    final primary = this.primary ?? theme.colors.white.withAlpha(255);
    final backgroundColor = () {
      switch (_state) {
        case AppButtonState.inactive:
          return inactiveBackgroundColor ??
              theme.colors.primary.withAlpha(255); //TODO: experiment
        case AppButtonState.hovered:
          return hoveredBackgroundColor ??
              theme.colors.primary.withAlpha(255); //TODO: experiment
        case AppButtonState.pressed:
          return pressedBackgroundColor ??
              theme.colors.primary.withAlpha(255); //TODO: experiment
      }
    }();

    return AnimatedContainer(
      duration: Duration.zero,
      decoration: BoxDecoration(
        borderRadius: theme.radius.asBorderRadius().small,
        color: backgroundColor,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (text != null)
            AppText.text1(
              text,
              color: primary.withAlpha(255),
            ),
          if (hasBoth)
            const SizedBox(
              width: 5.0,
            ),
          if (icon != null) AppIcon.regular(icon, color: primary),
        ],
      ),
    );
  }
}
