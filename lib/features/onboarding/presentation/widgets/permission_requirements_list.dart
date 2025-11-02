import 'package:flutter/material.dart';
import 'package:pulse_chain/core/theme/app_radius.dart';
import 'package:pulse_chain/features/onboarding/presentation/models/permission_requirement.dart';
import 'package:pulse_chain/features/onboarding/presentation/widgets/permission_requirement_card.dart';

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
            trailingIcon: Icons.arrow_forward_ios,
            leadingIcon: PermissionRequirementItem
                .permissionRequirementItems[index]
                .icon,

            title: PermissionRequirementItem
                .permissionRequirementItems[index]
                .title,
            subTitle: PermissionRequirementItem
                .permissionRequirementItems[index]
                .subTitle,
          ),
        );
      },
    );
  }
}
