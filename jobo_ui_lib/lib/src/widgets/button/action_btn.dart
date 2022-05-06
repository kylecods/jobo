import 'package:flutter/widgets.dart';
import 'package:jobo_ui_kit/jobo_ui_kit.dart';
import 'package:tap_builder/tap_builder.dart';

class AppActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  const AppActionButton({
    Key? key,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TapBuilder(builder: (context, state, isFocused) {
      switch (state) {
        case TapState.hover:
        case TapState.pressed:
        default:
          return AppActionButtonLayout.inactive(
            icon: icon,
          );
      }
    });
  }
}

class AppActionButtonLayout extends StatelessWidget {
  final IconData icon;
  final AppButtonState _state;
  const AppActionButtonLayout.inactive({
    Key? key,
    required this.icon,
  })  : _state = AppButtonState.inactive,
        super(key: key);

  const AppActionButtonLayout.hovered({
    Key? key,
    required this.icon,
  })  : _state = AppButtonState.hovered,
        super(key: key);

  const AppActionButtonLayout.pressed({
    Key? key,
    required this.icon,
  })  : _state = AppButtonState.pressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    switch (_state) {
      case AppButtonState.hovered:
        return AppButtonLayout.hovered(
          icon: icon,
          hoveredBackgroundColor: theme.colors.primary.withOpacity(0.15),
        );
      case AppButtonState.inactive:
        return AppButtonLayout.inactive(
          icon: icon,
          hoveredBackgroundColor: theme.colors.primary.withOpacity(0),
        );
      case AppButtonState.pressed:
        return AppButtonLayout.pressed(
          icon: icon,
          hoveredBackgroundColor: theme.colors.primary.withOpacity(0.20),
        );
    }
  }
}
