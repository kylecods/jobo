import 'package:flutter/widgets.dart';
import 'package:jobo_ui_kit/jobo_ui_kit.dart';
import 'package:tap_builder/tap_builder.dart';

import 'app_button_layout.dart';
import 'app_button_states.dart';

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
    return TapBuilder(
        onTap: onTap,
        builder: (context, state, isFocused) {
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
          hoveredBackgroundColor: theme.colors.primary.withAlpha(130),
        );
      case AppButtonState.inactive:
        return AppButtonLayout.inactive(
          icon: icon,
          hoveredBackgroundColor: theme.colors.primary.withAlpha(255),
        );
      case AppButtonState.pressed:
        return AppButtonLayout.pressed(
          icon: icon,
          hoveredBackgroundColor: theme.colors.primary.withAlpha(120),
        );
      case AppButtonState.disabled:
        return AppButtonLayout.disabled(
          icon: icon,
          hoveredBackgroundColor: theme.colors.primary.withAlpha(120),
        );
    }
  }
}
