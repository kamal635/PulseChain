import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart' as ph;
import 'package:pulse_chain/core/theme/app_colors.dart';
import 'package:pulse_chain/core/theme/app_text_style.dart';

/// Reusable, app-themed dialogs (responsive with ScreenUtil).
abstract final class AppDialogs {
  AppDialogs._();

  /// Core builder to keep all dialogs consistent.
  static Widget _baseDialog({
    required BuildContext context,
    required String title,
    required String message,
    List<Widget>? actions,
    IconData? icon,
  }) {
    return AlertDialog(
      elevation: 0,
      backgroundColor: AppColors.white,
      insetPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
      contentPadding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 8.h),
      actionsPadding: EdgeInsets.fromLTRB(12.w, 0, 12.w, 8.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
        side: BorderSide(color: AppColors.cardStroke, width: 1.r),
      ),
      title: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, size: 20.r, color: AppColors.brandPrimary),
            SizedBox(width: 8.w),
          ],
          Expanded(
            child: Text(
              title,
              style: AppTextStyle.heading.copyWith(fontSize: 18.sp),
            ),
          ),
        ],
      ),
      content: Text(
        message,
        style: AppTextStyle.subtitle.copyWith(fontSize: 14.sp),
      ),
      actions: actions,
    );
  }

  /// Styled text button used inside dialogs.
  static Widget _dialogTextButton({
    required String label,
    required VoidCallback onPressed,
    Color? textColor,
    FontWeight fontWeight = FontWeight.w600,
  }) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: textColor ?? AppColors.brandPrimary,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        textStyle: AppTextStyle.button.copyWith(
          fontSize: 14.sp,
          fontWeight: fontWeight,
          color: textColor ?? AppColors.brandPrimary,
        ),
      ),
      child: Text(label),
    );
  }

  /// Generic confirm dialog. Returns true if confirmed.
  static Future<bool> confirm(
    BuildContext context, {
    required String title,
    required String message,
    String cancelText = 'Cancel',
    String confirmText = 'OK',
    Color? confirmColor,
    IconData? icon,
    bool barrierDismissible = true,
  }) async {
    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (ctx) => _baseDialog(
        context: ctx,
        title: title,
        message: message,
        icon: icon,
        actions: [
          _dialogTextButton(
            label: cancelText,
            textColor: AppColors.darkGray,
            fontWeight: FontWeight.w500,
            onPressed: () => Navigator.of(ctx).pop(false),
          ),
          _dialogTextButton(
            label: confirmText,
            textColor: confirmColor ?? AppColors.brandPrimary,
            onPressed: () => Navigator.of(ctx).pop(true),
          ),
        ],
      ),
    );
    return result ?? false;
  }

  /// Permission-blocked dialog that nudges the user to open app settings.
  static Future<void> permissionBlocked(
    BuildContext context, {
    String title = 'Bluetooth permission blocked',
    String message = 'Open app settings to enable Bluetooth permissions.',
    String cancelText = 'Cancel',
    String settingsText = 'Open settings',
    IconData icon = Icons.bluetooth_disabled,
  }) async {
    await showDialog<void>(
      context: context,
      builder: (ctx) => _baseDialog(
        context: ctx,
        title: title,
        message: message,
        icon: icon,
        actions: [
          _dialogTextButton(
            label: cancelText,
            textColor: AppColors.darkGray,
            fontWeight: FontWeight.w500,
            onPressed: () => Navigator.of(ctx).pop(),
          ),
          _dialogTextButton(
            label: settingsText,
            textColor: AppColors.brandPrimary,
            onPressed: () {
              Navigator.of(ctx).pop();
              ph.openAppSettings();
            },
          ),
        ],
      ),
    );
  }

  /// Error dialog with red-accent OK button.
  static Future<void> error(
    BuildContext context, {
    required String title,
    required String message,
    String okText = 'OK',
    IconData icon = Icons.error_outline,
  }) async {
    await showDialog<void>(
      context: context,
      builder: (ctx) => _baseDialog(
        context: ctx,
        title: title,
        message: message,
        icon: icon,
        actions: [
          _dialogTextButton(
            label: okText,
            textColor: AppColors.errorRed,
            onPressed: () => Navigator.of(ctx).pop(),
          ),
        ],
      ),
    );
  }
}
