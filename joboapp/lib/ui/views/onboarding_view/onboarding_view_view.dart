import 'package:flutter/material.dart';
import 'package:jobo_ui_kit/jobo_ui_kit.dart';
import 'package:stacked/stacked.dart';
import 'package:lottie/lottie.dart';

import 'onboarding_view_viewmodel.dart';

class OnboardingViewView extends StackedView<OnboardingViewViewModel> {
  const OnboardingViewView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    OnboardingViewViewModel viewModel,
    Widget? child,
  ) {
    final theme = AppTheme.of(context);
    return Scaffold(
      backgroundColor: theme.colors.background,
      body: Container(
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('assets/images/job.json'),
              const SizedBox(
                height: 70,
              ),
              AppText.title1(
                "No More Hassle",
                color: theme.colors.white,
              ),
              AppText.title2(
                "Find the job of your dreams easily and fast",
                color: theme.colors.grey,
              ),
              const SizedBox(
                height: 100,
              ),
              AppButton(
                text: "Get Started",
                onTap: viewModel.navigateToHomeView,
                mainAxisSize: MainAxisSize.max,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  OnboardingViewViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OnboardingViewViewModel();
}
