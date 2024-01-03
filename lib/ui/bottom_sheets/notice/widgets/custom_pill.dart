import 'package:flutter/material.dart';

class CustomPill extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final bool isActive;
  final Color? backgroundColor;
  final Color? textColor;
  const CustomPill({
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
      decoration: BoxDecoration(
        color: isActive ? backgroundColor : Colors.transparent,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(100),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(100),
          child: Center(
            child: Ink(
              padding: const EdgeInsets.symmetric(
                vertical: 6,
                horizontal: 12,
              ),
              child: Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: isActive ? textColor : const Color(0xff737A91),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
