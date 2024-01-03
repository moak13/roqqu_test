import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onTap;
  const GradientButton({
    super.key,
    required this.buttonText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: const LinearGradient(
          colors: [
            Color(0xff483BEB),
            Color(0xff7847E1),
            Color(0xffDD568D),
          ],
        ),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: onTap,
          child: Ink(
            padding: const EdgeInsets.all(8),
            child: Center(
              child: Text(
                buttonText,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
