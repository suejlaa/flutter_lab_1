import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';
import 'exam_detail_screen.dart';

class ExamListScreen extends StatefulWidget {
  const ExamListScreen({super.key});

  @override
  State<ExamListScreen> createState() => _ExamListScreenState();
}

class _ExamListScreenState extends State<ExamListScreen> {
  final List<Exam> exams = [
    Exam(subjectName: "Математика 1", dateTime: DateTime(2026, 1, 12, 9, 0), rooms: ["Лаб 215", "Лаб 138"]),
    Exam(subjectName: "Напредно Програмирање", dateTime: DateTime(2026, 1, 15, 11, 0), rooms: ["Лаб 3"]),
    Exam(subjectName: "Физика", dateTime: DateTime(2025, 1, 18, 10, 0), rooms: ["П 215"], isPassed: true),
    Exam(subjectName: "ООП", dateTime: DateTime(2026, 2, 2, 12, 0), rooms: ["Лаб 12"]),
    Exam(subjectName: "Бази на податоци", dateTime: DateTime(2026, 2, 5, 8, 0), rooms: ["Лаб 13"]),
    Exam(subjectName: "Структурно Програмирање", dateTime: DateTime(2024, 12, 15, 9, 0), rooms: ["Лаб 2"], isPassed: true),
    Exam(subjectName: "AOK", dateTime: DateTime(2025, 2, 10, 10, 0), rooms: ["Лаб АБ"], isPassed: true),
    Exam(subjectName: "Софтверско инженерство", dateTime: DateTime(2025, 2, 20, 13, 0), rooms: ["Лаб 118"], isPassed: true),
    Exam(subjectName: "Компјутерски мрежи", dateTime: DateTime(2025, 1, 22, 9, 0), rooms: ["Лаб 12"], isPassed: true),
    Exam(subjectName: "Оперативни системи", dateTime: DateTime(2025, 1, 28, 9, 0), rooms: ["Лаб 138"], isPassed: true),
    Exam(subjectName: "Веб Програмирање", dateTime: DateTime(2026, 1, 28, 9, 0), rooms: ["Лаб 138"]),
    Exam(subjectName: "Визуелно Програмирање", dateTime: DateTime(2025, 6, 28, 9, 0), rooms: ["Лаб 138"], isPassed: true),
  ];

  @override
  Widget build(BuildContext context) {
    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Распоред за испити - 226039"),
        backgroundColor: Colors.pink[300],
      ),
      body: ListView.builder(
        itemCount: exams.length,
        itemBuilder: (context, index) {
          final exam = exams[index];
          return GestureDetector(
            onTap: () async {
              final updatedExam = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ExamDetailScreen(exam: exam),
                ),
              );
              if (updatedExam != null) {
                setState(() {}); // refreshes the screen
              }
            },
            child: ExamCard(exam: exam),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.pink[50],
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            "Вкупно испити: ${exams.length}",
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
