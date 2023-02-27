import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.dialogs.dart';
import '../../../app/app.locator.dart';
import '../../../models/jobs_model.dart';
import '../../../models/user_model.dart';
import '../../../services/jobs_service.dart';

class MainPageViewModel extends BaseViewModel {
  final _jobsService = locator<JobsService>();
  final _dialogService = locator<DialogService>();

  ManyJobs? _jobs;

  ManyJobs? get jobs => _jobs;

  Future updateStuff() async {
    var user = const UserModel(
      username: "admin",
      password: "Abcde.1234!",
    );
    setBusy(true);
    var result = await _jobsService.generateToken(user);

    var jobs = await _jobsService.getAllJobs(result.token);

    setBusy(false);

    _jobs = jobs;
  }

  Future showDialog() {
    return _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Item Clicked',
      description: 'This is clicked list item',
    );
  }
}
