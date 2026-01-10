import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Get user data once
  Future<Map<String, dynamic>?> getUser(String uid) async {
    try {
      final doc = await _firestore.collection('users').doc(uid).get();
      if (!doc.exists) return null;
      return doc.data();
    } catch (e) {
      return null;
    }
  }

  /// Listen to user changes
  Stream<DocumentSnapshot<Map<String, dynamic>>> getUserStream(String uid) {
    return _firestore.collection('users').doc(uid).snapshots();
  }

  /// Create user document (admin / student)
  Future<void> createUser({
    required String uid,
    required String name,
    required String email,
    required String role, // admin | student
  }) async {
    await _firestore.collection('users').doc(uid).set({
      'name': name,
      'email': email,
      'role': role,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }


/// Get students
  Stream<List<Map<String, dynamic>>> getStudents() {
  return FirebaseFirestore.instance
      .collection('users')
      .where('role', isEqualTo: 'student')
      .snapshots()
      .map((snapshot) {
    return snapshot.docs.map((doc) {
      final data = doc.data();
      data['uid'] = doc.id;
      return data;
    }).toList();
  });
}

/// Delete student
  /// Delete student
  Future<void> deleteStudent(String uid) async {
    try {
      await _firestore.collection('users').doc(uid).delete();
    } catch (e) {
      throw Exception('فشل حذف الطالب: $e');
    }
  }




  Future<void> toggleStudentStatus({
    required String uid,
    required bool isActive,
  }) async {
    try {
      await _firestore.collection('users').doc(uid).update({
        'status': isActive ? 'inactive' : 'active',
      });
    } catch (e) {
      throw Exception('فشل تحديث حالة الطالب: $e');
    }
  }
}
