import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pulse_chain/core/theme/export.dart';
import 'package:pulse_chain/features/onboarding/presentation/models/permission_wizard.dart';

/// Hero section widget for permission requests.
class PermissionHeroSection extends StatelessWidget {
  /// Creates a [PermissionHeroSection] instance.
  const PermissionHeroSection({required this.index, super.key});

  /// The index of the current permission step.
  final int index;
  @override
  Widget build(BuildContext context) {
    final sizeCircle = 102.r;
    return Column(
      children: [
        Container(
          height: sizeCircle,
          width: sizeCircle,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue.withAlpha(40),
          ),
          child: Icon(
            PermissionWizard.permissionsList[index].icon,
            color: AppColors.brandPrimary,
            size: 40.r,
          ),
        ),

        spaceHeight(10),

        ListTile(
          title: Text(
            PermissionWizard.permissionsList[index].title,
            textAlign: TextAlign.center,
            style: AppTextStyle.heading,
          ),
          subtitle: Padding(
            padding: EdgeInsets.only(top: 5.h),
            child: Text(
              PermissionWizard.permissionsList[index].description,
              textAlign: TextAlign.center,
              style: AppTextStyle.subtitle,
            ),
          ),
        ),
      ],
    );
  }
}
