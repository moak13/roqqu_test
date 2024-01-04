import 'package:flutter/material.dart';
import 'package:sisyphus/app/app.bottomsheets.dart';
import 'package:sisyphus/app/app.locator.dart';
import 'package:sisyphus/models/rating_model.dart';
import 'package:sisyphus/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

class HomeViewModel extends BaseViewModel {
  final _bottomSheetService = locator<BottomSheetService>();
  final _themeService = locator<ThemeService>();

  bool get isDarkMode => _themeService.isDarkMode;

  int fixedTabIndex = 0;
  int scrollingTabIndex = 0;

  void setFixedTabIndex(int value) {
    fixedTabIndex = value;
    rebuildUi();
  }

  void setScrollingTabIndex(int value) {
    scrollingTabIndex = value;
    rebuildUi();
  }

  List<RatingModel> ratings = [
    const RatingModel(
      iconData: Icons.schedule,
      status: '24h change',
      statusColor: Color(0xffA7B1BC),
      readings: '520.80 +1.25%',
      readingsColor: Color(0xff00C076),
    ),
    const RatingModel(
      iconData: Icons.arrow_upward,
      status: '24h high',
      statusColor: Color(0xffA7B1BC),
      readings: '520.80 +1.25%',
    ),
    const RatingModel(
      iconData: Icons.arrow_downward,
      status: '24h low',
      statusColor: Color(0xffA7B1BC),
      readings: '520.80 +1.25%',
    ),
    const RatingModel(
      iconData: Icons.arrow_upward,
      status: '24h high',
      statusColor: Color(0xffA7B1BC),
      readings: '520.80 +1.25%',
    ),
    const RatingModel(
      iconData: Icons.arrow_downward,
      status: '24h low',
      statusColor: Color(0xffA7B1BC),
      readings: '520.80 +1.25%',
    ),
  ];

  Color get textColor {
    if (isDarkMode) return Colors.white;
    return Colors.black;
  }

  Color get cardBackgroundColor {
    if (isDarkMode) return const Color(0xff17181B);
    return Colors.white;
  }

  Color get statusColor {
    if (isDarkMode) return const Color(0xffA7B1BC);
    return const Color(0xff737A91);
  }

  Color get dividerColor {
    if (isDarkMode) return const Color(0xffEAF0FE);
    return const Color(0xff737A91);
  }

  Color get tabBarBackgroundColor {
    if (isDarkMode) return const Color(0xff262932);
    return const Color(0xffF1F1F1);
  }

  Color get tabBackgroundColor {
    if (isDarkMode) return const Color(0xffE9F0FF).withOpacity(0.10);
    return Colors.white;
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
      isScrollControlled: true,
    );
  }

  void onGlobeTap() {
    _themeService.toggleDarkLightTheme();
  }

  void onProfileTap() {}

  /// The data tto be displayed on the PopUpMenu
  Map<int, String> get popUpMenuItems => _popUpMenuItems;

  final Map<int, String> _popUpMenuItems = {
    1: 'Exchange',
    2: 'Wallets',
    3: 'Roqqu Hub',
    4: 'Log out',
  };
}
