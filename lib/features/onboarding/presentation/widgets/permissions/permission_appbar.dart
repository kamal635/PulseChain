import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pulse_chain/core/iconography/app_icons.dart';
import 'package:pulse_chain/core/theme/export.dart';

/// App bar widget for the permissions wizard page.
class PermissionsAppbar extends StatelessWidget implements PreferredSizeWidget {
  /// Creates an [PermissionsAppbar] instance.
  const PermissionsAppbar({
    required this.currentStep,
    required this.totalSteps,
    required this.progress,
    required this.controller,
    super.key,
  });

  /// the current step number
  final int currentStep;

  /// the total number of steps
  final int totalSteps;

  /// the progress value between 0.0 and 1.0
  final double progress;

  /// The page controller to navigate between permission steps.
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: AppColors.background,
      leading: IconButton(
        icon: Icon(
          AppIcons.arrowBack,
          size: 18.r,
        ),
        onPressed: () {
          if (currentStep > 1) {
            controller.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
            return;
          }
          context.pop();
        },
      ),
      title: Text(
        'Step $currentStep of $totalSteps',
        style: AppTextStyle.button.copyWith(
          color: AppColors.darkGray.withAlpha(150),
        ),
      ),
      centerTitle: true,

      bottom: PreferredSize(
        preferredSize: Size.fromHeight(4.h),
        child: LinearProgressIndicator(
          value: progress,
          color: AppColors.brandPrimary,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kTextTabBarHeight + 4);
}
