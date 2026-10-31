import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:masrofy/core/services/firebase_service.dart';
import 'package:masrofy/features/auth/data/models/user_model.dart';

class AuthRepo {
  // call firestore, auth, google signin

  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;
  final GoogleSignIn _googleSignin;

  AuthRepo({
    required FirebaseAuth auth,
    required FirebaseFirestore firestore,
    required GoogleSignIn googleSignIn,
  }) : _firebaseAuth = auth,
       _firebaseFirestore = firestore,
       _googleSignin = googleSignIn;

  // build signin func
  Future<UserCredential?> signInWithGoogle() async {
    // 1 open and choose email
    try {
      final googleUser = await _googleSignin.authenticate();
      // 2 choose email = auth
      final googleAuth = googleUser.authentication;
      // 3 creat credential
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );
      // 4 pass credential to firebase auth
      final userCredential = await _firebaseAuth.signInWithCredential(
        credential,
      );
      if (userCredential.user != null) {
        _saveUserToFirestore(userCredential.user!);
      }
      return userCredential;
    } catch (e) {
      log(e.toString());
    }
  }

  // get user state -> is auth or not
  // get user data
  User get user => _firebaseAuth.currentUser!;

  CollectionReference<Map<String, dynamic>> get _userCollection =>
      _firebaseFirestore.collection('users');
  // save user to firestore
  Future<void> _saveUserToFirestore(User user) async {
    final userModel = UserModel.fromFirestore(user);
    await _userCollection.doc(user.uid).set(userModel.toJson());
  }

  // SignOut
  Future<void> signOut() async {
    await Future.wait([_firebaseAuth.signOut(), _googleSignin.signOut()]);
  }
}

final authRepoProvider = Provider(
  (ref) => AuthRepo(
    auth: ref.watch(firebaseAuthProvider),
    firestore: ref.watch(firestoreProvider),
    googleSignIn: ref.watch(googleSignInProvider),
  ),
);
