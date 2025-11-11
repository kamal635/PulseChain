import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pulse_chain/core/theme/export.dart';
import 'package:pulse_chain/core/widgets/app_dialogs.dart';
import 'package:pulse_chain/core/widgets/app_snackbars.dart';
import 'package:pulse_chain/domain/entities/permission_types.dart';
import 'package:pulse_chain/features/onboarding/presentation/providers/permission_status_providers.dart';
import 'package:pulse_chain/features/onboarding/presentation/providers/permissions_list_provider.dart';
import 'package:pulse_chain/features/onboarding/presentation/providers/wizard_index_provider.dart';
import 'package:pulse_chain/features/onboarding/presentation/providers/wizard_page_controller_provider.dart';
import 'package:pulse_chain/features/onboarding/presentation/providers/wizard_ui_list_provider.dart';
import 'package:pulse_chain/features/onboarding/presentation/widgets/permissions_wizard/export.dart';
import 'package:pulse_chain/features/onboarding/presentation/widgets/permissions_wizard/permission_info_toggle_card.dart';

/// Page to handle permission requests during onboarding.
class PermissionsWizardPage extends HookConsumerWidget {
  /// Build Constructor [PermissionsWizardPage].
  const PermissionsWizardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Core data
    final steps = ref.watch(permissionsListProvider);
    final ui = ref.watch(wizardUiListProvider);
    final controller = ref.watch(wizardPageControllerProvider);
    final index = ref.watch(wizardIndexProvider);
    final total = steps.length;
    final progress = (index + 1) / total;

    // Animate PageView when the wizard index changes
    ref.listen<int>(wizardIndexProvider, (prev, next) {
      controller.animateToPage(
        next,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });

    // Refresh Bluetooth chip after coming back from App Settings
    final life = useAppLifecycleState();
    useEffect(() {
      final isOnBtStep =
          steps.isNotEmpty && steps[index].kind == PermissionKind.bluetooth;
      if (isOnBtStep && life == AppLifecycleState.resumed) {
        ref.invalidate(bluetoothStatusProvider);
      }
      return null;
    }, [life, index, steps]);

    // Helpers
    void goNext() {
      final cur = ref.read(wizardIndexProvider);
      final last = total - 1;
      if (cur < last) {
        ref.read(wizardIndexProvider.notifier).state = cur + 1;
      }
    }

    // Unified Bluetooth flow handler
    Future<void> handleBluetoothFlow() async {
      // Request permissions
      final res = await requestBluetoothPermissions(ref);

      if (!context.mounted) return;

      switch (res) {
        case PermissionStatus.granted:
          goNext();
          return;

        case PermissionStatus.notGrantedYet:
          AppSnackBars.permissionGrant(
            context,
            message: 'Please allow Bluetooth (Scan & Connect).',
            onGrant: () {
              final busy = ref.read(btRequestInFlightProvider);
              if (!busy) handleBluetoothFlow();
            },
          );

          return;

        case PermissionStatus.denied:
          await AppDialogs.permissionBlocked(
            context,
          );
          return;
      }
    }

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
        onPageChanged: (v) {
          ref.read(wizardIndexProvider.notifier).state = v;
        },
        itemBuilder: (context, i) {
          final item = ui[i];
          final step = steps[i];
          final isBt = step.kind == PermissionKind.bluetooth;

          // Bluetooth chip status (others are temporary constants until wired)
          final btStatus =
              ref.watch(bluetoothStatusProvider).value ??
              PermissionStatus.notGrantedYet;

          // Guard: prevent concurrent requests
          final isBtBusy = ref.watch(btRequestInFlightProvider);

          return Padding(
            padding: AppPadding.defaultPad,
            child: Column(
              children: [
                spaceHeight(30),

                PermissionHeroSection(wizard: item),

                if (i == 2)
                  PermissionInfoToggleCard(
                    label: item.infoCardTitle,
                    value: true,
                    onChanged: (v) {},
                    icon: item.icon,
                  )
                else
                  PermissionInfoCard(infoCardTitle: item.infoCardTitle),

                const Spacer(),

                PermissionStepFooter(
                  onContinue: () async {
                    if (!isBt) {
                      goNext();
                      return;
                    }
                    if (isBtBusy) {
                      return; // Ignore presses while a request is in flight
                    }
                    await handleBluetoothFlow();
                  },
                  onSkip: step.isRequired ? null : goNext,
                  status: isBt ? btStatus : item.status,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
