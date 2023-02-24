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
        onTap: viewModel.handleNavigation,
        backgroundColor: theme.colors.bottomNavbar,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.house_rounded,
              color: theme.colors.white,
            ),
            activeIcon: Icon(
              Icons.house_rounded,
              color: theme.colors.grey,
            ),
            label: 'Home',
            backgroundColor: theme.colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_2_rounded,
              color: theme.colors.white,
            ),
            activeIcon: Icon(
              Icons.person_2_rounded,
              color: theme.colors.grey,
            ),
            label: 'Profile',
            backgroundColor: theme.colors.white,
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

// class home extends StatelessWidget {
//   const home({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 25.0),
//         child: Center(
//           child: Column(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               verticalSpaceLarge,
//               Column(
//                 children: [
//                   const Text(
//                     'Hello, JOBO!',
//                     style: TextStyle(
//                       fontSize: 35,
//                       fontWeight: FontWeight.w900,
//                     ),
//                   ),
//                   verticalSpaceMedium,
//                   MaterialButton(
//                     color: Colors.black,
//                     onPressed: viewModel.incrementCounter,
//                     child: Text(
//                       viewModel.counterLabel,
//                       style: const TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   MaterialButton(
//                     color: kcDarkGreyColor,
//                     child: const Text(
//                       'Show Dialog',
//                       style: TextStyle(
//                         color: Colors.white,
//                       ),
//                     ),
//                     onPressed: viewModel.showDialog,
//                   ),
//                   MaterialButton(
//                     color: kcDarkGreyColor,
//                     child: const Text(
//                       'Show Bottom Sheet',
//                       style: TextStyle(
//                         color: Colors.white,
//                       ),
//                     ),
//                     onPressed: viewModel.showBottomSheet,
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
