import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jobo_app/feature/startup/presentation/splash_screen.dart';

import '../feature/startup/presentation/welcome_screen.dart';

final routeProvider = Provider<GoRouter>((ref) {
  final router = RouterNotifier(ref);

  return GoRouter(
    routes: router._routes,
    debugLogDiagnostics: true,
    refreshListenable: router,
    redirect: router._redirectLogic,
  );
});

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  RouterNotifier(this._ref);

  String? _redirectLogic(GoRouterState state) {
    return null;
  }

  List<GoRoute> get _routes => [
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) =>
              const SplashScreen(),
        ),
        GoRoute(
          path: '/welcome',
          builder: (BuildContext context, GoRouterState state) =>
              const WelcomeScreen(),
        ),
      ];
}
