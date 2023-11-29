import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:juicedates/model/user_data.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  UserData? _userData;

  UserData? get userData => _userData;

  AuthProvider() {
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        _userData = UserData(
          uid: user.uid,
          username: user.displayName ?? '',
          email: user.email ?? '',
          phonenumber: user.phoneNumber ?? '',
           eductionbackground: '',
        );
      } else {
        _userData = null;
      }
      notifyListeners();
    });
  }

  Future<bool> signUp(String email, String password, String username, String phoneNumber) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await _firestore.collection('users').doc(_auth.currentUser!.uid).set({
        'uid': _auth.currentUser!.uid,
        'username': username,
        'email': email,
        'phoneNumber': phoneNumber,
      }, SetOptions(merge: true));
      return true;
    } catch (error) {
      debugPrint('Error signing up: $error');
      return false;
    }
  }

  Future<bool> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (error) {
      debugPrint('Error logging in: $error');
      return false;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (error) {
      debugPrint('Error signing out: $error');
    }
  }

  Future<void> updateUserProfile(String username, String phoneNumber, int? age, int? gender) async {
    final user = _auth.currentUser;
    if (user != null) {
      await _firestore.collection('users').doc(user.uid).update({
        'username': username,
        'phoneNumber': phoneNumber,
        'age': age,
        'gender': gender,
      });
    }
  }
}
