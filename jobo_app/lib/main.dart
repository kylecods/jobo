import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jobo_ui_kit/jobo_ui_kit.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBase(
      appLogo: StringPicture(
        SvgPicture.svgStringDecoderBuilder,
        '<svg></svg>',
      ),
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
  }

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            const TestWidget(),
      ),
    ],
  );
}

class TestWidget extends StatelessWidget {
  const TestWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = AppTheme.of(context);

    return Scaffold(
      backgroundColor: themeData.colors.grey,
      body: Center(
        child: AppButton(
          icon: themeData.icons.individualData.search,
          onTap: () {},
          text: "Test",
        ),
      ),
    );
  }
}
