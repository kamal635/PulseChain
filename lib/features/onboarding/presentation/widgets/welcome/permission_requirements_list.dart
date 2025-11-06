import 'package:flutter/material.dart';
import 'package:pulse_chain/core/iconography/app_icons.dart';
import 'package:pulse_chain/core/theme/app_radius.dart';
import 'package:pulse_chain/features/onboarding/presentation/models/permission_requirement.dart';
import 'package:pulse_chain/features/onboarding/presentation/models/permission_wizard.dart';
import 'package:pulse_chain/features/onboarding/presentation/widgets/welcome/permission_requirement_card.dart';

/// A list of permission requirement cards.
class PermissionRequirementsList extends StatelessWidget {
  /// Creates a [PermissionRequirementsList] widget.
  const PermissionRequirementsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: PermissionRequirementItem.permissionRequirementItems.length,
      itemBuilder: (context, index) {
        return InkWell(
          borderRadius: AppRadius.medium,
          onTap: () {},

          /// Builds each permission requirement card.
          child: PermissionRequirementCard(
            requirementLabel: PermissionRequirementItem
                .permissionRequirementItems[index]
                .permissionStatus,
            statusChipForeground:
                PermissionWizard.permissionsList[index].status.color,
            statusChipBackground: PermissionWizard
                .permissionsList[index]
                .status
                .color
                .withAlpha(40),
            permissionStatus:
                PermissionWizard.permissionsList[index].status.name,
            trailingIcon: AppIcons.arrowForward,
            leadingIcon: PermissionRequirementItem
                .permissionRequirementItems[index]
                .icon,

            permissionTitle: PermissionRequirementItem
                .permissionRequirementItems[index]
                .title,
            permissionDescription: PermissionRequirementItem
                .permissionRequirementItems[index]
                .subTitle,
          ),
        );
      },
    );
  }
}
