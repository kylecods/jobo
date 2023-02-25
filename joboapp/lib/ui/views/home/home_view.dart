import 'package:flutter/material.dart';
import 'package:jobo_ui_kit/jobo_ui_kit.dart';
import 'package:joboapp/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    final theme = AppTheme.of(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 6,
        currentIndex: viewModel.currentIndex,
        selectedItemColor: theme.colors.white,
        unselectedItemColor: theme.colors.grey,
        onTap: viewModel.handleNavigation,
        backgroundColor: theme.colors.bottomNavbar,
        items: [
          BottomNavigationBarItem(
            icon: AppIcon.big(
              Icons.house_rounded,
              color: theme.colors.grey,
            ),
            activeIcon: AppIcon.big(
              Icons.house_rounded,
              color: theme.colors.white,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: AppIcon.big(
              Icons.person,
              color: theme.colors.grey,
            ),
            activeIcon: AppIcon.big(
              Icons.person,
              color: theme.colors.white,
            ),
            label: 'Profile',
          )
        ],
      ),
      backgroundColor: theme.colors.background,
      body: ExtendedNavigator(
        navigatorKey: StackedService.nestedNavigationKey(1),
        initialRoute: Routes.detailsPageView,
        router: StackedRouter(),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
