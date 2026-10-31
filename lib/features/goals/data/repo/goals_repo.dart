import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:masrofy/core/services/firebase_service.dart';
import 'package:masrofy/features/goals/data/models/goal_model.dart';

class GoalRepo {
  // firestore
  // firebaseauth => user id
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;

  GoalRepo({required FirebaseFirestore firestore, required FirebaseAuth auth})
    : _firebaseFirestore = firestore,
      _firebaseAuth = auth;

  CollectionReference<Map<String, dynamic>> get _goalsCollection {
    final uid = _firebaseAuth.currentUser!.uid;
    return _firebaseFirestore.collection("users").doc(uid).collection("goals");
  }

  // add goal
  Future<void> addGoal(GoalModel goal) async {
    await _goalsCollection.add(goal.toMap());
  }

  // update
  Future<void> updateGoal(GoalModel goal) async {
    await _goalsCollection.doc(goal.id).update(goal.toMap());
  }

  // delete
  Future<void> deleteGoal(String goalId) async {
    await _goalsCollection.doc(goalId).delete();
  }

  Future<List<GoalModel>> getGoals() async {
    final snapshot = await _goalsCollection.get();
    return snapshot.docs
        .map((doc) => GoalModel.fromMap(doc.id, doc.data()))
        .toList();
  }
}

final goalRepositoryProvider = Provider<GoalRepo>(
  (ref) => GoalRepo(
    auth: ref.watch(firebaseAuthProvider),
    firestore: ref.watch(firestoreProvider),
  ),
);
