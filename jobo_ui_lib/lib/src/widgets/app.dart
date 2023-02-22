import 'package:flutter/material.dart' as material;
import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobo_ui_kit/jobo_ui_kit.dart';
import 'package:jobo_ui_kit/src/theme/adaptive_theme.dart';

class AppBase extends StatelessWidget {
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final bool debugShowCheckedModeBanner;
  final String title;
  final PictureProvider appLogo;
  final BackButtonDispatcher? backButtonDispatcher;
  final RouteInformationParser<Object>? routeInformationParser;
  final RouterDelegate<Object>? routerDelegate;
  final String? initialRoute;
  final RouteFactory? onGenerateRoute;
  final GlobalKey<NavigatorState>? navigatorKey;
  final List<NavigatorObserver>? navigatorObservers;

  final bool enableRouter;

  const AppBase({
    Key? key,
    required this.appLogo,
    this.initialRoute,
    this.onGenerateRoute,
    List<NavigatorObserver> this.navigatorObservers =
        const <NavigatorObserver>[],
    this.navigatorKey,
    this.routeInformationParser,
    this.routerDelegate,
    this.debugShowCheckedModeBanner = false,
    this.title = '',
    this.localizationsDelegates,
    this.backButtonDispatcher,
    this.enableRouter = false,
  }) : super(key: key);

  Iterable<LocalizationsDelegate<dynamic>> get _localizationsDelegates sync* {
    if (localizationsDelegates != null) yield* localizationsDelegates!;
    yield material.DefaultMaterialLocalizations.delegate;
    yield cupertino.DefaultCupertinoLocalizations.delegate;
  }

  @override
  Widget build(BuildContext context) {
    return AppAdaptiveTheme(
      appLogo: appLogo,
      child: Builder(
        builder: (context) {
          final theme = AppTheme.of(context);
          return enableRouter
              ? WidgetsApp.router(
                  key: GlobalObjectKey(this),
                  debugShowCheckedModeBanner: debugShowCheckedModeBanner,
                  routeInformationParser: routeInformationParser,
                  routerDelegate: routerDelegate,
                  color: theme.colors.background,
                  title: title,
                  localizationsDelegates: _localizationsDelegates,
                  textStyle: theme.typography.text1.copyWith(
                    color: theme.colors.white.withAlpha(255),
                  ),
                )
              : WidgetsApp(
                  key: GlobalObjectKey(this),
                  debugShowCheckedModeBanner: debugShowCheckedModeBanner,
                  initialRoute: initialRoute,
                  onGenerateRoute: onGenerateRoute,
                  navigatorKey: navigatorKey,
                  navigatorObservers: navigatorObservers ?? [],
                  color: theme.colors.background,
                  title: title,
                  localizationsDelegates: _localizationsDelegates,
                  textStyle: theme.typography.text1.copyWith(
                    color: theme.colors.white.withAlpha(255),
                  ),
                );
        },
      ),
    );
  }
}
