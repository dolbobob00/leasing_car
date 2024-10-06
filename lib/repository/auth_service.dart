import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  void signOut() {
    firebaseAuth.signOut();
  }

  User? getCurrentUser() {
    return firebaseAuth.currentUser;
  }

  Future<UserCredential> signInWithEmail(String email, String password) async {
    try {
      final user = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return user;
    } on FirebaseAuthException catch (e) {
      rethrow;
    }
  }

  Future<UserCredential?> signUpAsGuest() async {
    return await firebaseAuth.signInAnonymously();
  }

  Future<UserCredential> signUpWithEmail(String email, String password) async {
    try {
      final user = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return user;
    } on FirebaseAuthException catch (e) {
      rethrow;
    }
  }

  Future<UserCredential?> logInWithEmail(String email, String passord) async {
    try {} on FirebaseAuthException {}
    return null;
  }

}
