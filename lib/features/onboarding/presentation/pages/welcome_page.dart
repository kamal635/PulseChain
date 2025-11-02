import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pulse_chain/core/constant/export.dart';
import 'package:pulse_chain/core/theme/export.dart';
import 'package:pulse_chain/features/onboarding/presentation/widgets/feature_badge_lists.dart';
import 'package:pulse_chain/features/onboarding/presentation/widgets/permission_requirements_list.dart';
import 'package:pulse_chain/features/onboarding/presentation/widgets/welcome_cta_footer.dart';
import 'package:pulse_chain/features/onboarding/presentation/widgets/welcome_hero_section.dart';

/// Welcome page displayed during onboarding.
class WelcomePage extends StatelessWidget {
  /// Creates a [WelcomePage] widget.
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// The bottom call-to-action footer.
      bottomNavigationBar: const SafeArea(child: WelcomeCtaFooter()),
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.white,

        /// The title of the app bar.
        title: Image.asset(
          AppAssets.logoWithTitleLightMode,
          height: 140.h,
          width: 140.w,
        ),
      ),
      body: Padding(
        /// Padding around the main content.
        padding: AppPadding.defaultPad,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            /// Ensures the column takes up minimal vertical space
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Hero section with image and texts.
              const WelcomeHeroSection(),

              /// List of feature badges.
              const FeatureBadgeLists(),

              spaceHeight(20),

              /// List of permission requirements.
              const PermissionRequirementsList(),

              spaceHeight(15),
            ],
          ),
        ),
      ),
    );
  }
}
