import 'package:flutter/material.dart';
import 'package:lab_1_2025_2026/Models/exam_model.dart';
import 'package:lab_1_2025_2026/Widgets/exam_card.dart';

class ExamsList extends StatefulWidget {
  final List<Exam> exams;

  const ExamsList({super.key, required this.exams});

  @override
  State<ExamsList> createState() => _ExamsListState();
}

class _ExamsListState extends State<ExamsList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(20),
      itemCount: widget.exams.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return ExamCard(exam: widget.exams[index]);
      },
    );
  }
}
