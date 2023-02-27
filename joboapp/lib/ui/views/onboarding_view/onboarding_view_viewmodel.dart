import 'package:joboapp/app/app.locator.dart';
import 'package:joboapp/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OnboardingViewViewModel extends BaseViewModel {
  final _navigation = locator<NavigationService>();

  Future navigateToHomeView() {
    return _navigation.replaceWithHomeView();
  }
}
