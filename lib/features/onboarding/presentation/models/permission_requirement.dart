import 'package:flutter/material.dart';
import 'package:pulse_chain/core/constant/strings.dart';

/// Model representing a permission requirement item.
class PermissionRequirementItem {
  /// Creates a [PermissionRequirementItem] instance.
  PermissionRequirementItem({
    required this.title,
    required this.subTitle,
    required this.icon,
  });

  /// The title of the permission requirement.
  final String title;

  /// The subtitle of the permission requirement.
  final String subTitle;

  /// The icon representing the permission requirement.
  final IconData icon;

  /// Returns a list of sample permission requirement items.
  static List<PermissionRequirementItem> get permissionRequirementItems {
    return [
      PermissionRequirementItem(
        title: AppStrings.permissionRequirementTitle1,
        subTitle: AppStrings.permissionRequirementSubTitle1,
        icon: Icons.bluetooth,
      ),
      PermissionRequirementItem(
        title: AppStrings.permissionRequirementTitle2,
        subTitle: AppStrings.permissionRequirementSubTitle2,
        icon: Icons.location_on_outlined,
      ),
      PermissionRequirementItem(
        title: AppStrings.permissionRequirementTitle3,
        subTitle: AppStrings.permissionRequirementSubTitle3,
        icon: Icons.battery_saver,
      ),
    ];
  }
}
