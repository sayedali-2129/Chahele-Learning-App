import 'package:chahele_project/controller/course_provider.dart';
import 'package:chahele_project/utils/constant_colors/constant_colors.dart';
import 'package:chahele_project/utils/constant_images/constant_images.dart';
import 'package:chahele_project/widgets/button_widget.dart';
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
  List planDuration = ["Annually", "Monthly"];
  List planPrizing = [
    "First 30 days free - Then   999/Year",
    "First 7 days free - Then   99/Month"
  ];

  int selectedPlan = 0;

  // bool isSelected = false;
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

                //plan container
                ListView.separated(
                  separatorBuilder: (context, index) => const Gap(16),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedPlan = index;
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: selectedPlan == index ? 0 : 5),
                      child: Container(
                        height: 90,
                        width: screenWidth,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: selectedPlan == index
                                ? ConstantColors.headingBlue
                                : ConstantColors.white,
                            border: selectedPlan == index
                                ? Border.all(
                                    color: ConstantColors.lightBlueTheme,
                                    width: 4)
                                : null,
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
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    planDuration[index],
                                    style: TextStyle(
                                        color: selectedPlan == index
                                            ? ConstantColors.white
                                            : ConstantColors.headingBlue,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14),
                                  ),
                                  Text(
                                    planPrizing[index],
                                    style: TextStyle(
                                        color: selectedPlan == index
                                            ? ConstantColors.white
                                            : ConstantColors.headingBlue,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                              // Container(
                              //   height: 35,
                              //   width: 75,
                              //   decoration: BoxDecoration(
                              //     color: ConstantColors.onlineDotGreen,
                              //     borderRadius: BorderRadius.circular(18),
                              //   ),
                              //   child: const Center(
                              //     child: Text(
                              //       "Best Value",
                              //       style: TextStyle(
                              //           color: ConstantColors.white,
                              //           fontSize: 10),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const Gap(16),
                const Gap(32),

                //purchase button
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

                //terms and conditions
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
