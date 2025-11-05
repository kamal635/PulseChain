import 'package:flutter/material.dart';
import 'package:pulse_chain/core/theme/export.dart';
import 'package:pulse_chain/features/onboarding/presentation/widgets/permissions/export.dart';

/// Page to handle permission requests during onboarding.
class PermissionsPage extends StatelessWidget {
  /// Creates a [PermissionsPage] instance.
  const PermissionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.white,
      ),
      body: PageView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: AppPadding.defaultPad,
            child: const Column(
              children: [
                PermissionHeroSection(),

                PermissionInfoCard(),

                Spacer(),

                PermissionStepFooter(),
              ],
            ),
          );
        },
      ),
    );
  }
}
