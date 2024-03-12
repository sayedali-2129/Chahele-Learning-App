import 'package:chahele_project/controller/sample_questions.dart';
import 'package:chahele_project/utils/constant_colors/constant_colors.dart';
import 'package:chahele_project/utils/constant_icons/constant_icons.dart';
import 'package:chahele_project/view/exam_tab/screens/exaapmle.dart';
import 'package:chahele_project/view/exam_tab/screens/result_screen.dart';
import 'package:chahele_project/view/widgets/button_widget.dart';
import 'package:chahele_project/view/widgets/customAlertDialogue.dart';
import 'package:chahele_project/view/widgets/heading_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class ExamScreen extends StatefulWidget {
  const ExamScreen({super.key});

  @override
  State<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  List<int?> selectedOption =
      List.filled(SampleQuestions.quizData.length, null);
  List<String> optionLabels = ["A", "B", "C", "D"];
  // int index = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const HeadingAppBar(heading: "Chapter Name", isBackButtomn: true),
          const SliverGap(8),
          SliverToBoxAdapter(
            child: Container(
              height: 80,
              width: screenWidth,
              decoration: BoxDecoration(
                  color: ConstantColors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                        color: ConstantColors.black.withOpacity(0.1))
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(16),
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
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ExampleScreen()));
                      },
                      child: SvgPicture.asset(
                        ConstantIcons.timerSample,
                        height: 70,
                        width: 70,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SliverGap(16),
          SliverList.separated(
            separatorBuilder: (context, index) => const Gap(8),
            itemCount: SampleQuestions.quizData.length,
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
                        SampleQuestions.quizData[questionIndex]["question"],
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
                      itemCount: 4,
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
                                  "${optionLabels[optionIndex]}) ${SampleQuestions.quizData[questionIndex]["option"][optionIndex]}",
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
                  final totalScore = calculateTotal();
                  final totalQuestion = SampleQuestions.quizData.length;

                  customAlertDailogue(
                    context: context,
                    message: "Are You Confirm to Finish Exam",
                    onYes: () {
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultScreen(
                              totalScore: totalScore,
                              totalQuestion: totalQuestion),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  int calculateTotal() {
    int score = 0;

    for (int i = 0; i < selectedOption.length; i++) {
      if (selectedOption[i] != null &&
          selectedOption[i] == SampleQuestions.quizData[i]["answer"]) {
        score++;
      }
    }
    return score;
  }
}
