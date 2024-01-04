import 'package:flutter/material.dart';
import 'package:sisyphus/ui/views/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

class OrderBook extends ViewModelWidget<HomeViewModel> {
  const OrderBook({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return const Center(
      child: Text('Order Book'),
    );
  }
}
