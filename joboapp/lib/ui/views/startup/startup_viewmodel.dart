import 'package:joboapp/services/jobs_service.dart';
import 'package:stacked/stacked.dart';
import 'package:joboapp/app/app.locator.dart';
import 'package:joboapp/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _jobsService = locator<JobsService>();

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 3));

    // This is where you can make decisions on where your app should navigate when
    // you have custom startup logic

    if (_jobsService.logged()) {
      _navigationService.replaceWithHomeView();
    } else {
      _navigationService.replaceWithOnboardingViewView();
    }
  }
}
