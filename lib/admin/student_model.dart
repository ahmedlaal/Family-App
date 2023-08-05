class StudentModel {
  String name;

  StudentModel({required this.name});

  toJason() {
    return {"Name": name};
  }
}
