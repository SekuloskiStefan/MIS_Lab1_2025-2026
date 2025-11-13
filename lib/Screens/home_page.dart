import 'package:flutter/material.dart';
import 'package:lab_1_2025_2026/Models/exam_model.dart';
import 'package:lab_1_2025_2026/Widgets/exams_list.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static List<Exam> exams = [
    Exam(
      name: "Бизнис и менаџмент",
      dateTime: DateTime(2025, 11, 19, 18),
      classRooms: ["АМФ ФИНКИ"],
    ),
    Exam(
      name: "Структурно програмирање",
      dateTime: DateTime(2015, 1, 31, 15),
      classRooms: ["АМФ ФИНКИ", "Б2.2", "АМФ МФ"],
    ),
    Exam(
      name: "Бизнис статистика",
      dateTime: DateTime(2026, 2, 15, 10),
      classRooms: ["ТМФ 315", "Б2.2", "Б3.2"],
    ),
    Exam(
      name: "Веб програмирање",
      dateTime: DateTime(2025, 11, 21, 17),
      classRooms: ["АМФ ФИНКИ"],
    ),
    Exam(
      name: "Бази на податоци",
      dateTime: DateTime(2024, 2, 8, 13),
      classRooms: ["223"],
    ),
    Exam(
      name: "Менаџмент информациски системи",
      dateTime: DateTime(2024, 1, 24, 18),
      classRooms: ["АМФ ФИНКИ"],
    ),
    Exam(
      name: "Објектно-ориентирано програмирање",
      dateTime: DateTime(2019, 6, 26, 14),
      classRooms: ["АМФ ФИНКИ", "Б2.2"],
    ),
    Exam(
      name: "Алгоритми и податочни структури",
      dateTime: DateTime(2025, 2, 13, 12),
      classRooms: ["АМФ МФ", "Б3.2"],
    ),
    Exam(
      name: "Мобилни информациски системи",
      dateTime: DateTime(2025, 12, 5, 14),
      classRooms: ["АМФ МФ"],
    ),
    Exam(
      name: "Маркетинг",
      dateTime: DateTime(2026, 2, 10, 12),
      classRooms: ["АМФ ТМФ", "ТМФ 203"],
    ),
  ];

  List<Exam> getSortedExams() {
    final examsSorted = exams;
    examsSorted.sort((a, b) => a.dateTime.compareTo(b.dateTime));
    return examsSorted;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        backgroundColor: Colors.blue.shade300,
        foregroundColor: Colors.blue.shade300,
        shadowColor: Colors.blue.shade300,
        surfaceTintColor: Colors.blue.shade500,
        titleTextStyle: TextStyle(
          color: Colors.blue.shade50,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                "assets/moodle-io.png",
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              widget.title,
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              children: [
                Flexible(
                  flex: 9,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: exams.isEmpty
                              ? Center(
                                  child: Text(
                                    "Немате испити за полагање",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 26,
                                    ),
                                  ),
                                )
                              : ExamsList(
                                  exams: getSortedExams(),
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade300,
                      border: Border(
                        top: BorderSide(color: Colors.blue.shade50, width: 3),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            left: 5,
            right: 5,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.blue.shade300,
                border: BoxBorder.all(
                  width: 3,
                  color: Colors.blue.shade50,
                ),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  exams.length.toString(),
                  style: TextStyle(
                    color: Colors.blue.shade50,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
