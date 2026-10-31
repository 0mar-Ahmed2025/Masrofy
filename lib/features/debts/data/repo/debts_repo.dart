import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:masrofy/core/services/firebase_service.dart';
import 'package:masrofy/features/debts/data/models/debt_model.dart';

class DebtsRepository {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;

  DebtsRepository({
    required FirebaseFirestore firestore,
    required FirebaseAuth auth,
  }) : _firebaseFirestore = firestore,
       _firebaseAuth = auth;

  CollectionReference<Map<String, dynamic>> get _debtsCollection {
    final uid = _firebaseAuth.currentUser!.uid;
    return _firebaseFirestore.collection("users").doc(uid).collection("debts");
  }

  // add debt
  Future<void> addDebt(DebtModel debt) async {
    await _debtsCollection.add(debt.toMap());
  }

  // update
  Future<void> updateDebt(DebtModel debt) async {
    await _debtsCollection.doc(debt.id).update(debt.toMap());
  }

  // delete
  Future<void> deleteDebt(String id) async {
    await _debtsCollection.doc(id).delete();
  }

  Future<List<DebtModel>> getDebts() async {
    final snapshot = await _debtsCollection.get();
    return snapshot.docs
        .map((doc) => DebtModel.fromMap(doc.id, doc.data()))
        .toList();
  }
}

final debtsRepositoryProvider = Provider<DebtsRepository>(
  (ref) => DebtsRepository(
    auth: ref.watch(firebaseAuthProvider),
    firestore: ref.watch(firestoreProvider),
  ),
);
