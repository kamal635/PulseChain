import 'package:flutter/material.dart';
import 'package:pulse_chain/core/constant/strings.dart';
import 'package:pulse_chain/core/theme/export.dart';
import 'package:pulse_chain/core/widgets/custom_text_button.dart';
import 'package:pulse_chain/core/widgets/primary_button.dart';
import 'package:pulse_chain/domain/entities/permission_types.dart';
import 'package:pulse_chain/features/onboarding/presentation/adapters/permission_status_ui.dart';
import 'package:pulse_chain/features/onboarding/presentation/widgets/permissions/export.dart';

/// Footer widget for permission steps in the onboarding wizard.
class PermissionStepFooter extends StatelessWidget {
  /// Creates a [PermissionStepFooter] instance.
  const PermissionStepFooter({
    required this.onContinue,
    required this.status,
    this.onSkip,
    super.key,
  });

  /// The callback when the "Continue" button is pressed.
  final VoidCallback onContinue;

  /// The callback when the "Not Now" button is pressed.
  final VoidCallback? onSkip;

  /// The current permission status.
  final PermissionStatus status;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: PrimaryButton(
            title: AppStrings.continueText,
            onPressed: onContinue,
          ),
        ),
        spaceHeight(20),
        PermissionStatusChip(
          permissionStatus: status.label,
          textStyle: AppTextStyle.body.copyWith(color: status.color),
          colorChip: status.color.withAlpha(40),
        ),
        spaceHeight(10),
        SafeArea(
          child: CustomTextButton(
            title: AppStrings.notNow,
            onPressed: onSkip,
            colorText: AppColors.darkGray,
          ),
        ),
      ],
    );
  }
}
