import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:masrofy/core/routes/app_routes.dart';
import 'package:masrofy/features/auth/data/repo/auth_repo.dart';
import 'package:masrofy/features/auth/view/screens/auth_screen.dart';
import 'package:masrofy/features/debts/view/debts_screen.dart';
import 'package:masrofy/features/goals/view/golas_screen.dart';
import 'package:masrofy/features/home/view/home_screen.dart';
import 'package:masrofy/features/home/view/tabs/expenses_tab.dart';
import 'package:masrofy/features/income/view/income_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authRepo = ref.read(authRepoProvider);
  return GoRouter(
    initialLocation: AppRoutes.authScreen,
    redirect: (context, state) {
      final isLoggedIn = authRepo.currentUser != null;
      final isAuthRoute = state.matchedLocation == AppRoutes.authScreen;
      if (!isLoggedIn) {
        return isAuthRoute ? null : AppRoutes.authScreen;
      }
      if (isAuthRoute) {
        return AppRoutes.homeScreen;
      }
      return null;
    },
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
      GoRoute(
        path: AppRoutes.expensesScreen,
        builder: (context, state) => ExpensesTab(),
      ),
    ],
  );
});
