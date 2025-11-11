import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pulse_chain/core/constant/strings.dart';
import 'package:pulse_chain/core/iconography/app_icons.dart';
import 'package:pulse_chain/domain/entities/permission_types.dart';
import 'package:pulse_chain/features/onboarding/presentation/models/permission_requirement.dart';
import 'package:pulse_chain/features/onboarding/presentation/providers/permissions_list_provider.dart';
import 'package:pulse_chain/features/onboarding/presentation/providers/sdk_int_provider.dart';

/// Provides the list of PermissionRequirementItem UI models for the onboarding
///  requirements list.
final Provider<List<PermissionRequirementItem>> requirementUiListProvider =
    Provider<List<PermissionRequirementItem>>((ref) {
      final requirements = ref.watch(permissionsListProvider);

      final sdk = ref
          .watch(sdkIntProvider)
          .maybeWhen(data: (v) => v, orElse: () => null);
      final labelRequired = sdk != null && sdk <= 30;

      final label = labelRequired
          ? AppStrings.required
          : AppStrings.notRequired;

      final ui = <PermissionRequirementItem>[
        for (final req in requirements)
          switch (req.kind) {
            PermissionKind.bluetooth => PermissionRequirementItem(
              title: AppStrings.permissionRequirementTitle1,
              subTitle: AppStrings.permissionRequirementSubTitle1,
              icon: AppIcons.bluetooth,
              status: PermissionStatus.notGrantedYet,
              label: AppStrings.required,
            ),
            PermissionKind.location => PermissionRequirementItem(
              title: AppStrings.permissionRequirementTitle2,
              subTitle: AppStrings.permissionRequirementSubTitle2,
              icon: AppIcons.location,
              status: PermissionStatus.notGrantedYet,
              label: label,
            ),
            PermissionKind.battery => PermissionRequirementItem(
              title: AppStrings.permissionRequirementTitle3,
              subTitle: AppStrings.permissionRequirementSubTitle3,
              icon: AppIcons.batterySaver,
              status: PermissionStatus.notGrantedYet,
              label: AppStrings.recommended,
            ),
          },
      ];
      return ui;
    });
