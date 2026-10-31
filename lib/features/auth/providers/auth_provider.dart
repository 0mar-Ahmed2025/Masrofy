import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:masrofy/features/auth/data/repo/auth_repo.dart';

class AuthController extends AsyncNotifier<void> {
  late final AuthRepo _authRepo;
  @override
  FutureOr<void> build() {
    _authRepo = ref.watch(authRepoProvider);
  }

  Future<bool> signInWithGoogle() async {
    state = AsyncValue.loading();
    final result = await AsyncValue.guard(() => _authRepo.signInWithGoogle());
    if (result.hasError) {
      state = AsyncValue.error(result.error!, result.stackTrace!);
      return false;
    }
    state = AsyncValue.data(null);
    return result.value != null;
  }

  Future<void> signOut() async {
    state = AsyncValue.loading();
    final result = await AsyncValue.guard(() => _authRepo.signOut());
    if (result.hasError) {
      state = AsyncValue.error(result.error!, result.stackTrace!);
    } else {
      state = AsyncValue.data(null);
    }
  }
}

final authControllerProvider = AsyncNotifierProvider<AuthController, void>(
  AuthController.new,
);
