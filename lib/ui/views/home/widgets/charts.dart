import 'package:flutter/material.dart';
import 'package:sisyphus/ui/views/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

class Charts extends ViewModelWidget<HomeViewModel> {
  const Charts({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return const Center(
      child: Text('Charts'),
    );
  }
}
