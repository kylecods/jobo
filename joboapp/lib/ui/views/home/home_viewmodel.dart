import 'package:joboapp/app/app.locator.dart';
import 'package:joboapp/ui/views/main_page/main_page_view.dart';
import 'package:joboapp/ui/views/profile_page/profile_page_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends IndexTrackingViewModel {
  final _navigationService = locator<NavigationService>();
  void handleNavigation(int index) {
    setIndex(index);
    switch (index) {
      case 0:
        _navigationService.replaceWithTransition(
          const MainPageView(),
          transitionStyle:
              reverse ? Transition.rightToLeft : Transition.leftToRight,
          id: 1,
        );
        break;
      case 1:
        _navigationService.replaceWithTransition(
          const ProfilePageView(),
          transitionStyle:
              reverse ? Transition.rightToLeft : Transition.leftToRight,
          id: 1,
        );
        break;
      default:
    }
  }
}
