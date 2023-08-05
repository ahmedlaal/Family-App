import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:newfamly/admin/student_model.dart';

class Repos extends GetxController {
  static Repos get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  void createUser(StudentModel studentModel) async {
    final doc = await _db.collection('students').doc(studentModel.name).get();
    if (doc.exists && doc.data() != null) {
      // Student already exists
      Get.snackbar('Failed', 'Student already exists');
    } else {
      await _db
          .collection('students')
          .add(studentModel.toJason())
          .then((docRef) {
        Get.snackbar('Success', 'Student has been registered');
      }).catchError((error) {
        Get.snackbar('Failed', 'Something went wrong');
      });
    }
  }
}
