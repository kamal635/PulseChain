import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pulse_chain/features/onboarding/presentation/models/feature_badge_content.dart';
import 'package:pulse_chain/features/onboarding/presentation/widgets/welcome/feature_badge_chip.dart';

/// A list of feature badges displayed in a wrap layout.
class FeatureBadgeLists extends StatelessWidget {
  /// Creates a [FeatureBadgeLists] widget.
  const FeatureBadgeLists({super.key});

  @override
  Widget build(BuildContext context) {
    return
    /// Feature badges displayed in a wrap layout.
    Wrap(
      alignment: WrapAlignment.center,
      spacing: 12.w,
      runSpacing: 12.w,
      children: List.generate(
        FeatureBadgeContent.featureBadgeContents.length,
        (index) {
          return FeatureBadge(
            icon: FeatureBadgeContent.featureBadgeContents[index].icon,
            title: FeatureBadgeContent.featureBadgeContents[index].title,
          );
        },
      ),
    );
  }
}
