import 'dart:developer';

import 'package:chahele_project/controller/course_provider.dart';
import 'package:chahele_project/model/exam_model.dart';
import 'package:chahele_project/utils/constant_colors/constant_colors.dart';
import 'package:chahele_project/view/exam_tab/screens/result_screen.dart';
import 'package:chahele_project/view/exam_tab/widgets/timer.dart';
import 'package:chahele_project/widgets/button_widget.dart';
import 'package:chahele_project/widgets/customAlertDialogue.dart';
import 'package:chahele_project/widgets/heading_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class ExamScreen extends StatefulWidget {
  const ExamScreen(
      {super.key,
      required this.sectionId,
      required this.examProvider,
      required this.index});
  final CourseProvider examProvider;
  final String sectionId;
  final int index;

  @override
  State<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  List<int?> selectedOption = [];
  List<String> optionLabels = ["A", "B", "C", "D"];
  // int index = 0;

  @override
  void initState() {
    // int questionCount = totalQuestionsLength(widget.examProvider.examDataList[widget.index].examData);

    selectedOption =
        List.filled(widget.examProvider.examDataList!.examData.length, null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final examProvider = Provider.of<CourseProvider>(context);

    int maxTimeAllowed = 30;

    int optionLength =
        widget.examProvider.examDataList!.examData[widget.index].options.length;
    int questionCount = widget.examProvider.examDataList!.examData.length;

    log(questionCount.toString());

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const HeadingAppBar(heading: "Chapter Name", isBackButtomn: true),
          const SliverGap(8),
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            primary: true,
            flexibleSpace: Container(
              height: 100,
              width: screenWidth,
              decoration: BoxDecoration(
                color: ConstantColors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                      color: ConstantColors.black.withOpacity(0.1))
                ],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Test 1",
                      style: TextStyle(
                          color: ConstantColors.headingBlue,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    TimerWidget(
                      maxTimeAllowed: maxTimeAllowed,
                      onTimerFinish: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultScreen(
                              selectedOption: selectedOption,
                              totalQuestion: questionCount,
                              questionsAnswered: totalAnsweredQuestions(),
                              totalScore: calculateTotal(),
                              index: widget.index,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          // const SliverGap(16),

          //Question List
          SliverList.separated(
            separatorBuilder: (context, index) => const Gap(8),
            itemCount: questionCount,
            itemBuilder: (context, questionIndex) => Container(
              width: screenWidth,
              decoration: BoxDecoration(
                color: ConstantColors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                    color: ConstantColors.black.withOpacity(0.1),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Question ${questionIndex + 1}",
                      style: const TextStyle(
                          color: ConstantColors.headingBlue,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, top: 8),
                      child: Text(
                        examProvider.examDataList!.examData[questionIndex]
                                .question ??
                            "No Question Found",
                        style: const TextStyle(
                            color: ConstantColors.headingBlue,
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                      ),
                    ),
                    const Gap(8),
                    const Text(
                      "Options",
                      style: TextStyle(
                          color: ConstantColors.headingBlue,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => const Gap(8),
                      itemCount: optionLength,
                      itemBuilder: (context, optionIndex) => GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedOption[questionIndex] = optionIndex;
                          });
                        },
                        child: Container(
                          height: 40,
                          width: screenWidth,
                          decoration: BoxDecoration(
                            color: selectedOption[questionIndex] == optionIndex
                                ? ConstantColors.buttonScndColor
                                : ConstantColors.unselectedIndex,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              children: [
                                Text(
                                  "${optionLabels[optionIndex]}) ${examProvider.examDataList?.examData[questionIndex].options[optionIndex]}",
                                  style: const TextStyle(
                                      color: ConstantColors.headingBlue,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: ButtonWidget(
                  buttonHeight: 50,
                  buttonWidth: 200,
                  buttonColor: ConstantColors.mainBlueTheme,
                  buttonText: "Finish",
                  onPressed: () {
                    // final totalScore = calculateTotal();
                    // final totalQuestion = SampleQuestions.quizData.length;
                    // final questionsAnswered = totalAnsweredQuestions();

                    customAlertDailogue(
                      context: context,
                      message: "Are You Confirm to Finish Exam",
                      onYes: () {
                        Navigator.pop(context);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultScreen(
                              selectedOption: selectedOption,
                              totalQuestion: questionCount,
                              questionsAnswered: totalAnsweredQuestions(),
                              totalScore: calculateTotal(),
                              index: widget.index,
                            ),
                          ),
                        );
                      },
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }

  int calculateTotal() {
    final examProvider = Provider.of<CourseProvider>(context);

    int score = 0;

    for (int i = 0; i < selectedOption.length; i++) {
      if (selectedOption[i] != null &&
          selectedOption[i] == examProvider.examDataList!.examData[i].answer) {
        score++;
      }
    }
    return score;
  }

  int totalAnsweredQuestions() {
    int count = 0;
    for (int i = 0; i < selectedOption.length; i++) {
      if (selectedOption[i] != null) {
        count++;
      }
    }
    return count;
  }

  // void navigateToResultScreen() {
  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => ResultScreen(
  //         selectedOption: selectedOption,
  //         totalQuestion: SampleQuestions.quizData.length,
  //         questionsAnswered: totalAnsweredQuestions(),
  //         totalScore: calculateTotal(),
  //       ),
  //     ),
  //   );
  // }

  int totalOptionLength(List<ListExamModel> examList) {
    int count = 0;

    for (int i = 0; i < examList.length; i++) {
      for (int j = 0; j < examList[i].examData.length; j++) {
        count += examList[i].examData[j].options.length;
      }
    }
    return count;
  }

  int totalQuestionsLength(List<ListExamModel> examList) {
    int questionsCount = 0;

    for (int i = 0; i < examList.length; i++) {
      questionsCount += examList[i].examData.length;
    }
    return questionsCount;
  }
}
