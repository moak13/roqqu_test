import 'package:flutter/material.dart';

import 'custom_home_tab.dart';

class CustomHomeTabBar extends StatelessWidget {
  final int? currentIndex;
  final ValueChanged<int>? setIndex;
  final List<CustomHomeTab> tabs;
  final Color? backgroundColor;
  final bool isSliding;
  const CustomHomeTabBar({
    super.key,
    this.currentIndex,
    this.setIndex,
    required this.tabs,
    this.backgroundColor,
    this.isSliding = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Builder(
        builder: (context) {
          if (isSliding) {
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final tabData = tabs.elementAt(index);
                return CustomHomeTab(
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
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 35,
                );
              },
              itemCount: tabs.length,
            );
          }

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              tabs.length,
              (index) {
                final tabData = tabs.elementAt(index);
                return CustomHomeTab(
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
          );
        },
      ),
    );
  }
}
