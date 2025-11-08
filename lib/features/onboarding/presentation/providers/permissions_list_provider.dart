// lib/features/onboarding/presentation/providers/permissions_list_provider.dart
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pulse_chain/domain/entities/permission_types.dart';
import 'package:pulse_chain/features/onboarding/presentation/providers/sdk_int_provider.dart';

/// Lightweight model for a permission step in the wizard.
class PermissionStep {
  /// For the "Android only" chip in UI
  const PermissionStep({
    required this.kind,
    required this.isRequired,
    this.isAndroidOnly = false,
  });

  /// The kind of permission.
  final PermissionKind kind;

  /// Whether the permission is required.
  final bool isRequired;

  /// Whether the permission is Android only.
  final bool isAndroidOnly;
}

/// Builds the steps list dynamically based on Android SDK (Location rule).
final permissionsListProvider = Provider<List<PermissionStep>>((ref) {
  final sdk = ref
      .watch(sdkIntProvider)
      .maybeWhen(
        data: (v) => v,
        orElse: () => null,
      );

  // Location is required only on Android 11 and lower (API ≤ 30).
  final locationRequired = sdk != null && sdk <= 30;

  final steps = <PermissionStep>[
    const PermissionStep(
      kind: PermissionKind.bluetooth,
      isRequired: true,
    ),
    PermissionStep(
      kind: PermissionKind.location,
      isRequired: locationRequired,
      isAndroidOnly: true, // This requirement nuance is Android-specific
    ),
    const PermissionStep(
      kind: PermissionKind.battery,
      isRequired: false, // Recommended, not required
      isAndroidOnly: true, // Battery optimization exception is Android-specific
    ),
  ];

  return steps;
});
