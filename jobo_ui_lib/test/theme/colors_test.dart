import 'package:flutter/material.dart';
import 'package:jobo_ui_kit/jobo_ui_kit.dart';

import 'base.dart';

Section colors(BuildContext context) {
  final theme = AppTheme.of(context);
  return Section(
    title: "Colors",
    categories: [
      Category(
        title: "Test",
        children: [
          ...theme.colors.props.map<Widget>(
            (e) {
              return Cell(
                value: e as Color,
                builder: (context, Color v, _) => Container(
                  height: 32,
                  width: 32,
                  padding: const EdgeInsets.all(4),
                  color: v.withAlpha(125),
                ),
              );
            },
          ),
        ],
      ),
    ],
  );
}
