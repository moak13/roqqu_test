import 'package:flutter/material.dart';
import 'package:sisyphus/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_themes/stacked_themes.dart';

class NoticeSheetModel extends BaseViewModel {
  final _themeService = locator<ThemeService>();

  bool get isDarkMode => _themeService.isDarkMode;
  int tabIndex = 0;
  int pillIndex = 0;

  bool isChecked = false;

  void toggleCheck(bool? value) {
    isChecked = value!;
    rebuildUi();
  }

  void setTabIndex(int index) {
    tabIndex = index;
    rebuildUi();
  }

  void setPillIndex(int index) {
    pillIndex = index;
    rebuildUi();
  }

  Color get backgroundColor {
    if (isDarkMode) return const Color(0xff262932);

    return Colors.white;
  }

  Color get tabBarBackgroundColor {
    if (isDarkMode) return Colors.black.withOpacity(0.16);
    return const Color(0xffF1F1F1);
  }

  Color get tabBackgroundColor {
    if (isDarkMode) return const Color(0xff21262C);
    return Colors.white;
  }

  Color get textColor {
    if (isDarkMode) return Colors.white;
    return Colors.black;
  }

  Color get pillBackgroundColor {
    if (isDarkMode) return const Color(0xff353945);
    return const Color(0xffCFD3D8);
  }

  Color get contentColor {
    if (isDarkMode) return const Color(0xffA7B1BC);
    return const Color(0xff737A91);
  }

  Color get contentBorderColor {
    if (isDarkMode) return const Color(0xff373B3F);
    return const Color(0xffF1F1F1);
  }

  Color get dividerColor {
    if (isDarkMode) return const Color(0xff394047);
    return const Color(0xffF1F1F1);
  }

  void buyBtc() {}

  void deposit() {}
}
