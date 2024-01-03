import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final bool isActive;
  final Color? backgroundColor;
  final Color? textColor;
  const CustomTab({
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
      height: 28,
      width: 161,
      decoration: BoxDecoration(
        color: isActive ? backgroundColor : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isActive ? Colors.green : Colors.transparent,
        ),
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
