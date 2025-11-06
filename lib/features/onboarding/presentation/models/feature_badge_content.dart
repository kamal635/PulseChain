import 'package:flutter/material.dart';
import 'package:pulse_chain/core/constant/strings.dart';
import 'package:pulse_chain/core/iconography/app_icons.dart';

/// Model representing the content of a feature badge
class FeatureBadgeContent {
  /// Creates a [FeatureBadgeContent] instance.
  FeatureBadgeContent({
    required this.title,
    required this.icon,
  });

  /// The title of the feature badge.
  final String title;

  /// The icon of the feature badge.
  final IconData icon;

  ///  A list of predefined feature badge contents.
  static List<FeatureBadgeContent> get featureBadgeContents => [
    FeatureBadgeContent(
      title: AppStrings.chipOnDeviceEncryption,
      icon: AppIcons.security,
    ),
    FeatureBadgeContent(
      title: AppStrings.chipMultiHopRelays,
      icon: AppIcons.deviceHub,
    ),
    FeatureBadgeContent(
      title: AppStrings.chipBatteryFriendly,
      icon: AppIcons.batterySaver,
    ),
  ];
}
