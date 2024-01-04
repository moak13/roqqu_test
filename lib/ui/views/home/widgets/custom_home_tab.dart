import 'package:flutter/material.dart';

class CustomHomeTab extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final bool isActive;
  final Color? backgroundColor;
  final Color? textColor;
  const CustomHomeTab({
    super.key,
    required this.text,
    this.onTap,
    this.isActive = false,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      width: 102,
      decoration: BoxDecoration(
        color: isActive ? backgroundColor : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: isActive ? textColor : const Color(0xff737A91),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
