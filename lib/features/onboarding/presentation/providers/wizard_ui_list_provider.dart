import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pulse_chain/core/constant/strings.dart';
import 'package:pulse_chain/core/iconography/app_icons.dart';
import 'package:pulse_chain/domain/entities/permission_types.dart';
import 'package:pulse_chain/features/onboarding/presentation/models/permission_wizard.dart';
import 'package:pulse_chain/features/onboarding/presentation/providers/permissions_list_provider.dart';
import 'package:pulse_chain/features/onboarding/presentation/providers/sdk_int_provider.dart';

/// Provides the list of PermissionWizard UI models for the onboarding wizard.
final Provider<List<PermissionWizard>> wizardUiListProvider =
    Provider<List<PermissionWizard>>((ref) {
      /// Get the dynamic permission steps
      final steps = ref.watch(permissionsListProvider);

      /// Get the current Android SDK version
      final sdk = ref.watch(sdkIntProvider).value;
      final locationRequired = sdk != null && sdk <= 30;

      /// Prepare titles based on location requirement
      final locTitle = locationRequired
          ? AppStrings.locationPermissionTitleRequired
          : AppStrings.locationPermissionTitleNotRequired;
      final locSubtitle = locationRequired
          ? AppStrings.locationPermissionSubtitleRequired
          : AppStrings.locationPermissionSubtitleNotRequired;
      final locInfoTitle = locationRequired
          ? AppStrings.infoCardLocationPermissionRequired
          : AppStrings.infoCardLocationPermissionNotRequired;

      /// Build the UI models list
      final ui = <PermissionWizard>[
        for (final step in steps)
          switch (step.kind) {
            PermissionKind.bluetooth => PermissionWizard(
              title: AppStrings.bluetoothPermissionTitle,
              description: AppStrings.bluetoothPermissionSubtitle,
              icon: AppIcons.bluetooth,
              infoCardTitle: AppStrings.infoCardBluetoothPermission,
              status: PermissionStatus.notGrantedYet,
            ),
            PermissionKind.location => PermissionWizard(
              title: locTitle,
              description: locSubtitle,
              icon: AppIcons.location,
              infoCardTitle: locInfoTitle,
              status: PermissionStatus.notGrantedYet,
            ),
            PermissionKind.battery => PermissionWizard(
              title: AppStrings.batteryOptimizationTitle,
              description: AppStrings.batteryOptimizationSubtitle,
              icon: AppIcons.batterySaver,
              infoCardTitle: AppStrings.infoCardBatteryOptimization,
              status: PermissionStatus.notGrantedYet,
            ),
          },
      ];

      return ui;
    });
