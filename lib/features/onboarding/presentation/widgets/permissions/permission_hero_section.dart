import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pulse_chain/core/constant/strings.dart';
import 'package:pulse_chain/core/theme/export.dart';

/// Hero section widget for permission requests.
class PermissionHeroSection extends StatelessWidget {
  /// Creates a [PermissionHeroSection] instance.
  const PermissionHeroSection({super.key});

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
            Icons.bluetooth,
            color: AppColors.brandPrimary,
            size: 40.r,
          ),
        ),

        spaceHeight(10),

        ListTile(
          title: Text(
            AppStrings.titleBluetoothPermission,
            textAlign: TextAlign.center,
            style: AppTextStyle.heading,
          ),
          subtitle: Padding(
            padding: EdgeInsets.only(top: 5.h),
            child: Text(
              AppStrings.subtitleBluetoothPermission,
              textAlign: TextAlign.center,
              style: AppTextStyle.subtitle,
            ),
          ),
        ),
      ],
    );
  }
}
