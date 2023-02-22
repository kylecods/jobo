import 'package:flutter/material.dart';
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
    return Scaffold(
      backgroundColor: Colors.black45,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              viewModel.isBusy
                  ? const CircularProgressIndicator(
                      color: Colors.green,
                      strokeWidth: 5,
                    )
                  : Text(
                      viewModel.token,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
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
