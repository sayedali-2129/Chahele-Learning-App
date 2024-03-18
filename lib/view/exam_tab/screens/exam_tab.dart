import 'package:chahele_project/controller/authentication_provider.dart';
import 'package:chahele_project/utils/constant_colors/constant_colors.dart';
import 'package:chahele_project/utils/constant_images/constant_images.dart';
import 'package:chahele_project/view/authentication_screens/login_screen.dart';
import 'package:chahele_project/view/exam_tab/screens/terms_and_conditions.dart';
import 'package:chahele_project/view/profile_tab/widgets/profile_card.dart';
import 'package:chahele_project/view/widgets/button_widget.dart';
import 'package:chahele_project/view/widgets/heading_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class ExamTabScreen extends StatefulWidget {
  const ExamTabScreen({super.key});

  @override
  State<ExamTabScreen> createState() => _ExamTabScreenState();
}

class _ExamTabScreenState extends State<ExamTabScreen> {
  int selectedTest = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final authProvider = Provider.of<AuthenticationProvider>(context);

    return Scaffold(
        body: Scaffold(
            body: CustomScrollView(
      slivers: [
        const HeadingAppBar(heading: "Exams", isBackButtomn: false),
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: authProvider.firebaseAuth.currentUser == null
              ? SliverToBoxAdapter(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: const ContinueToLoginCont(
                        content: "Please Login to choose Exams"),
                  ),
                )
              : SliverList.separated(
                  separatorBuilder: (context, index) => const Gap(16),
                  itemCount: 5,
                  itemBuilder: (context, index) => Container(
                    width: screenWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: ConstantColors.black,
                        width: 0.5,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: screenWidth,
                              height: 180,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: SvgPicture.asset(
                                  ConstantImage.examBgImage,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              child: Center(
                                child: Container(
                                  height: 48,
                                  width: 176,
                                  decoration: const BoxDecoration(
                                    color: ConstantColors.syllabusStackOp80,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(9.82),
                                      topLeft: Radius.circular(9.82),
                                    ),
                                  ),
                                  child: const Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(4),
                                      child: Center(
                                        child: Text(
                                          "Biology",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                              color: ConstantColors.headingBlue,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Chapter Name",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: ConstantColors.headingBlue),
                              ),
                              const Gap(8),
                              const Text(
                                "Please add your content here. Keep it short and simple. And smile :)",
                                style: TextStyle(
                                    color: ConstantColors.headingBlue,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                              const Gap(8),
                              const Divider(
                                color: ConstantColors.greyColor,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 80,
                                        decoration: BoxDecoration(
                                            color: ConstantColors.headingBlue,
                                            borderRadius:
                                                BorderRadius.circular(84)),
                                        child: const Center(
                                            child: Text(
                                          "Test 1",
                                          style: TextStyle(
                                              color: ConstantColors.white,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500),
                                        )),
                                      ),
                                      const Gap(7),
                                      Container(
                                        height: 40,
                                        width: 80,
                                        decoration: BoxDecoration(
                                            // color: ConstantColors.headingBlue,
                                            border: Border.all(
                                                color:
                                                    ConstantColors.headingBlue,
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(84)),
                                        child: const Center(
                                            child: Text(
                                          "Test 2",
                                          style: TextStyle(
                                              color: ConstantColors.headingBlue,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500),
                                        )),
                                      ),
                                    ],
                                  ),
                                  ButtonWidget(
                                    buttonHeight: 40,
                                    buttonWidth: 113,
                                    buttonColor: ConstantColors.mainBlueTheme,
                                    buttonText: "Start",
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const ExamTandCScreen(),
                                        ),
                                      );
                                    },
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
        ),
      ],
    )));
  }
}
