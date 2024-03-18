import 'package:chahele_project/controller/course_provider.dart';
import 'package:chahele_project/utils/constant_colors/constant_colors.dart';
import 'package:chahele_project/utils/constant_images/constant_images.dart';
import 'package:chahele_project/view/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key, required this.index});
  final int index;

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final courseProvider = Provider.of<CourseProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomCenter,
              colors: [
                ConstantColors.mainBlueTheme,
                ConstantColors.headingBlue
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: ConstantColors.white,
                        size: 25,
                      ),
                    ),
                  ],
                ),
                const Text(
                  "Get Your Plan",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: ConstantColors.white),
                ),
                const Gap(24),
                const Text(
                  textAlign: TextAlign.center,
                  "Select your 1st standers CBSE Syllabus plan\nchoose your prefers plan ",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: ConstantColors.white),
                ),
                const Gap(8),
                Container(
                  height: 155,
                  width: screenWidth,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(ConstantImage.getPLanPng),
                    ),
                  ),
                ),
                const Gap(24),
                Container(
                  height: 100,
                  width: screenWidth,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: ConstantColors.headingBlue,
                      border: Border.all(
                          color: ConstantColors.lightBlueTheme, width: 4),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 40,
                            offset: const Offset(-1, 1),
                            color: ConstantColors.white.withOpacity(0.25))
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Annually",
                              style: TextStyle(
                                  color: ConstantColors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                            ),
                            Text(
                              "First 30 days free - Then   9519/Year",
                              style: TextStyle(
                                  color: ConstantColors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                        Container(
                          height: 35,
                          width: 75,
                          decoration: BoxDecoration(
                            color: ConstantColors.onlineDotGreen,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: const Center(
                            child: Text(
                              "Best Value",
                              style: TextStyle(
                                  color: ConstantColors.white, fontSize: 10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Gap(16),
                Container(
                  height: 100,
                  width: screenWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: ConstantColors.white,
                    border: Border.all(
                        color: ConstantColors.lightBlueTheme, width: 4),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Monthly",
                              style: TextStyle(
                                  color: ConstantColors.headingBlue,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                            ),
                            Text(
                              "First 7 days free - Then   99/month",
                              style: TextStyle(
                                  color: ConstantColors.headingBlue,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const Gap(32),
                ButtonWidget(
                  buttonHeight: 50,
                  buttonWidth: 240,
                  buttonColor: ConstantColors.lightBlueTheme,
                  buttonText: "Purchase",
                  textColor: ConstantColors.headingBlue,
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => SubjectScreen(
                    //         id: courseProvider.),
                    //   ),
                    // );
                  },
                ),
                const Gap(24),
                RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(children: [
                      TextSpan(
                        text: "By placing this order, you agree to the ",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins'),
                      ),
                      TextSpan(
                        text: "Terms of Service",
                        style: TextStyle(
                            color: Colors.amber,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Poppins'),
                      ),
                      TextSpan(
                        text: " and ",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins'),
                      ),
                      TextSpan(
                        text: "Privacy Policy",
                        style: TextStyle(
                            color: Colors.amber,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Poppins'),
                      ),
                      TextSpan(
                        text:
                            ". Subscription automatically renews unless auto-renew is turned off at least 24-hours before the end of the current period.",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins'),
                      ),
                    ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
