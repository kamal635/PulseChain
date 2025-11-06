import 'package:flutter/material.dart';
import 'package:pulse_chain/core/constant/strings.dart';
import 'package:pulse_chain/core/theme/export.dart';
import 'package:pulse_chain/core/widgets/custom_text_button.dart';
import 'package:pulse_chain/core/widgets/primary_button.dart';
import 'package:pulse_chain/features/onboarding/presentation/models/permission_wizard.dart';
import 'package:pulse_chain/features/onboarding/presentation/widgets/permissions/export.dart';

/// Footer section widget for permission requests.
class PermissionStepFooter extends StatelessWidget {
  /// Creates a [PermissionStepFooter] instance.
  const PermissionStepFooter({
    required this.controller,
    required this.index,
    super.key,
  });

  /// The page controller to navigate between permission steps.
  final PageController controller;

  /// The index of the current permission step.
  final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: PrimaryButton(
            title: AppStrings.continueText,
            onPressed: () {
              controller.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
          ),
        ),

        spaceHeight(20),

        PermissionStatusChip(
          permissionStatus: PermissionWizard.permissionsList[index].status.name,
          textStyle: AppTextStyle.body.copyWith(
            color: PermissionWizard.permissionsList[index].status.color,
          ),
          colorChip: PermissionWizard.permissionsList[index].status.color
              .withAlpha(40),
        ),

        spaceHeight(10),

        SafeArea(
          child: CustomTextButton(
            title: AppStrings.notNow,
            onPressed: () {
              controller.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            colorText: AppColors.darkGray,
          ),
        ),
      ],
    );
  }
}
