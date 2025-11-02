import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pulse_chain/core/theme/export.dart';

/// A card widget representing a permission requirement.
class PermissionRequirementCard extends StatelessWidget {
  /// Creates a [PermissionRequirementCard] widget.
  const PermissionRequirementCard({
    required this.leadingIcon,
    required this.trailingIcon,
    required this.title,
    required this.subTitle,
    super.key,
  });

  /// The leading icon of the permission requirement.
  final IconData leadingIcon;

  /// The trailing icon of the permission requirement.
  final IconData trailingIcon;

  /// The title of the permission requirement.
  final String title;

  /// The subtitle of the permission requirement.
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.h),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.cardStroke),
        borderRadius: AppRadius.medium,
      ),

      child: Row(
        children: [
          Flexible(
            child: ListTile(
              contentPadding: EdgeInsets.all(10.r),
              leading: CircleAvatar(
                radius: 22.r,
                backgroundColor: AppColors.brandPrimary.withAlpha(40),
                child: Icon(
                  leadingIcon,
                  size: 22.w,
                  color: AppColors.brandPrimary,
                ),
              ),
              trailing: Icon(
                trailingIcon,
                size: 16.w,
                color: AppColors.brandPrimary,
              ),
              title: Text(
                title,
                style: AppTextStyle.subtitle.copyWith(color: AppColors.black),
              ),
              subtitle: Text(
                subTitle,
                style: AppTextStyle.subtitle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
