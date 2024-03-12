import 'package:chahele_project/utils/constant_colors/constant_colors.dart';
import 'package:chahele_project/view/bottom_navigation_bar/bottom_nav_widget.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.totalScore, required this.totalQuestion});
  final int totalScore;
  final int totalQuestion;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DelayedDisplay(
              delay: Duration(seconds: 1),
              fadeIn: true,
              slidingBeginOffset: Offset(0, -0.1),
              child: Text(
                (totalScore == totalQuestion)
                    ? "Excellent "
                    : (totalScore < totalQuestion && totalScore >= 7)
                        ? "Very Good!"
                        : (totalScore < 7 && totalScore >= 4)
                            ? "Good!"
                            : "Need Improvement!",
                style:
                    TextStyle(color: ConstantColors.headingBlue, fontSize: 25),
              ),
            ),
            const Gap(30),
            TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: 200),
                duration: const Duration(milliseconds: 500),
                builder: (context, size, _) {
                  return Container(
                    width: size,
                    height: size,
                    child: CircleAvatar(
                      radius: 100,
                      backgroundColor: ConstantColors.mainBlueTheme,
                      child: CircleAvatar(
                        radius: 90,
                        backgroundColor: ConstantColors.white.withOpacity(0.6),
                        child: CircleAvatar(
                          radius: 80,
                          backgroundColor: ConstantColors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "You Scored",
                                style: TextStyle(
                                    color: ConstantColors.headingBlue,
                                    fontSize: size - 182 >= 0 ? size - 182 : 0),
                              ),
                              const Gap(5),
                              Text(
                                "$totalScore/$totalQuestion",
                                style: TextStyle(
                                    color: ConstantColors.headingBlue,
                                    fontSize: size - 170 >= 0 ? size - 170 : 0,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
            const Gap(60),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BottomNavigationWidget(),
                  ),
                );
              },
              child: Container(
                height: 42,
                width: 250,
                decoration: BoxDecoration(
                  color: ConstantColors.mainBlueTheme,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Go to Home Page",
                        style: TextStyle(
                            color: ConstantColors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      Gap(5),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 15,
                        color: ConstantColors.white,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
