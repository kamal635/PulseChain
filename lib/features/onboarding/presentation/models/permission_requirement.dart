import 'package:flutter/material.dart';
import 'package:pulse_chain/core/constant/strings.dart';
import 'package:pulse_chain/core/iconography/app_icons.dart';

/// Model representing a permission requirement item.
class PermissionRequirementItem {
  /// Creates a [PermissionRequirementItem] instance.
  PermissionRequirementItem({
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.permissionStatus,
  });

  /// The title of the permission requirement.
  final String title;

  /// The subtitle of the permission requirement.
  final String subTitle;

  /// The icon representing the permission requirement.
  final IconData icon;

  /// The permission status text to display.
  final String permissionStatus;

  /// Returns a list of sample permission requirement items.
  static List<PermissionRequirementItem> get permissionRequirementItems {
    return [
      PermissionRequirementItem(
        title: AppStrings.permissionRequirementTitle1,
        subTitle: AppStrings.permissionRequirementSubTitle1,
        icon: AppIcons.bluetooth,
        permissionStatus: AppStrings.required,
      ),
      PermissionRequirementItem(
        title: AppStrings.permissionRequirementTitle2,
        subTitle: AppStrings.permissionRequirementSubTitle2,
        icon: AppIcons.location,
        permissionStatus: AppStrings.androidOnly,
      ),
      PermissionRequirementItem(
        title: AppStrings.permissionRequirementTitle3,
        subTitle: AppStrings.permissionRequirementSubTitle3,
        icon: AppIcons.batterySaver,
        permissionStatus: AppStrings.recommended,
      ),
    ];
  }
}
