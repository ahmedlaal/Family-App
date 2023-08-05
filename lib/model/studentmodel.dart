import 'package:cloud_firestore/cloud_firestore.dart';

class Mystudent {
  String uid;
  String student_name;
  String age;
  String father_name;
  String email;
  String password;
  String profilepic;

  Mystudent(
      {required this.student_name,
      required this.father_name,
      required this.age,
      required this.email,
      required this.password,
      required this.profilepic,
      required this.uid});

  Map<String, dynamic> toJason() => {
        "Student Name": student_name,
        "Age": age,
        "Father Name": father_name,
        "email": email,
        "password": password,
        "profilepic": profilepic,
        "uid": uid
      };
  static Mystudent fromsnap(DocumentSnapshot snapshot) {
    var snap = snapshot.data() as Map<String, dynamic>;
    return Mystudent(
        student_name: snap['Student Name'],
        age: snap['Age'],
        father_name: snap['Father Name'],
        email: snap['email'],
        password: snap['password'],
        profilepic: snap['profilepic'],
        uid: snap['uid']);
  }
}
