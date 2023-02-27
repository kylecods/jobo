import 'package:flutter/material.dart';
import 'package:jobo_ui_kit/jobo_ui_kit.dart';
import 'package:jobo_ui_kit/src/widgets/button/app_button_layout.dart';
import 'package:tap_builder/tap_builder.dart';

// ignore: must_be_immutable
class AppLoadingButton extends StatelessWidget {
  final bool isBusy;
  final VoidCallback onTap;
  final String text;
  late Widget? widgetIcon = const SizedBox();
  final MainAxisSize mainAxisSize;
  AppLoadingButton({
    super.key,
    required this.text,
    required this.onTap,
    this.isBusy = false,
    required this.mainAxisSize,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);

    return TapBuilder(
      onTap: onTap,
      builder: (context, state, hasFocus) {
        if (isBusy) {
          state = TapState.disabled;
          widgetIcon = Row(
            children: [
              SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: theme.colors.white,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
            ],
          );
        }
        switch (state) {
          case TapState.hover:
            return Semantics(
              enabled: true,
              selected: true,
              child: AppButtonLayout.hovered(
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
