import 'package:flutter/material.dart';

import 'custom_pill.dart';

class CustomPillBar extends StatelessWidget {
  final int? currentIndex;
  final ValueChanged<int>? setIndex;
  final List<CustomPill> pills;
  const CustomPillBar({
    super.key,
    this.currentIndex,
    this.setIndex,
    required this.pills,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          pills.length,
          (index) {
            final pillData = pills.elementAt(index);
            return CustomPill(
              backgroundColor: pillData.backgroundColor,
              textColor: pillData.textColor,
              text: pillData.text,
              onTap: () {
                pillData.onTap;
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
