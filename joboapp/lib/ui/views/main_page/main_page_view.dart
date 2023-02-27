import 'package:flutter/material.dart';
import 'package:jobo_ui_kit/jobo_ui_kit.dart';
import 'package:stacked/stacked.dart';

import '../../../models/jobs_model.dart';
import 'main_page_viewmodel.dart';

class MainPageView extends StackedView<MainPageViewModel> {
  const MainPageView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MainPageViewModel viewModel,
    Widget? child,
  ) {
    final theme = AppTheme.of(context);
    final _jobs = viewModel.jobs?.jobs;
    return Scaffold(
      backgroundColor: theme.colors.background,
      body: Container(
        padding: const EdgeInsets.all(25),
        child: Center(
          child: !viewModel.isBusy
              ? ListItems(
                  jobs: _jobs,
                  model: viewModel,
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
  MainPageViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MainPageViewModel();

  @override
  void onViewModelReady(MainPageViewModel viewModel) => viewModel.updateStuff();
}

class ListItems extends StatelessWidget {
  const ListItems({
    super.key,
    required List<JobsResponse>? jobs,
    required this.model,
  }) : _jobs = jobs;

  final List<JobsResponse>? _jobs;
  final MainPageViewModel model;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return _jobs != null
        ? ListView.builder(
            itemCount: _jobs!.length,
            itemBuilder: (context, index) {
              final item = _jobs![index];

              return ListTile(
                onTap: model.showDialog,
                title: AppText.title2(item.name),
                subtitle: AppText.text1(item.jobDescription),
                trailing: AppIcon.big(
                  Icons.arrow_forward_ios_rounded,
                  color: theme.colors.white,
                ),
              );
            },
          )
        : AppText.title3(
            'No Data',
            color: theme.colors.white,
          );
  }
}
