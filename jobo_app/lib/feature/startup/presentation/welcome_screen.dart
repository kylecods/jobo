import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobo_ui_kit/jobo_ui_kit.dart';

class WelcomeScreen extends ConsumerStatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends ConsumerState<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Scaffold(
      backgroundColor: theme.colors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/welcome_image.png'),
            const SizedBox(
              height: 70,
            ),
            AppText.title1(
              "No More Hassle",
              color: theme.colors.white.withAlpha(255),
            ),
            AppText.title2(
              "Find the job of your dreams easily and fast",
              color: theme.colors.grey.withAlpha(255),
            ),
            const SizedBox(
              height: 100,
            ),
            AppButton(
              text: "Get Started",
              onTap: () => print("Hello"),
            )
          ],
        ),
      ),
    );
  }
}
