import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pulse_chain/core/theme/export.dart';

/// Primary filled button used for main actions across the app.
class PrimaryButton extends StatelessWidget {
  /// Creates a [PrimaryButton] instance.
  const PrimaryButton({required this.title, super.key});

  /// the title of the button
  final String title;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.brandPrimary,
        padding: EdgeInsets.symmetric(vertical: 12.h),
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
