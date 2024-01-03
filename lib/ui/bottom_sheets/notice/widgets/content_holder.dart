import 'package:flutter/material.dart';

class ContentHolder extends StatelessWidget {
  final String leadingText;
  final String trailingText;
  final Color? borderColor;
  final Color? contentColor;
  final bool showIcon;
  const ContentHolder({
    super.key,
    required this.leadingText,
    required this.trailingText,
    this.borderColor,
    this.contentColor,
    this.showIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 13,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: borderColor!,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                leadingText,
                style: TextStyle(
                  color: contentColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              Icon(
                Icons.info_outline,
                color: contentColor,
                size: 12,
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                trailingText,
                style: TextStyle(
                  color: contentColor,
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
                          width: 4,
                        ),
                        RotatedBox(
                          quarterTurns: 1,
                          child: Icon(
                            Icons.chevron_right,
                            color: contentColor,
                            size: 12,
                          ),
                        )
                      ],
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
