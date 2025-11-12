class Exam {
  final String subjectName;
  final DateTime dateTime;
  final List<String> rooms;
  bool isPassed;
  bool willTake;

  Exam({
    required this.subjectName,
    required this.dateTime,
    required this.rooms,
    this.isPassed = false,
    this.willTake=false,
  });
}
