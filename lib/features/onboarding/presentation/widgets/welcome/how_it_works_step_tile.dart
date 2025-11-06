import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pulse_chain/core/theme/export.dart';

/// A widget representing a single step in the "How It Works" section.
class HowItWorksStepTile extends StatelessWidget {
  /// Creates a [HowItWorksStepTile] widget.
  const HowItWorksStepTile({
    required this.number,
    required this.title,
    required this.description,
    super.key,
    this.isLast = false,
  });

  /// The step number.
  final int number;

  /// The title of the step.
  final String title;

  /// The description of the step.
  final String description;

  /// Indicates if this is the last step.
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final gutterWidth = 44.r;
    final badgeDiameter = 36.r;
    const double lineThickness = 1;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: gutterWidth,
            child: Column(
              children: [
                Container(
                  width: badgeDiameter,
                  height: badgeDiameter,
                  decoration: BoxDecoration(
                    color: AppColors.brandPrimary.withAlpha(
                      40,
                    ),
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    number.toString(),
                    style: AppTextStyle.subtitle.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.brandPrimary,
                    ),
                  ),
                ),

                spaceHeight(10),

                Container(
                  height: 40.h,
                  width: lineThickness,
                  color: isLast
                      ? Colors.transparent
                      : AppColors.black.withAlpha(100),
                ),
              ],
            ),
          ),
          spaceWidth(10),

          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                spaceHeight(5),
                Text(
                  title,
                  style: AppTextStyle.subtitle.copyWith(
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: AppTextStyle.caption.copyWith(
                    color: AppColors.black.withAlpha(180),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
