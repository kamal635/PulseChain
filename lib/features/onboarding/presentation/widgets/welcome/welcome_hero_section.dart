import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pulse_chain/core/constant/app_assets.dart';
import 'package:pulse_chain/core/constant/strings.dart';
import 'package:pulse_chain/core/theme/export.dart';

/// Hero section displayed on the welcome page.
class WelcomeHeroSection extends StatelessWidget {
  /// Creates a [WelcomeHeroSection] widget.
  const WelcomeHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Image displayed at the top of the welcome page.
        ClipRRect(
          borderRadius: AppRadius.medium,
          child: Image.asset(
            AppAssets.welcomeHeroImage,
            fit: BoxFit.fill,
            height: 150.h,
            width: double.infinity,
          ),
        ),

        /// Title and subtitle texts.
        ListTile(
          contentPadding: EdgeInsets.all(10.r),

          title: Text(
            AppStrings.titleWelcom,
            style: AppTextStyle.heading,
            textAlign: TextAlign.center,
            overflow: TextOverflow.visible,
          ),
          subtitle: Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Text(
              AppStrings.subtitleWelcome,
              style: AppTextStyle.subtitle,
              textAlign: TextAlign.center,
              overflow: TextOverflow.visible,
            ),
          ),
        ),
      ],
    );
  }
}
