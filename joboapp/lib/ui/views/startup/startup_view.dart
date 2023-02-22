import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:jobo_ui_kit/jobo_ui_kit.dart';
import 'package:stacked/stacked.dart';
import 'package:joboapp/ui/common/ui_helpers.dart';

import 'startup_viewmodel.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    final theme = AppTheme.of(context);

    return Scaffold(
      backgroundColor: theme.colors.background,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 90,
              height: 90,
              child: Image.asset('assets/images/logo.png'),
            ),
            verticalSpaceSmall,
            SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                color: theme.colors.primary,
                strokeWidth: 6,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  StartupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StartupViewModel();

  @override
  void onViewModelReady(StartupViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
}
