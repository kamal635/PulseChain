import 'package:go_router/go_router.dart';
import 'package:pulse_chain/features/onboarding/presentation/pages/welcome_page.dart';

/// AppRouter sets up the GoRouter for the application.
abstract class AppRouter {
  /// The GoRouter instance for the app.
  static GoRouter goRouter = GoRouter(
    initialLocation: '/welcome',
    routes: [
      GoRoute(
        path: '/welcome',
        builder: (context, state) => const WelcomePage(),
      ),
    ],
  );
}
