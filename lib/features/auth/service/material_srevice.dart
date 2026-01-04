import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class MaterialService {
  final _db = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;

  // رفع ملف جديد
  Future<void> uploadMaterial({
    required String title,
    required File file,
  }) async {
    final ref = _storage.ref().child('materials/${file.path.split('/').last}');
    await ref.putFile(file);
    final url = await ref.getDownloadURL();

    await _db.collection('materials').add({
      'title': title,
      'fileUrl': url,
      'uploadedAt': FieldValue.serverTimestamp(),
    });
  }

  // جلب كل المواد
  Stream<QuerySnapshot> getMaterials() {
    return _db.collection('materials').snapshots();
  }
}
