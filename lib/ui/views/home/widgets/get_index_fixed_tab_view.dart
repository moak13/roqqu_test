import 'package:flutter/material.dart';

import 'charts.dart';
import 'order_book.dart';
import 'recent_trades.dart';

class GetIndexFixedTabView extends StatelessWidget {
  final int index;
  const GetIndexFixedTabView({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 0:
        return const Charts();
      case 1:
        return const OrderBook();
      case 2:
        return const RecentTrades();
      default:
        return const Charts();
    }
  }
}
