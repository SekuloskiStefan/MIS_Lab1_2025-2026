class Exam {
  String name;
  DateTime dateTime;
  List<String> classRooms;

  Exam({required this.name, required this.dateTime, required this.classRooms});

  bool examHasPassed() {
    DateTime now = DateTime.now();
    return now.isAfter(dateTime);
  }
}
