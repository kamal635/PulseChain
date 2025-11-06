import 'package:flutter/material.dart';
import 'package:pulse_chain/bootstrap/responsive_screenutil_init.dart';
import 'package:pulse_chain/core/routing/app_router.dart';
import 'package:pulse_chain/core/theme/app_colors.dart';

Future<void> main() async {
  runApp(const PulseChainApp());
}

/// Root application widget for PulseChain.
///
/// Sets up a temporary `MaterialApp` skeleton (theme + home) until
/// we wire GoRouter and the real initial route.
class PulseChainApp extends StatelessWidget {
  /// Creates a [PulseChainApp] root widget.
  const PulseChainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveScreenUtilInit(
      builder: (context) {
        return MaterialApp.router(
          theme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: AppColors.background,
          ),
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.goRouter,
        );
      },
    );
  }
}
