import 'package:flutter/material.dart';

import 'package:jobo_ui_kit/jobo_ui_kit.dart';

class Category extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const Category({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppText.title2(title),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: children,
        )
      ],
    );
  }
}

class Section extends StatelessWidget {
  final String title;
  final List<Category> categories;
  const Section({
    Key? key,
    required this.title,
    required this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);

    return Column(
      children: [
        AppText.title1(
          title,
          color: theme.colors.primary,
        ),
        ...categories,
      ],
    );
  }
}

class Cell<T> extends StatelessWidget {
  const Cell({
    Key? key,
    required this.value,
    required this.builder,
  }) : super(key: key);
  final T value;
  final ValueWidgetBuilder<T> builder;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: theme.colors.background.withAlpha(125),
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          child: builder(context, value, null),
        ),
      ],
    );
  }
}
