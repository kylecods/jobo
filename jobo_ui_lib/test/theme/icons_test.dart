import 'package:flutter/material.dart';
import 'package:jobo_ui_kit/jobo_ui_kit.dart';

import 'base.dart';

Section icons(BuildContext context) {
  final theme = AppTheme.of(context);
  return Section(
    title: "Colors",
    categories: [
      Category(
        title: "Test",
        children: [
          ...theme.icons.individualData.props.map<Widget>(
            (e) {
              return Cell(
                value: e as IconData,
                builder: (context, IconData v, _) => AppIcon(
                  v,
                  color: theme.colors.background.withAlpha(255),
                ),
              );
            },
          ),
        ],
      ),
    ],
  );
}
