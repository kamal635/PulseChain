import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pulse_chain/core/constant/strings.dart';
import 'package:pulse_chain/core/iconography/app_icons.dart';
import 'package:pulse_chain/core/theme/export.dart';
import 'package:pulse_chain/features/onboarding/presentation/models/permission_wizard.dart';
import 'package:pulse_chain/features/onboarding/presentation/widgets/permissions/export.dart';
import 'package:pulse_chain/features/onboarding/presentation/widgets/permissions/permission_info_toggle_card.dart';

/// Page to handle permission requests during onboarding.
class PermissionsWizardPage extends HookConsumerWidget {
  /// Creates a [PermissionsWizardPage] instance.
  const PermissionsWizardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = usePageController();
    final currentIndex = useState(0);
    final toggleValue = useState(true);
    final total = PermissionWizard.permissionsList.length;
    final progress = (currentIndex.value + 1) / total;

    return Scaffold(
      appBar: PermissionsAppbar(
        controller: controller,
        currentStep: currentIndex.value + 1,
        totalSteps: total,
        progress: progress,
      ),
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        itemCount: PermissionWizard.permissionsList.length,
        onPageChanged: (value) {
          currentIndex.value = value;
        },
        itemBuilder: (context, index) {
          return Padding(
            padding: AppPadding.defaultPad,
            child: Column(
              children: [
                spaceHeight(30),

                PermissionHeroSection(index: index),

                if (index == 2) ...[
                  PermissionInfoToggleCard(
                    index: index,
                    label: AppStrings.infoCardBatteryOptimization,
                    value: toggleValue.value,
                    onChanged: (value) {
                      toggleValue.value = value;
                    },
                    icon: AppIcons.batterySaver,
                  ),
                ] else ...[
                  PermissionInfoCard(index: index),
                ],
                const Spacer(),

                PermissionStepFooter(
                  controller: controller,
                  index: index,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
