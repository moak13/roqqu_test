import 'package:sisyphus/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:sisyphus/ui/views/home/home_view.dart';
import 'package:sisyphus/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';
// @stacked-import

@StackedApp(
  routes: [
    AdaptiveRoute(page: StartupView, initial: true),
    AdaptiveRoute(page: HomeView),
    // @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: NavigationService),
    LazySingleton(
      classType: ThemeService,
      resolveUsing: ThemeService.getInstance,
    ),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  logger: StackedLogger(),
)
class App {}
