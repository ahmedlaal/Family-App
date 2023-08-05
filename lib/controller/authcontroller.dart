import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newfamly/model/studentmodel.dart';
import 'package:newfamly/parents/bottom_bar.dart';

class Authcontroller extends GetxController {
  static Authcontroller get instance => Get.find();
  File? proimage;

  void imagepicker() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    }
    final img = File(image.path);
    this.proimage = img;
  }

  Future<void> addstudent(
    String student_name,
    String age,
    String father_name,
    String email,
    String password,
    File? file,
  ) async {
    try {
      if (student_name.isNotEmpty &&
          age.isNotEmpty &&
          father_name.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          file != null) {
        UserCredential credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        String dwurl = await _uploadpic(file);
        Mystudent user = Mystudent(
          student_name: student_name,
          age: age,
          father_name: father_name,
          email: email,
          password: password,
          profilepic: dwurl,
          uid: credential.user!.uid,
        );
        await FirebaseFirestore.instance
            .collection('students')
            .doc(credential.user!.uid)
            .set(user.toJason());
      }
    } catch (e) {
      print(e);
      Get.snackbar("Error", e.toString());
    }
  }

  Future<String> _uploadpic(File image) async {
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('profilepic')
        .child(FirebaseAuth.instance.currentUser!.uid);
    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snapshot = await uploadTask;
    String imageDWurl = await snapshot.ref.getDownloadURL();
    return imageDWurl;
  }

  void login(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        try {
          await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password);
          Get.to(() => MyHome());
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            Get.snackbar("Error", "Wrong Email Provided");
          } else if (e.code == 'wrong-password') {
            Get.snackbar("Error", "Wrong Password Provided");
          }
        }
      } else {
        Get.snackbar("Error", "Fill it complete");
      }
    } catch (e) {
      // Get.snackbar("Error", e.toString());
    }
  }

  late Rx<User?> _user;
  @override
  void onReady() {
    // TODO: implement onReady

    super.onReady();

    _user = Rx<User?>(FirebaseAuth.instance.currentUser);
    _user.bindStream(FirebaseAuth.instance.authStateChanges());
    ever(_user, (callback) => _loginuser);
  }

  _loginuser(User? user) {
    if (user == null) {
      // Get.to(SignIn());
    } else {
      // Get.to(HomeScreen());
    }
  }
}
