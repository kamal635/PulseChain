import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pulse_chain/core/theme/export.dart';
import 'package:pulse_chain/features/onboarding/presentation/widgets/permissions/export.dart';

/// A card widget representing a permission requirement.
class PermissionRequirementCard extends StatelessWidget {
  /// Creates a [PermissionRequirementCard] widget.
  const PermissionRequirementCard({
    required this.leadingIcon,
    required this.trailingIcon,
    required this.permissionTitle,
    required this.permissionDescription,
    required this.permissionStatus,
    required this.statusChipBackground,
    required this.statusChipForeground,
    required this.requirementLabel,
    super.key,
  });

  /// The leading icon of the permission requirement.
  final IconData leadingIcon;

  /// The trailing icon of the permission requirement.
  final IconData trailingIcon;

  /// The title of the permission requirement.
  final String permissionTitle;

  /// The subtitle of the permission requirement.
  final String permissionDescription;

  /// The permission status text to display.
  final String permissionStatus;

  /// The static permission requirement label.
  final String requirementLabel;

  /// The background color of the chip.
  final Color statusChipBackground;

  /// The text color of the chip.
  final Color statusChipForeground;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.h),
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.cardStroke),
        borderRadius: AppRadius.medium,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withAlpha(10),
            blurRadius: 5.r,
            offset: Offset(0, 6.h),
          ),
        ],
      ),

      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 22.r,
                backgroundColor: AppColors.brandPrimary.withAlpha(40),
                child: Icon(
                  leadingIcon,
                  size: 22.w,
                  color: AppColors.brandPrimary,
                ),
              ),
              spaceWidth(10),
              Flexible(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            permissionTitle,
                            style: AppTextStyle.body.copyWith(
                              color: AppColors.black,
                            ),
                          ),
                        ),

                        spaceWidth(10),
                        Flexible(
                          child: PermissionStatusChip(
                            permissionStatus: requirementLabel,
                            colorChip: AppColors.surfaceLow,
                            textStyle: AppTextStyle.label,
                          ),
                        ),
                      ],
                    ),
                    spaceHeight(5),
                    Text(
                      permissionDescription,
                      style: AppTextStyle.subtitle,
                    ),
                  ],
                ),
              ),
              spaceWidth(10),
              Icon(
                trailingIcon,
                color: AppColors.darkGray.withAlpha(100),
                size: 18.w,
              ),
            ],
          ),

          Align(
            alignment: Alignment.bottomRight,
            child: PermissionStatusChip(
              permissionStatus: permissionStatus,
              colorChip: statusChipBackground,
              textStyle: AppTextStyle.label.copyWith(
                color: statusChipForeground,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
