import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pulse_chain/core/constant/strings.dart';
import 'package:pulse_chain/core/routing/router_path.dart';
import 'package:pulse_chain/core/theme/export.dart';
import 'package:pulse_chain/core/widgets/custom_text_button.dart';
import 'package:pulse_chain/core/widgets/primary_button.dart';
import 'package:pulse_chain/features/onboarding/presentation/widgets/welcome/how_it_works_sheet.dart';

/// A footer widget containing the call-to-action button.
class WelcomeCtaFooter extends StatelessWidget {
  /// Creates a [WelcomeCtaFooter] widget.
  const WelcomeCtaFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.cardStroke)),
      ),
      child: Padding(
        padding: AppPadding.defaultPad,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            spaceHeight(5),
            PrimaryButton(
              title: AppStrings.getstarted,
              onPressed: () {
                context.push(RouterPath.permissions);
              },
            ),

            spaceHeight(10),

            CustomTextButton(
              onPressed: () async {
                await showModalBottomSheet<void>(
                  context: context,
                  builder: (context) {
                    return const HowItWorksSheet();
                  },
                );
              },

              title: AppStrings.howitworks,
            ),

            spaceHeight(20),

            Text(
              AppStrings.captionNoAccount,
              style: AppTextStyle.caption,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
