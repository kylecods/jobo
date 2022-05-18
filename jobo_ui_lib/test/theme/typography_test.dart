import 'package:flutter/material.dart';
import 'package:jobo_ui_kit/jobo_ui_kit.dart';

import 'base.dart';

Section typography(BuildContext context) {
  final theme = AppTheme.of(context);
  return Section(
    title: "Colors",
    categories: [
      Category(
        title: "Test",
        children: [
          ...theme.typography.props.map<Widget>(
            (e) {
              return Cell(
                value: e as TextStyle,
                builder: (context, TextStyle v, _) => Text(
                  'Name',
                  style:
                      e.copyWith(color: theme.colors.background.withAlpha(125)),
                ),
              );
            },
          ),
        ],
      ),
    ],
  );
}
