import 'package:flutter/material.dart';
import 'package:lab_1_2025_2026/Core/Constants/routes.dart';
import 'package:lab_1_2025_2026/Screens/exam_details_page.dart';
import 'package:lab_1_2025_2026/Screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Распоред за испити - 141127',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.green),
        brightness: Brightness.light,
      ),
      initialRoute: homePageRoute,
      routes: {
        homePageRoute: (context) =>
            const HomePage(title: 'Распоред за испити - 141127'),
        examDetailsPageRoute: (context) => const ExamDetailsPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
