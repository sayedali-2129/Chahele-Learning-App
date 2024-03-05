import 'package:chahele_project/utils/widgets/heading_app_bar.dart';
import 'package:flutter/material.dart';

class ExamScreen extends StatelessWidget {
  const ExamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Scaffold(
            body: CustomScrollView(
      slivers: [HeadingAppBar(heading: "Exams")],
    )));
  }
}
