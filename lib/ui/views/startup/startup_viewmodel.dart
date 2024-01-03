import 'package:stacked/stacked.dart';
import 'package:sisyphus/app/app.locator.dart';
import 'package:sisyphus/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _themeService = locator<ThemeService>();

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 3));

    // This is where you can make decisions on where your app should navigate when
    // you have custom startup logic

    _navigationService.replaceWithHomeView();
  }

  bool get isDarkMode => _themeService.isDarkMode;
}
