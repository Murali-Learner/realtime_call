import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:realtime_call/extensions/toast_utils.dart';
import 'package:realtime_call/models/contact_model.dart';
import 'package:realtime_call/providers/db_service.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final RealtimeDBService _dbService = RealtimeDBService();
  Contact? _currentUser;
  Contact? _callingUser;
  final Map<String, Contact> dbUsers = {};
  Contact? get currentUser => _currentUser;
  Contact? get callingUser => _callingUser;
  User? _authUser;
  User? get authUser => _authUser;

  bool _authLoader = true;

  AuthProvider() {
    setAuthLoader(true);
    _auth.authStateChanges().listen((User? user) {
      _authUser = user;

      log("_user ${_authUser}");
      notifyListeners();
      getCurrentUser();
    });
    setAuthLoader(false);
  }

  bool get authLoader => _authLoader;

  setAuthLoader(bool loading) {
    _authLoader = loading;
    notifyListeners();
  }

  void getCurrentUser() async {
    _currentUser = await _dbService.getUser(_authUser!.uid);
    notifyListeners();
    log(" _currentUser ${_currentUser!.toJson()}");
  }

  Stream<Map<String, Contact>> getUsers() {
    final usersStream = _dbService.getUsers();

    return usersStream.map((userMap) {
      for (var ke in userMap.entries) {
        if (ke.key != _currentUser!.uid) {
          dbUsers[ke.key] = ke.value;
        }
      }

      log("dbUsers $dbUsers");
      return dbUsers;
    });
  }

  setContact(String uid) {
    _callingUser = dbUsers.values.where((value) => value.uid == uid).first;
    notifyListeners();
  }

  Future<void> updateUser() async {
    _callingUser = _callingUser!.copyWith(
        joined: _callingUser!.joined, whoIsCalling: currentUser!.name);
    await _dbService.updateUser(_callingUser!, currentUser!.uid);
  }

  Future<void> signUp(String email, String password) async {
    _authLoader = true;
    notifyListeners();
    try {
      final UserCredential userCredentials = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      log("Signup user ${userCredentials.user!.uid}");
      await _dbService.addUser(userCredentials.user!.uid, email);
      ToastUtils.showSuccessToast('Sign up successful');
    } catch (e) {
      ToastUtils.showErrorToast('Failed to sign up: ${e.toString()}');
    }
    _authLoader = false;
    notifyListeners();
  }

  Future<void> signIn(String email, String password) async {
    _authLoader = true;
    notifyListeners();
    try {
      final UserCredential user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      log("Signup user ${user.user!.uid}");
      ToastUtils.showSuccessToast('Login successful');
    } catch (e) {
      ToastUtils.showErrorToast('Failed to login: ${e.toString()}');
    }
    _authLoader = false;
    notifyListeners();
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      ToastUtils.showSuccessToast('Sign out successful');
    } catch (e) {
      ToastUtils.showErrorToast('Failed to sign out: ${e.toString()}');
    }
  }
}
