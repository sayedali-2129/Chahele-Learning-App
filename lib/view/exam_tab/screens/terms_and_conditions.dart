import 'package:chahele_project/controller/course_provider.dart';
import 'package:chahele_project/utils/constant_colors/constant_colors.dart';
import 'package:chahele_project/utils/constant_icons/constant_icons.dart';
import 'package:chahele_project/view/exam_tab/screens/exam_screen.dart';
import 'package:chahele_project/view/exam_tab/widgets/appbar_terms.dart';
import 'package:chahele_project/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class ExamTandCScreen extends StatefulWidget {
  const ExamTandCScreen({super.key, this.sectionId, this.index});
  final String? sectionId;
  final int? index;

  @override
  State<ExamTandCScreen> createState() => _ExamTandCScreenState();
}

class _ExamTandCScreenState extends State<ExamTandCScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<CourseProvider>(context, listen: false)
          .fetchExamData(widget.sectionId!);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final examProvider = Provider.of<CourseProvider>(context);

    return PopScope(
      canPop: false,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            const AppBarTandC(),
            const SliverGap(24),
            SliverToBoxAdapter(
              child: Container(
                width: screenWidth,
                height: 159,
                decoration: BoxDecoration(
                    color: ConstantColors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 7,
                          offset: const Offset(0, 1),
                          color: ConstantColors.black.withOpacity(0.15))
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(16),

                  //Exam Details
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "EXAM DETAILS",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: ConstantColors.black.withOpacity(0.7)),
                      ),
                      const Gap(16),
                      const ExamDetailsRow(
                          text: "30 Minutes", icon: ConstantIcons.timeIcon),
                      const Gap(16),
                      const ExamDetailsRow(
                          text: "100 Marks", icon: ConstantIcons.markIcon),
                      const Gap(16),
                      const ExamDetailsRow(
                          text: "10 Questions",
                          icon: ConstantIcons.questionIcon),
                    ],
                  ),
                ),
              ),
            ),
            const SliverGap(16),

            //Exam Terms
            SliverToBoxAdapter(
              child: Container(
                height: 300,
                width: screenWidth,
                decoration: BoxDecoration(
                    color: ConstantColors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 7,
                          offset: const Offset(0, 1),
                          color: ConstantColors.black.withOpacity(0.15))
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "CHAHEL Exam terms",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: ConstantColors.black.withOpacity(0.7)),
                      ),
                      const Gap(24),
                      const Text(
                        "Topics",
                        style: TextStyle(
                            color: ConstantColors.headingBlue,
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                      ),
                      const Gap(8),
                      Text(
                        "Introduction to kalari  payattu, attack, deffence, poozhikadakam, olinj maattam",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            color: ConstantColors.black.withOpacity(0.5),
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                      ),
                      const Gap(8),
                      const Text(
                        "Terms",
                        style: TextStyle(
                            color: ConstantColors.headingBlue,
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                      ),
                      const Gap(8),
                      Text(
                        "■  You have only one chance to assessment",
                        style: TextStyle(
                            color: ConstantColors.black.withOpacity(0.5),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      const Gap(8),
                      Text(
                        "■  30minuts overall questions",
                        style: TextStyle(
                            color: ConstantColors.black.withOpacity(0.5),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      const Gap(8),
                      Text(
                        "■  score in the top 50% to get certificate",
                        style: TextStyle(
                            color: ConstantColors.black.withOpacity(0.5),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      const Gap(8),
                      Text(
                        "■  10 questions",
                        style: TextStyle(
                            color: ConstantColors.black.withOpacity(0.5),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    ButtonWidget(
                      buttonHeight: 42,
                      buttonWidth: screenWidth,
                      buttonColor: ConstantColors.mainBlueTheme,
                      buttonText: "Agree & Continue",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExamScreen(
                              index: widget.index!,
                              sectionId: widget.sectionId!,
                              examProvider: examProvider,
                            ),
                          ),
                        );
                      },
                    ),
                    const Gap(8),
                    OutlineButtonWidget(
                      buttonHeight: 42,
                      buttonWidth: screenWidth,
                      buttonColor: const Color(0xffF5F5F5),
                      buttonText: "Cancel",
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//Exam Details
class ExamDetailsRow extends StatelessWidget {
  const ExamDetailsRow({
    super.key,
    required this.text,
    required this.icon,
  });
  final String text;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          height: 14,
          width: 14,
        ),
        const Gap(14),
        Text(
          text,
          style: const TextStyle(
              color: ConstantColors.headingBlue,
              fontSize: 12,
              fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
