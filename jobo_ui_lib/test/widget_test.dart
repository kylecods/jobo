// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:jobo_ui_kit/jobo_ui_kit.dart';
import 'package:jobo_ui_kit/src/theme/adaptive_theme.dart';
import 'package:jobo_ui_kit/src/theme/data/data.dart';

import 'theme/colors_test.dart';
import 'theme/icons_test.dart';
import 'theme/typography_test.dart';

void main() {
  testWidgets('Theme Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    final key = UniqueKey();
    await tester.pumpWidget(Row(
      key: key,
      textDirection: TextDirection.ltr,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: TestWidget(),
        )
      ],
    ));

    await expectLater(
      find.byKey(key),
      matchesGoldenFile('result/theme.png'),
    );
  });
}

class TestWidget extends StatelessWidget {
  const TestWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = AppThemeData.main(
      appLogo: StringPicture(
        SvgPicture.svgStringDecoderBuilder,
        '<svg></svg>',
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AppAdaptiveTheme(
        appLogo: StringPicture(
          SvgPicture.svgStringDecoderBuilder,
          '<svg></svg>',
        ),
        child: Builder(
          builder: (context) {
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    colors(context),
                    typography(context),
                    icons(context),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
