import 'package:joboapp/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:joboapp/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:joboapp/ui/views/home/home_view.dart';
import 'package:joboapp/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:joboapp/ui/views/details_page/details_page_view.dart';
import 'package:joboapp/services/jobs_service.dart';
import 'package:joboapp/ui/views/profile_page/profile_page_view.dart';
import 'package:joboapp/ui/views/onboarding_view/onboarding_view_view.dart';
import 'package:joboapp/ui/views/main_page/main_page_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: DetailsPageView),
    MaterialRoute(page: ProfilePageView),
    MaterialRoute(page: OnboardingViewView),
    MaterialRoute(page: MainPageView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: JobsService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
