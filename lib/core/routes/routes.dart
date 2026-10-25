import 'package:go_router/go_router.dart';
import 'package:masrofy/core/routes/app_routes.dart';
import 'package:masrofy/features/auth/view/screens/auth_screen.dart';
import 'package:masrofy/features/home/view/screens/home_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.authScreen,
  routes: [
    GoRoute(path: AppRoutes.homeScreen, builder: (context, state) => HomeScreen()),
    GoRoute(path: AppRoutes.authScreen, builder: (context, state) => AuthScreen()),
  ],
);
