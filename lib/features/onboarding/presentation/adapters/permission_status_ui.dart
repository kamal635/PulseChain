import 'package:flutter/widgets.dart';
import 'package:pulse_chain/core/constant/strings.dart';
import 'package:pulse_chain/core/theme/export.dart';
import 'package:pulse_chain/domain/entities/permission_types.dart';

/// Extension to provide UI labels for PermissionStatus enum.
extension PermissionStatusUiX on PermissionStatus {
  /// Returns the UI label corresponding to the permission status.
  String get label {
    switch (this) {
      case PermissionStatus.granted:
        return AppStrings.granted;
      case PermissionStatus.denied:
        return AppStrings.denied;
      case PermissionStatus.notGrantedYet:
        return AppStrings.notGranted;
    }
  }

  /// Returns the color associated with the permission status.
  Color get color {
    switch (this) {
      case PermissionStatus.granted:
        return AppColors.brandAccentGreen;
      case PermissionStatus.denied:
        return AppColors.errorRed;
      case PermissionStatus.notGrantedYet:
        return AppColors.darkGray;
    }
  }
}
