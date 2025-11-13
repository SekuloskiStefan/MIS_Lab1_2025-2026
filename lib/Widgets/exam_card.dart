import 'package:flutter/material.dart';
import 'package:lab_1_2025_2026/Core/Constants/routes.dart';
import 'package:lab_1_2025_2026/Models/exam_model.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;

  const ExamCard({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, examDetailsPageRoute, arguments: exam);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: exam.examHasPassed()
              ? Colors.red.shade100
              : Colors.green.shade100,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.blue, width: 3),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              spacing: 15,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "${exam.dateTime.day}.${exam.dateTime.month}.${exam.dateTime.year}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.access_time,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "${exam.dateTime.hour}:00",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    exam.name,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.door_back_door_outlined,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            exam.classRooms.join(', '),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
