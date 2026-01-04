import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  final _db = FirebaseFirestore.instance;

  // إنشاء طالب جديد
  Future<void> createStudent({
    required String name,
    required String email,
    required String password,
  }) async {
    final userCred = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    final uid = userCred.user!.uid;

    await _db.collection('users').doc(uid).set({
      'name': name,
      'email': email,
      'role': 'student',
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Stream<QuerySnapshot> getAllStudents() {
    return _db.collection('users')
        .where('role', isEqualTo: 'student')
        .snapshots();
  }

  Future<String?> getUserRole(String uid) async {
    final doc = await _db.collection('users').doc(uid).get();
    return doc.data()?['role'] as String?;
  }
}
