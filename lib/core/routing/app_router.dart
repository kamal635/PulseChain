import 'package:go_router/go_router.dart';
import 'package:pulse_chain/core/routing/router_path.dart';
import 'package:pulse_chain/features/onboarding/presentation/pages/permissions_wizard_page.dart';
import 'package:pulse_chain/features/onboarding/presentation/pages/welcome_page.dart';

/// AppRouter sets up the GoRouter for the application.
abstract class AppRouter {
  /// The GoRouter instance for the app.
  static GoRouter goRouter = GoRouter(
    initialLocation: RouterPath.welcome,
    routes: [
      GoRoute(
        path: RouterPath.welcome,
        builder: (context, state) => const WelcomePage(),
      ),

      GoRoute(
        path: RouterPath.permissions,
        builder: (context, state) => const PermissionsWizardPage(),
      ),
    ],
  );
}
