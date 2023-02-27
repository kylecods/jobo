import 'package:flutter/material.dart';
import 'package:jobo_ui_kit/jobo_ui_kit.dart';
import 'package:stacked/stacked.dart';
import 'package:lottie/lottie.dart';

import 'details_page_viewmodel.dart';

class DetailsPageView extends StackedView<DetailsPageViewModel> {
  const DetailsPageView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DetailsPageViewModel viewModel,
    Widget? child,
  ) {
    final theme = AppTheme.of(context);

    return Scaffold(
      backgroundColor: theme.colors.background,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Center(
          child: AppText.title2(
            "DETAILS COMING SOON",
            color: theme.colors.white,
          ),
        ),
      ),
    );
  }

  @override
  DetailsPageViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DetailsPageViewModel();
}
