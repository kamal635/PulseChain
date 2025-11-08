import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pulse_chain/core/iconography/app_icons.dart';
import 'package:pulse_chain/core/routing/router_path.dart';
import 'package:pulse_chain/core/theme/export.dart';
import 'package:pulse_chain/features/onboarding/presentation/adapters/permission_status_ui.dart';
import 'package:pulse_chain/features/onboarding/presentation/providers/requirement_ui_list_provider.dart';
import 'package:pulse_chain/features/onboarding/presentation/providers/wizard_index_provider.dart';
import 'package:pulse_chain/features/onboarding/presentation/widgets/welcome/permission_requirement_card.dart';

/// A list of permission requirement cards.
class PermissionRequirementsList extends HookConsumerWidget {
  /// Creates a [PermissionRequirementsList] widget.
  const PermissionRequirementsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ui = ref.watch(requirementUiListProvider);

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: ui.length,
      itemBuilder: (context, index) {
        final item = ui[index];

        return InkWell(
          borderRadius: AppRadius.medium,
          onTap: () {
            /// Update the wizard index to the tapped permission requirement
            ref.read(wizardIndexProvider.notifier).state = index;

            /// Navigate to the permissions wizard page
            context.push(RouterPath.permissions);
          },

          child: PermissionRequirementCard(
            requirementLabel: item.label,
            statusChipColorText: item.status.color,
            statusChipBackground: item.status.color.withAlpha(40),
            permissionStatus: item.status.label,
            leadingIcon: item.icon,
            trailingIcon: AppIcons.arrowForward,
            reqPermissionTitle: item.title,
            reqPermissionSubtitle: item.subTitle,
          ),
        );
      },
    );
  }
}
