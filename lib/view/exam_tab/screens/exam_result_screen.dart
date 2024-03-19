import 'package:chahele_project/controller/sample_questions.dart';
import 'package:chahele_project/utils/constant_colors/constant_colors.dart';
import 'package:chahele_project/utils/constant_icons/constant_icons.dart';
import 'package:chahele_project/view/widgets/heading_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class ExamResultScreen extends StatelessWidget {
  const ExamResultScreen(
      {super.key,
      required this.selectedOption,
      required this.totalQuestion,
      required this.totalscore,
      required this.questionsAnswered});

  final List<int?> selectedOption;
  final int totalQuestion;
  final int totalscore;
  final int questionsAnswered;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    List<String> optionLabels = ["A", "B", "C", "D"];

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const HeadingAppBar(heading: "Your Result", isBackButtomn: true),
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Questions :- $totalQuestion",
                          style: const TextStyle(
                              color: ConstantColors.headingBlue,
                              fontWeight: FontWeight.w500),
                        ),
                        const Gap(5),
                        Text(
                          "Questions Answered :- $questionsAnswered",
                          style: const TextStyle(
                              color: ConstantColors.headingBlue,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Text(
                            "Your Score",
                            style: TextStyle(
                                color: ConstantColors.headingBlue,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "$totalscore",
                            style: const TextStyle(
                                fontSize: 40,
                                color: ConstantColors.headingBlue,
                                fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          // const SliverGap(16),
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
                      itemBuilder: (context, optionIndex) => Container(
                        height: 40,
                        width: screenWidth,
                        decoration: BoxDecoration(
                          color: SampleQuestions.quizData[questionIndex]
                                      ['answer'] ==
                                  optionIndex
                              ? Colors.green.withOpacity(0.7)
                              : selectedOption[questionIndex] == optionIndex
                                  ? optionIndex ==
                                          SampleQuestions
                                              .quizData[questionIndex]['answer']
                                      ? Colors.green.withOpacity(0.7)
                                      : Colors.red.withOpacity(0.7)
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
                  ],
                ),
              ),
            ),
          ),

          //Button 1
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Container(
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: ConstantColors.mainBlueTheme),
                child: const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.replay,
                        color: ConstantColors.white,
                        size: 20,
                      ),
                      Gap(5),
                      Text(
                        "Rewatch Section",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: ConstantColors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          //Button 2
          totalscore >= 10
              ? SliverToBoxAdapter(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 24, right: 24, bottom: 24),
                    child: Container(
                      height: 40,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: ConstantColors.mainBlueTheme),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              ConstantIcons.homeSelectedSvg,
                              // ignore: deprecated_member_use
                              color: ConstantColors.white,
                              height: 18,
                              width: 18,
                            ),
                            const Gap(7),
                            const Text(
                              "Go to Home",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: ConstantColors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : SliverGap(0),
        ],
      ),
    );
  }
}
