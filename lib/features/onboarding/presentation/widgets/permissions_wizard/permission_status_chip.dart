import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pulse_chain/core/theme/export.dart';

/// Chip widget to display permission status.
class PermissionStatusChip extends StatelessWidget {
  /// Creates a [PermissionStatusChip] instance.
  const PermissionStatusChip({
    required this.permissionStatus,
    required this.textStyle,
    required this.colorChip,
    super.key,
  });

  /// The permission status text to display.
  final String permissionStatus;

  /// The text style for the permission status.
  final TextStyle? textStyle;

  /// The background color of the chip.
  final Color colorChip;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: colorChip,
        borderRadius: AppRadius.medium,
      ),

      child: Text(
        textAlign: TextAlign.start,
        permissionStatus,
        style: textStyle,
      ),
    );
  }
}
