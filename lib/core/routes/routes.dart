import 'package:go_router/go_router.dart';
import 'package:masrofy/app.dart';
import 'package:masrofy/core/routes/app_routes.dart';
import 'package:masrofy/features/auth/view/screens/auth_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.auth,
  routes: [
    GoRoute(path: AppRoutes.home, builder: (context, state) => HomeScreen()),
    GoRoute(
      path: AppRoutes.settings,
      builder: (context, state) => SettingsScreen(),
    ),
    GoRoute(path: AppRoutes.auth, builder: (context, state) => AuthScreen()),
  ],
);
