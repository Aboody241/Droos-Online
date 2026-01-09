import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// تسجيل دخول
  Future<User?> login({
    required String email,
    required String password,
  }) async {
    final cred = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return cred.user;
  }

  User? get currentUser => _auth.currentUser;

  Future<void> logout() async {
    await _auth.signOut();
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// ✅ Register student WITHOUT logging out admin
  Future<User?> registerStudent({
    required String email,
    required String password,
    required String name,
  }) async {
    // Create a separate auth instance to avoid logging out the current user
    final FirebaseAuth tempAuth = FirebaseAuth.instanceFor(
      app: FirebaseAuth.instance.app,
    );
    
    try {
      // Create user in Firebase Auth
      final cred = await tempAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Create user document in Firestore
      if (cred.user != null) {
        await _firestore.collection('users').doc(cred.user!.uid).set({
          'name': name,
          'email': email,
          'role': 'student',
          'createdAt': FieldValue.serverTimestamp(),
        });
      }

      return cred.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        // Re-throw with Arabic error message
        throw FirebaseAuthException(
          code: 'email-already-in-use',
          message: 'البريد الإلكتروني مستخدم مسبقاً',
        );
      }
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
