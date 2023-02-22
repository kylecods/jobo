import 'package:joboapp/app/app.locator.dart';
import 'package:joboapp/app/app.router.dart';
import 'package:joboapp/models/user_model.dart';
import 'package:joboapp/services/jobs_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DetailsPageViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  final _jobsService = locator<JobsService>();

  String token = "";

  void showHomePage() {
    _navigationService.navigateToHomeView();
  }

  Future getToken() async {
    var user = const UserModel(
      username: "admin",
      password: "Abcde.1234!",
    );

    var result = await runBusyFuture(_jobsService.generateToken(user));

    token = result.token;
  }
}
