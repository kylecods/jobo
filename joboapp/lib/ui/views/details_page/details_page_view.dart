import 'package:flutter/material.dart';
import 'package:jobo_ui_kit/jobo_ui_kit.dart';
import 'package:stacked/stacked.dart';

import '../../common/ui_helpers.dart';
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              viewModel.isBusy
                  ? CircularProgressIndicator(
                      color: theme.colors.primary,
                      strokeWidth: 5,
                    )
                  : AppText.text1(
                      viewModel.token,
                      color: theme.colors.white,
                    ),
              horizontalSpaceSmall,
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colors.primary),
                onPressed: viewModel.getToken,
                icon: const Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                label: const Text(
                  "Generate Token",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
            ],
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
