import 'package:pulse_chain/core/constant/strings.dart';

/// Model representing a step in the "How It Works" section.
class HowItWorksSteps {
  /// Creates a [HowItWorksSteps] instance.
  HowItWorksSteps({
    required this.stepNumber,
    required this.description,
    required this.title,
  });

  /// The step number.
  final int stepNumber;

  /// The description of the step.
  final String description;

  /// The title of the step.
  final String title;

  /// Returns a list of predefined "How It Works" steps.
  static List<HowItWorksSteps> howItWorksSteps = [
    HowItWorksSteps(
      stepNumber: 1,
      title: AppStrings.howItWorksStep1Title,
      description: AppStrings.howItWorksStep1Description,
    ),
    HowItWorksSteps(
      stepNumber: 2,
      title: AppStrings.howItWorksStep2Title,
      description: AppStrings.howItWorksStep2Description,
    ),
    HowItWorksSteps(
      stepNumber: 3,
      title: AppStrings.howItWorksStep3Title,
      description: AppStrings.howItWorksStep3Description,
    ),
  ];
}
