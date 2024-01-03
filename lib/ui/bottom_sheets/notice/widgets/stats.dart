import 'package:flutter/material.dart';

class Stats extends StatelessWidget {
  final String title;
  final String discription;
  final Color? titleColor;
  final Color? discriptionColor;
  final bool showIcon;
  const Stats({
    super.key,
    required this.title,
    required this.discription,
    this.titleColor,
    this.discriptionColor,
    this.showIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: TextStyle(
                color: titleColor,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            Builder(
              builder: (context) {
                if (showIcon) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        width: 3,
                      ),
                      RotatedBox(
                        quarterTurns: 1,
                        child: Icon(
                          Icons.chevron_right,
                          color: titleColor,
                          size: 12,
                        ),
                      ),
                    ],
                  );
                }

                return const SizedBox.shrink();
              },
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          discription,
          style: TextStyle(
            color: discriptionColor,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
