import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:jobo_ui_kit/jobo_ui_kit.dart';
import 'package:stacked/stacked.dart';

import 'profile_page_viewmodel.dart';

class ProfilePageView extends StackedView<ProfilePageViewModel> {
  const ProfilePageView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProfilePageViewModel viewModel,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            !viewModel.isBusy
                ? AppButton(
                    text: "Download me",
                    icon: Icons.download,
                    onTap: () {},
                  )
                : CircularProgressIndicator(
                    color: theme.colors.primary,
                    strokeWidth: 6,
                  ),
          ],
        )),
      ),
    );
  }

  @override
  ProfilePageViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProfilePageViewModel();

  @override
  Future onViewModelReady(ProfilePageViewModel viewModel) =>
      viewModel.longUpdateStuff();
}
