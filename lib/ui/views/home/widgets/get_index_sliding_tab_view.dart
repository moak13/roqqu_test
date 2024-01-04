import 'package:flutter/material.dart';

import 'open_orders.dart';
import 'order_history.dart';
import 'positions.dart';
import 'trade_history.dart';

class GetIndexSlidingTabView extends StatelessWidget {
  final int index;
  const GetIndexSlidingTabView({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 0:
        return const OpenOrders();
      case 1:
        return const Positions();
      case 2:
        return const OrderHistory();
      case 3:
        return const TradeHistory();
      default:
        return const OpenOrders();
    }
  }
}
