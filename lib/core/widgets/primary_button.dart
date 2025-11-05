import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pulse_chain/core/theme/export.dart';

/// Primary filled button used for main actions across the app.
class PrimaryButton extends StatelessWidget {
  /// Creates a [PrimaryButton] instance.
  const PrimaryButton({
    required this.title,
    required this.onPressed,
    super.key,
  });

  /// the title of the button
  final String title;

  /// the call back button onPressed of the button
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,

      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.brandPrimary,
        padding: EdgeInsets.all(12.r),

        shadowColor: AppColors.brandPrimary.withAlpha(150),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.medium,
        ),
      ),
      child: Text(
        title,
        style: AppTextStyle.button,
      ),
    );
  }
}
