import 'package:sisyphus/app/app.bottomsheets.dart';
import 'package:sisyphus/app/app.locator.dart';
import 'package:sisyphus/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

class HomeViewModel extends BaseViewModel {
  final _bottomSheetService = locator<BottomSheetService>();
  final _themeService = locator<ThemeService>();

  void toggleTheme() {
    _themeService.toggleDarkLightTheme();
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
      isScrollControlled: true,
    );
  }
}
