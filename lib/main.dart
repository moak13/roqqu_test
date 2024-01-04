import 'package:flutter/material.dart';
import 'package:sisyphus/app/app.bottomsheets.dart';
import 'package:sisyphus/app/app.locator.dart';
import 'package:sisyphus/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ThemeManager.initialise();
  await setupLocator();
  setupBottomSheetUi();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      lightTheme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xffF1F1F1),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.white,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xff252A30),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Color(0xff17181B),
        ),
      ),
      builder: (context, theme, darkTheme, themeMode) {
        return MaterialApp(
          theme: theme,
          darkTheme: darkTheme,
          themeMode: themeMode,
          onGenerateRoute: StackedRouter().onGenerateRoute,
          navigatorKey: StackedService.navigatorKey,
          navigatorObservers: [
            StackedService.routeObserver,
          ],
        );
      },
    );
  }
}
