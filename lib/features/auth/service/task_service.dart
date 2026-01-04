import 'package:cloud_firestore/cloud_firestore.dart';

class TaskService {
  final _db = FirebaseFirestore.instance;

  // إضافة Task جديد لطالب محدد
  Future<void> assignTask({
    required String title,
    required String description,
    required String studentId,
    required DateTime dueDate,
  }) async {
    await _db.collection('tasks').add({
      'title': title,
      'description': description,
      'studentId': studentId,
      'dueDate': Timestamp.fromDate(dueDate),
      'completed': false,
    });
  }

  // جلب جميع Tasks لطالب معين
  Stream<QuerySnapshot> getStudentTasks(String studentId) {
    return _db.collection('tasks')
        .where('studentId', isEqualTo: studentId)
        .snapshots();
  }
}
