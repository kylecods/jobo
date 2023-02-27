import 'package:flutter/material.dart';
import 'package:jobo_ui_kit/jobo_ui_kit.dart';
import 'package:stacked/stacked.dart';

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
          child: !viewModel.isBusy
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    viewModel.busy("token")
                        ? CircularProgressIndicator(
                            color: theme.colors.primary,
                            strokeWidth: 5,
                          )
                        : viewModel.hasErrorForKey("token")
                            ? AppText.text1(
                                "Something went horribly wrong",
                                color: theme.colors.white,
                              )
                            : AppText.text1(
                                viewModel.token,
                                color: theme.colors.white,
                              ),
                    AppTextField(
                      controller: TextEditingController(),
                      onTap: () {},
                      placeholder: "Enter text",
                    ),
                    AppLoadingButton(
                      text: "Generate Token",
                      onTap: viewModel.getToken,
                      mainAxisSize: MainAxisSize.max,
                      isBusy: viewModel.busy("token"),
                    )
                  ],
                )
              : CircularProgressIndicator(
                  color: theme.colors.primary,
                  strokeWidth: 5,
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

  @override
  void onViewModelReady(DetailsPageViewModel viewModel) => viewModel.loadData();
}
