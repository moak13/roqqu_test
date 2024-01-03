import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:sisyphus/ui/common/ui_helpers.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                verticalSpaceLarge,
                const Text(
                  'Hello, STACKED!',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                verticalSpaceMedium,
                MaterialButton(
                  color: Colors.black,
                  onPressed: viewModel.showBottomSheet,
                  child: const Text(
                    'Show Sheet',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                verticalSpaceMedium,
                MaterialButton(
                  color: Colors.black,
                  onPressed: viewModel.toggleTheme,
                  child: const Text(
                    'Toggle Theme',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
