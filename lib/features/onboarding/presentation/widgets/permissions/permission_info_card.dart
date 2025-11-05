import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pulse_chain/core/constant/strings.dart';
import 'package:pulse_chain/core/theme/export.dart';

/// Card widget to display information about permissions.
class PermissionInfoCard extends StatelessWidget {
  /// Creates a [PermissionInfoCard] instance.
  const PermissionInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(35.r),
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: AppColors.surfaceLow,
        borderRadius: AppRadius.medium,
        boxShadow: const [
          BoxShadow(
            blurRadius: 16,
            offset: Offset(0, 6),
            spreadRadius: 2,
            color: Color(0xffE2E8F0),
          ),
          BoxShadow(
            blurRadius: 3,
            offset: Offset(0, 1),

            color: Color(0xffE2E8F0),
          ),
        ],
      ),

      child: Text(
        textAlign: TextAlign.start,
        AppStrings.infoCardBluetoothPermission,
        style: AppTextStyle.body,
      ),
    );
  }
}
