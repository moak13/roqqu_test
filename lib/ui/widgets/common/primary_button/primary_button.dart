import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'primary_button_model.dart';

class PrimaryButton extends StackedView<PrimaryButtonModel> {
  final String buttonText;
  final Color? backgroundColor;
  final double? width;
  final VoidCallback? onTap;
  const PrimaryButton({
    super.key,
    required this.buttonText,
    this.backgroundColor,
    this.width,
    this.onTap,
  });

  @override
  Widget builder(
    BuildContext context,
    PrimaryButtonModel viewModel,
    Widget? child,
  ) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
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

  @override
  PrimaryButtonModel viewModelBuilder(
    BuildContext context,
  ) =>
      PrimaryButtonModel();
}
