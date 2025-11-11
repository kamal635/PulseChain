import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pulse_chain/core/theme/export.dart';
import 'package:pulse_chain/features/onboarding/presentation/models/permission_wizard.dart';

/// Hero section widget for displaying permission information.
class PermissionHeroSection extends StatelessWidget {
  /// Creates a [PermissionHeroSection] instance.
  const PermissionHeroSection({required this.wizard, super.key});

  /// The permission wizard model containing title, description, and icon.
  final PermissionWizard wizard;

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
          child: Icon(wizard.icon, color: AppColors.brandPrimary, size: 40.r),
        ),
        spaceHeight(10),
        ListTile(
          title: Text(
            wizard.title,
            textAlign: TextAlign.center,
            style: AppTextStyle.heading,
          ),
          subtitle: Padding(
            padding: EdgeInsets.only(top: 5.h),
            child: Text(
              wizard.description,
              textAlign: TextAlign.center,
              style: AppTextStyle.subtitle,
            ),
          ),
        ),
      ],
    );
  }
}
