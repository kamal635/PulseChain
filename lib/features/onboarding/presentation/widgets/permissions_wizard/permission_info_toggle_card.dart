import 'package:flutter/cupertino.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pulse_chain/core/theme/export.dart';

/// Small info card with a label and an iOS-style toggle.
class PermissionInfoToggleCard extends StatelessWidget {
  /// Creates a [PermissionInfoToggleCard] instance.
  const PermissionInfoToggleCard({
    required this.label,
    required this.value,
    required this.onChanged,
    required this.icon,
    super.key,
  });

  /// The label for the toggle.
  final String label;

  /// The current value of the toggle.
  final bool value;

  /// Callback when the toggle value changes.
  final ValueChanged<bool> onChanged;

  /// The icon representing the permission step.
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(35.r),
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: AppColors.white,
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

      child: Row(
        children: [
          Container(
            width: 36.w,
            height: 36.h,
            decoration: BoxDecoration(
              color: value == false
                  ? AppColors.darkGray.withAlpha(40)
                  : AppColors.brandPrimary.withAlpha(20),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Icon(
              icon,
              color: value == false
                  ? AppColors.darkGray
                  : AppColors.brandPrimary,
              size: 22.r,
            ),
          ),

          spaceWidth(16),

          Flexible(
            child: Text(
              textAlign: TextAlign.start,
              label,
              style: AppTextStyle.body,
            ),
          ),

          Transform.scale(
            scale: 0.8.r,
            child: CupertinoSwitch(
              value: value,
              onChanged: onChanged,
              activeTrackColor: AppColors.brandPrimary,
              inactiveTrackColor: AppColors.surfaceLow,
            ),
          ),
        ],
      ),
    );
  }
}
