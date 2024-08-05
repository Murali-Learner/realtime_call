import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:realtime_call/extensions/toast_utils.dart';
import 'package:realtime_call/models/contact_model.dart';

class RealtimeDBService {
  DatabaseReference ref = FirebaseDatabase.instance.ref();

  Future<void> addUser(String uid, String email) async {
    try {
      await ref.child('users/$uid').set({
        'name': email,
        'UID': uid,
        'joined': false,
        'whoIsCalling': '',
      });
    } catch (e) {
      ToastUtils.showErrorToast("DB Error $e");
      rethrow;
    }
  }

// Contact
  Future<Contact?> getUser(String uid) async {
    final DatabaseReference userRef =
        FirebaseDatabase.instance.ref().child('users/$uid');

    try {
      final DataSnapshot snapshot = await userRef.get();
      if (snapshot.exists) {
        final Map<dynamic, dynamic> userData =
            snapshot.value as Map<dynamic, dynamic>;
        final Map<String, dynamic> userMap =
            Map<String, dynamic>.from(userData);
        debugPrint("userMap $userMap");
        return Contact.fromJson(userMap);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint('Error retrieving user: $e');
      return null;
    }
  }

// getUserUpdates
  Future<void> updateUser(
    Contact contact,
    String currentUID,
  ) async {
    try {
      await ref.child('users').child(contact.uid).update(
          {"joined": contact.joined, "whoIsCalling": contact.whoIsCalling});
      await ref
          .child('users')
          .child(currentUID)
          .update({"joined": contact.joined});

      debugPrint("User updated");
    } catch (e) {
      debugPrint("Error updating user: $e");
      rethrow;
    }
  }

//get All users
  Stream<Map<String, Contact>> getUsers() {
    return ref.child('users').onValue.map((event) {
      DataSnapshot snapshot = event.snapshot;
      Map<String, Contact> usersMap = {};
      if (snapshot.value != null) {
        final Map<dynamic, dynamic> usersData =
            snapshot.value as Map<dynamic, dynamic>;
        usersData.forEach((key, value) {
          final values = Map<String, dynamic>.from(value);
          usersMap[key] = Contact.fromJson(values);
        });
      }

      return usersMap;
    });
  }
}
