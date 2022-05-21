import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobo_app/routing/router.dart';
import 'package:jobo_ui_kit/jobo_ui_kit.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routeProvider);
    return AppBase(
      appLogo: StringPicture(
        SvgPicture.svgStringDecoderBuilder,
        '<svg></svg>',
      ),
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    );
  }
}
