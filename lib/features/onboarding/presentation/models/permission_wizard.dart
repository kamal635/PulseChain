import 'package:flutter/widgets.dart';
import 'package:pulse_chain/core/constant/strings.dart';
import 'package:pulse_chain/core/iconography/app_icons.dart';
import 'package:pulse_chain/core/theme/export.dart';

/// Enum representing the status of a permission.
enum PermissionStatus {
  /// Permission has been granted.
  granted(AppStrings.granted, AppColors.brandAccentGreen),

  /// Permission has been denied.
  denied(AppStrings.denied, AppColors.errorRed),

  /// Permission has not been granted yet.
  notGrantedYet(AppStrings.notGranted, AppColors.darkGray);

  const PermissionStatus(this.name, this.color);

  /// The key associated with the permission status.
  final String name;

  /// The color associated with the permission status.
  final Color color;
}

/// Model representing a permission step in the onboarding wizard.
class PermissionWizard {
  /// Creates a [PermissionWizard] instance.
  PermissionWizard({
    required this.title,
    required this.description,
    required this.icon,
    required this.infoCardTitle,
    required this.status,
  });

  /// The title of the permission step.
  final String title;

  /// The description of the permission step.
  final String description;

  /// The icon representing the permission step.
  final IconData icon;

  /// The title for the info card related to the permission step.
  final String infoCardTitle;

  /// The current status of the permission.
  final PermissionStatus status;

  /// A list of predefined permission steps for the onboarding wizard.
  static List<PermissionWizard> permissionsList = [
    PermissionWizard(
      title: AppStrings.bluetoothPermissionTitle,
      description: AppStrings.bluetoothPermissionSubtitle,
      icon: AppIcons.bluetooth,
      infoCardTitle: AppStrings.infoCardBluetoothPermission,
      status: PermissionStatus.notGrantedYet,
    ),
    PermissionWizard(
      title: AppStrings.locationPermissionTitle,
      description: AppStrings.locationPermissionSubtitle,
      icon: AppIcons.location,
      infoCardTitle: AppStrings.infoCardLocationPermission,
      status: PermissionStatus.denied,
    ),
    PermissionWizard(
      title: AppStrings.batteryOptimizationTitle,
      description: AppStrings.batteryOptimizationSubtitle,
      icon: AppIcons.batterySaver,
      infoCardTitle: AppStrings.infoCardBatteryOptimization,
      status: PermissionStatus.granted,
    ),
  ];
}
