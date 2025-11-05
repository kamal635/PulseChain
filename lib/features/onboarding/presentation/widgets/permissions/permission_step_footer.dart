import 'package:flutter/material.dart';
import 'package:pulse_chain/core/constant/strings.dart';
import 'package:pulse_chain/core/theme/export.dart';
import 'package:pulse_chain/core/widgets/custom_text_button.dart';
import 'package:pulse_chain/core/widgets/primary_button.dart';

/// Footer section widget for permission requests.
class PermissionStepFooter extends StatelessWidget {
  /// Creates a [PermissionStepFooter] instance.
  const PermissionStepFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: PrimaryButton(
            title: AppStrings.allowBluetooth,
            onPressed: () {},
          ),
        ),

        spaceHeight(20),

        Container(
          decoration: BoxDecoration(
            color: AppColors.surfaceLow,
            borderRadius: AppRadius.medium,
          ),

          child: Text(
            textAlign: TextAlign.start,
            AppStrings.notGranted,
            style: AppTextStyle.body,
          ),
        ),

        spaceHeight(10),

        SafeArea(
          child: CustomTextButton(
            title: AppStrings.notNow,
            onPressed: () {},
            colorText: AppColors.darkGray,
          ),
        ),
      ],
    );
  }
}
