import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:masrofy/features/goals/data/models/goal_model.dart';
import 'package:masrofy/features/goals/data/repo/goals_repo.dart';

class GoalsController extends AsyncNotifier<List<GoalModel>> {
  late final GoalsRepo goalsRepo;
  @override
  FutureOr<List<GoalModel>> build() {
    goalsRepo = ref.read(goalRepositoryProvider);
    return _getGoals();
  }

  Future<List<GoalModel>> _getGoals() {
    return goalsRepo.getGoals();
  }

  Future<void> addGoal(GoalModel goal) async {
    state = AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await goalsRepo.addGoal(goal);
      return _getGoals();
    });
  }

  Future<void> deleteGoal(String id) async {
    state = AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await goalsRepo.deleteGoal(id);
      return _getGoals();
    });
  }

  Future<void> updateGoal(GoalModel goal) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      await goalsRepo.updateGoal(goal);

      return _getGoals();
    });
  }
}

final goalsConrollerProvider =
    AsyncNotifierProvider<GoalsController, List<GoalModel>>(
      GoalsController.new,
    );
