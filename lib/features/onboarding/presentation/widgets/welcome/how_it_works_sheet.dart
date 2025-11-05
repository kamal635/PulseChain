import 'package:flutter/material.dart';
import 'package:pulse_chain/core/constant/strings.dart';
import 'package:pulse_chain/core/theme/export.dart';
import 'package:pulse_chain/features/onboarding/presentation/models/how_it_works_steps.dart';
import 'package:pulse_chain/features/onboarding/presentation/widgets/welcome/how_it_works_step_tile.dart';

/// A widget representing a bottom sheet in the "How It Works" section.
class HowItWorksSheet extends StatelessWidget {
  /// Creates a [HowItWorksSheet] widget.
  const HowItWorksSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final steps = HowItWorksSteps.howItWorksSteps;

    return FractionallySizedBox(
      heightFactor: 0.9,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(AppStrings.howitworks, style: AppTextStyle.heading),
              ),

              spaceHeight(12),

              Expanded(
                child: ListView.separated(
                  itemCount: steps.length,
                  separatorBuilder: (_, _) => spaceHeight(4),
                  itemBuilder: (context, index) {
                    final s = steps[index];
                    final isLast = index == steps.length - 1;

                    return HowItWorksStepTile(
                      number: s.stepNumber,
                      title: s.title,
                      description: s.description,
                      isLast: isLast,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
