import 'package:go_router/go_router.dart';
import 'package:masrofy/core/routes/app_routes.dart';
import 'package:masrofy/features/auth/view/screens/auth_screen.dart';
import 'package:masrofy/features/debts/view/debts_screen.dart';
import 'package:masrofy/features/goals/view/golas_screen.dart';
import 'package:masrofy/features/home/view/screens/home_screen.dart';
import 'package:masrofy/features/income/view/income_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.authScreen,
  routes: [
    GoRoute(
      path: AppRoutes.homeScreen,
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: AppRoutes.authScreen,
      builder: (context, state) => AuthScreen(),
    ),
    GoRoute(
      path: AppRoutes.deptsScreen,
      builder: (context, state) => DebtsScreen(),
    ),
    GoRoute(
      path: AppRoutes.goalsScreen,
      builder: (context, state) => GoalsScreen(),
    ),
    GoRoute(
      path: AppRoutes.incomeScreen,
      builder: (context, state) => IncomeScreen(),
    ),
  ],
);
