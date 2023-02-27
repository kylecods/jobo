import 'package:stacked/stacked.dart';

class ProfilePageViewModel extends BaseViewModel {
  // Place anything here that needs to happen before we get into the application
  Future longUpdateStuff() async {
    // Sets busy to true before starting future and sets it to false after executing
    // You can also pass in an object as the busy object. Otherwise it'll use the ViewModel
    await runBusyFuture(updateStuff(), busyObject: "loading");
  }

  Future updateStuff() {
    return Future.delayed(const Duration(seconds: 3));
  }
}
