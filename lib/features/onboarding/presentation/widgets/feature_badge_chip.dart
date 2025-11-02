import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pulse_chain/core/theme/export.dart';

/// A custom chip widget for the welcome page.
class FeatureBadge extends StatelessWidget {
  /// Creates a [FeatureBadge] widget.
  const FeatureBadge({required this.icon, required this.title, super.key});

  /// The icon to display in the chip.
  final IconData icon;

  /// The title text of the chip.
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 8.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.surfaceLow,
        borderRadius: AppRadius.medium,
      ),

      child: Row(
        /// Ensures the row takes up minimal horizontal space
        mainAxisSize: MainAxisSize.min,

        children: [
          Icon(icon, size: 16.w, color: AppColors.brandAccent),

          spaceWidth(6),

          Text(
            title,
            style: AppTextStyle.subtitle.copyWith(color: AppColors.black),
          ),
        ],
      ),
    );
  }
}
