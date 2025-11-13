import 'package:flutter/material.dart';
import 'package:lab_1_2025_2026/Models/exam_model.dart';

class ExamDetailsPage extends StatelessWidget {
  const ExamDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final exam = ModalRoute.of(context)!.settings.arguments as Exam;
    final differenceDays = DateTime.now()
        .difference(exam.dateTime)
        .inDays
        .abs();
    final differenceHours =
        DateTime.now().difference(exam.dateTime).inHours.abs() -
        differenceDays * 24;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 90,
        backgroundColor: Colors.blue.shade300,
        foregroundColor: Colors.blue.shade300,
        shadowColor: Colors.blue.shade300,
        surfaceTintColor: Colors.blue.shade500,
        titleTextStyle: TextStyle(
          color: Colors.blue.shade50,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        title: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Center(
            child: Image.asset(
              "assets/moodle-io.png",
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.blue.shade300,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: EdgeInsets.all(30),
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: exam.examHasPassed()
              ? Colors.red.shade100
              : Colors.green.shade100,
          border: BoxBorder.all(
            color: Colors.blue,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Испитот по предметот ${exam.name} ${exam.examHasPassed() ? 'се оддржа' : 'ќе се оддржи'} "
              "на ден ${exam.dateTime.day}.${exam.dateTime.month}.${exam.dateTime.year} во ${exam.dateTime.hour}:00 часот.",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            Column(
              children: [
                Text(
                  "${exam.examHasPassed() ? 'Испитот се оддржа пред ' : 'Испитот ќе се оддржи за '} ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    color: exam.examHasPassed() ? Colors.red : Colors.green,
                  ),
                ),
                Text(
                  "${differenceDays} "
                  "${differenceDays % 10 == 1 ? 'ден' : 'дена'} и "
                  "${differenceHours} "
                  "${differenceHours % 10 == 1 ? 'час' : 'часа'} "
                  "во ${exam.classRooms.join(", ")}.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    color: exam.examHasPassed() ? Colors.red : Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
