import 'package:flutter/material.dart';
import 'package:pulse_chain/core/theme/export.dart';

/// Custom text button widget used for secondary actions.
class CustomTextButton extends StatelessWidget {
  /// Creates a [CustomTextButton] instance.
  const CustomTextButton({
    required this.title,
    super.key,
    this.onPressed,
    this.colorText,
  });

  /// the call back button onPressed of the button
  final VoidCallback? onPressed;

  /// the title of the button
  final String title;

  /// the color of the text
  final Color? colorText;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        overlayColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: AppTextStyle.button.copyWith(
          color: colorText ?? AppColors.brandPrimary,
        ),
      ),
    );
  }
}
