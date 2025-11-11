import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pulse_chain/core/theme/app_colors.dart';
import 'package:pulse_chain/core/theme/app_text_style.dart';

/// Reusable, app-themed snackbars (responsive with ScreenUtil).
abstract final class AppSnackBars {
  /// Base builder to keep all snackbars consistent.
  static SnackBar _build({
    required String message,
    String? actionLabel,
    VoidCallback? onAction,
    Color? background,
    Color? foreground,
    Color? borderColor,
    IconData? leadingIcon,
    Duration duration = const Duration(seconds: 4),
  }) {
    final bg = background ?? AppColors.white;
    final fg = foreground ?? AppColors.black;

    return SnackBar(
      duration: duration,
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      backgroundColor: bg,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.r),
        side: BorderSide(
          color: borderColor ?? AppColors.cardStroke,
          width: 1.r,
        ),
      ),
      content: Row(
        children: [
          if (leadingIcon != null) ...[
            Icon(leadingIcon, color: AppColors.brandPrimary, size: 18.r),
            SizedBox(width: 10.w),
          ],
          Expanded(
            child: Text(
              message,
              // Use app body style, just override color if needed
              style: AppTextStyle.body.copyWith(color: fg),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      action: (actionLabel != null && onAction != null)
          ? SnackBarAction(
              label: actionLabel,
              onPressed: onAction,
              textColor: AppColors.brandPrimary,
            )
          : null,
    );
  }

  /// Simple info snackbar.
  static void info(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        _build(
          message: message,
          leadingIcon: Icons.info_outline,
        ),
      );
  }

  /// Success snackbar (affirmation tone).
  static void success(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        _build(
          message: message,
          leadingIcon: Icons.check_circle_outline,
          borderColor: AppColors.brandAccentGreen,
        ),
      );
  }

  /// Error snackbar (red border).
  static void error(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        _build(
          message: message,
          leadingIcon: Icons.error_outline,
          borderColor: AppColors.errorRed,
        ),
      );
  }

  /// Permission prompt with a "Grant" action.
  ///
  /// - Hides the current snackbar.
  /// - Schedules the action on the next frame to avoid conflicts
  /// with the closing animation.
  /// - Optional [canRun] guard (e.g., to check a "request in flight" flag).
  static void permissionGrant(
    BuildContext context, {
    required String message,
    required VoidCallback onGrant,
    String actionLabel = 'Grant',
    bool Function()? canRun,
    IconData leadingIcon = Icons.bluetooth, // fits PulseChain use-case
  }) {
    final m = ScaffoldMessenger.of(context)..hideCurrentSnackBar();

    m.showSnackBar(
      _build(
        message: message,
        leadingIcon: leadingIcon,
        actionLabel: actionLabel,
        onAction: () {
          m.hideCurrentSnackBar();
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (canRun == null || canRun()) onGrant();
          });
        },
        borderColor: AppColors.brandPrimary.withAlpha(90),
      ),
    );
  }
}
