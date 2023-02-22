import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobo_ui_kit/jobo_ui_kit.dart';
import 'package:joboapp/app/app.bottomsheets.dart';
import 'package:joboapp/app/app.dialogs.dart';
import 'package:joboapp/app/app.locator.dart';
import 'package:joboapp/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

void main() {
  setupLocator();
  setupDialogUi();
  setupBottomSheetUi();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBase(
      appLogo: StringPicture(
        SvgPicture.svgStringDecoderBuilder,
        '<svg></svg>',
      ),
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
