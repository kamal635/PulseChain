import 'package:flutter/material.dart';
import 'package:pulse_chain/domain/entities/permission_types.dart';

/// Model representing a permission requirement item.
class PermissionRequirementItem {
  /// Creates a [PermissionRequirementItem] instance.
  PermissionRequirementItem({
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.status,
    required this.label,
  });

  /// The title of the permission requirement.
  final String title;

  /// The subtitle of the permission requirement.
  final String subTitle;

  /// The icon representing the permission requirement.
  final IconData icon;

  /// The current status of the permission.
  final PermissionStatus status;

  /// The static label for the permission requirement.
  final String label;
}
