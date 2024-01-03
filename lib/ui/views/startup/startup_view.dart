import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:sisyphus/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';

import 'startup_viewmodel.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Center(
        child: Builder(
          builder: (context) {
            if (viewModel.isDarkMode) {
              return Image.asset(
                AppStrings.lightLogo,
                width: 350,
              );
            }

            return Image.asset(
              AppStrings.darkLogo,
              width: 350,
            );
          },
        ),
      ),
    );
  }

  @override
  StartupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StartupViewModel();

  @override
  void onViewModelReady(StartupViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
}
