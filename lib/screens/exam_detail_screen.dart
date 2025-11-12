import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/exam.dart';

class ExamDetailScreen extends StatefulWidget {
  final Exam exam;

  const ExamDetailScreen({required this.exam, super.key});

  @override
  State<ExamDetailScreen> createState() => _ExamDetailScreenState();
}

class _ExamDetailScreenState extends State<ExamDetailScreen> {
  bool willTake = false;

  @override
  void initState() {
    super.initState();
    willTake = widget.exam.willTake;
  }

  String timeRemaining() {
    DateTime now = DateTime.now();
    Duration diff = widget.exam.dateTime.difference(now);
    int days = diff.inDays;
    int hours = diff.inHours % 24;

    if (diff.isNegative) {
      return "${days.abs()} дена и ${hours.abs()} часа поминати";
    } else {
      return "$days дена и $hours часа преостанати";
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isUpcoming = widget.exam.dateTime.isAfter(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.exam.subjectName),
        backgroundColor: Colors.pink[300],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Предмет: ${widget.exam.subjectName}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "Датум: ${DateFormat('dd.MM.yyyy – HH:mm').format(widget.exam.dateTime)}",
            ),
            const SizedBox(height: 10),
            Text(
              "Просторија: ${widget.exam.rooms.join(', ')}",
            ),
            const SizedBox(height: 20),
            Text(
              "Време: ${timeRemaining()}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            if (isUpcoming)
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      willTake = !willTake;
                      widget.exam.willTake = willTake;
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          willTake ? "Ќе го полагате овој испит" : "Откажано од испит",
                        ),
                        backgroundColor: Colors.pink,
                        behavior: SnackBarBehavior.floating,
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                  icon: Icon(
                    willTake ? Icons.check_circle : Icons.check_circle_outline,
                    color: Colors.white,
                  ),
                  label: Text(
                    willTake ? "Ќе полагам" : "Означи дека ќе полагам",
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: willTake ? Colors.green : Colors.pink[300],
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
