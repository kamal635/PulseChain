import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pulse_chain/core/theme/export.dart';
import 'package:pulse_chain/features/onboarding/presentation/providers/permissions_list_provider.dart';
import 'package:pulse_chain/features/onboarding/presentation/providers/wizard_index_provider.dart';
import 'package:pulse_chain/features/onboarding/presentation/providers/wizard_page_controller_provider.dart';
import 'package:pulse_chain/features/onboarding/presentation/providers/wizard_ui_list_provider.dart';
import 'package:pulse_chain/features/onboarding/presentation/widgets/permissions/export.dart';
import 'package:pulse_chain/features/onboarding/presentation/widgets/permissions/permission_info_toggle_card.dart';

/// Page to handle permission requests during onboarding.
class PermissionsWizardPage extends HookConsumerWidget {
  /// Creates a [PermissionsWizardPage] instance.
  const PermissionsWizardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// The list of permission steps.
    final steps = ref.watch(permissionsListProvider);
    final ui = ref.watch(wizardUiListProvider);

    final controller = ref.watch(wizardPageControllerProvider);
    final index = ref.watch(wizardIndexProvider);

    final total = steps.length;
    final progress = (index + 1) / total;

    /// Listen for changes in the wizard index and animate the page controller.
    ref.listen<int>(wizardIndexProvider, (prev, next) {
      controller.animateToPage(
        next,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });

    return Scaffold(
      appBar: PermissionsAppbar(
        controller: controller,
        currentStep: index + 1,
        totalSteps: total,
        progress: progress,
      ),
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        itemCount: total,

        /// Callback when the page is changed to update the wizard index.
        onPageChanged: (v) {
          ref.read(wizardIndexProvider.notifier).state = v;
        },
        itemBuilder: (context, i) {
          final item = ui[i];
          final step = steps[i];

          return Padding(
            padding: AppPadding.defaultPad,
            child: Column(
              children: [
                spaceHeight(30),

                PermissionHeroSection(wizard: item),

                if (i == 2) ...[
                  PermissionInfoToggleCard(
                    label: item.infoCardTitle,
                    value: true,
                    onChanged: (v) => {},
                    icon: item.icon,
                  ),
                ] else ...[
                  PermissionInfoCard(infoCardTitle: item.infoCardTitle),
                ],

                const Spacer(),

                PermissionStepFooter(
                  /// Callback when the "Continue" button is pressed.
                  onContinue: () {
                    final last = total - 1;
                    final cur = ref.read(wizardIndexProvider);
                    if (cur < last) {
                      ref.read(wizardIndexProvider.notifier).state = cur + 1;
                    }
                  },
                  onSkip: step.isRequired
                      ? null
                      : () {
                          final last = total - 1;
                          final cur = ref.read(wizardIndexProvider);
                          if (cur < last) {
                            ref.read(wizardIndexProvider.notifier).state =
                                cur + 1;
                          }
                        },
                  status: item.status,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
