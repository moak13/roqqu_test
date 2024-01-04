import 'package:flutter/material.dart';

import 'custom_tab.dart';

class CustomTabBar extends StatelessWidget {
  final int? currentIndex;
  final ValueChanged<int>? setIndex;
  final List<CustomTab> tabs;
  final Color? backgroundColor;
  const CustomTabBar({
    super.key,
    this.currentIndex,
    this.setIndex,
    required this.tabs,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: double.infinity,
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          tabs.length,
          (index) {
            final tabData = tabs.elementAt(index);
            return CustomTab(
              text: tabData.text,
              backgroundColor: tabData.backgroundColor,
              textColor: tabData.textColor,
              onTap: () {
                tabData.onTap;
                setIndex?.call(index);
              },
              isActive: currentIndex == index,
            );
          },
        ),
      ),
    );
  }
}
