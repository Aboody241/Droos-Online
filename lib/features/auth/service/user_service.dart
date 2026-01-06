import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// get user document
  Future<Map<String, dynamic>?> getUser(String uid) async {
    try {
      final doc =
          await _firestore.collection('users').doc(uid).get();

      if (!doc.exists) return null;

      return doc.data();
    } catch (e) {
      return null;
    }
  }

  /// get user stream
  Stream<DocumentSnapshot<Map<String, dynamic>>> getUserStream(String uid) {
    return _firestore.collection('users').doc(uid).snapshots();
  }

  /// create user (admin only)
  Future<void> createUser({
    required String uid,
    required String name,
    required String email,
    required String role,
  }) async {
    await _firestore.collection('users').doc(uid).set({
      'name': name,
      'email': email,
      'role': role, // admin | student
      'createdAt': FieldValue.serverTimestamp(),
    });
  }
}



