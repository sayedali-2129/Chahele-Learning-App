import 'dart:developer';

import 'package:chahele_project/controller/authentication_provider.dart';
import 'package:chahele_project/controller/course_provider.dart';
import 'package:chahele_project/controller/plan_controller.dart';
import 'package:chahele_project/model/medium_model.dart';
import 'package:chahele_project/model/standard_model.dart';
import 'package:chahele_project/utils/constant_colors/constant_colors.dart';
import 'package:chahele_project/view/authentication_screens/login_screen.dart';
import 'package:chahele_project/view/choose_tab/subscription_screen.dart';
import 'package:chahele_project/view/choose_tab/widgets/selected_plan.dart';
import 'package:chahele_project/view/profile_tab/widgets/profile_card.dart';
import 'package:chahele_project/widgets/button_widget.dart';
import 'package:chahele_project/widgets/heading_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class ChooseAlternate extends StatefulWidget {
  const ChooseAlternate({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<ChooseAlternate> createState() => _ChooseAlternateState();
}

class _ChooseAlternateState extends State<ChooseAlternate> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final authProvider = Provider.of<AuthenticationProvider>(context);
    final planController = Provider.of<PlanController>(context, listen: false);
    final courseProvider = Provider.of<CourseProvider>(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const HeadingAppBar(heading: "Choose Plan", isBackButtomn: false),
          SliverPadding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            sliver: authProvider.firebaseAuth.currentUser == null
                ? SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
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
                            content: "Please Login to choose your plan"),
                      ),
                    ),
                  )
                : SliverList.separated(
                    separatorBuilder: (context, index) => const Gap(8),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: SelectedPlanContainer(
                          screenWidth: screenWidth,
                          isSelected: selectedIndex == index,
                        ),
                      );
                    },
                  ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  authProvider.firebaseAuth.currentUser == null
                      ? const Gap(0)
                      : ButtonWidget(
                          buttonHeight: 42,
                          buttonWidth: 155,
                          buttonColor: ConstantColors.mainBlueTheme,
                          buttonText: "Confirm",
                          onPressed: () {
                            //Class Dialogue

                            showDialog(
                              context: context,
                              builder: (context) => Material(
                                type: MaterialType.transparency,
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Center(
                                    child: StatefulBuilder(
                                      builder: (context, classState) {
                                        return Container(
                                          width: screenWidth,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            color: ConstantColors.white,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(16),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  "Standard",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: ConstantColors
                                                          .headingBlue),
                                                ),
                                                const Gap(8),
                                                DropdownButton(
                                                  isExpanded: true,
                                                  hint: Text("Select STD"),
                                                  value: planController
                                                      .dropClassValue,
                                                  items: courseProvider
                                                      .planStandardList
                                                      .map<
                                                          DropdownMenuItem<
                                                              String>>(
                                                    (StandardModel classItem) {
                                                      return DropdownMenuItem(
                                                        value: classItem.id ??
                                                            "dfdfd",
                                                        child: Text(classItem
                                                            .standard
                                                            .toString()),
                                                      );
                                                    },
                                                  ).toList(),
                                                  onChanged: (String?
                                                      classValue) async {
                                                    log("STD ID:${classValue}");
                                                    classState(() {
                                                      planController
                                                              .dropClassValue =
                                                          classValue!;
                                                    });
                                                    if (classValue != null) {
                                                      await planController
                                                          .fetchPlanMediumData(
                                                              classValue);
                                                    }
                                                  },
                                                ),
                                                const Gap(8),
                                                const Gap(16),
                                                ButtonWidget(
                                                  buttonHeight: 42,
                                                  buttonWidth: screenWidth,
                                                  buttonColor: ConstantColors
                                                      .headingBlue,
                                                  buttonText: "Choose Medium",
                                                  onPressed: () {
                                                    Navigator.pop(context);

                                                    //Medium Dialogue

                                                    showDialog(
                                                      context: context,
                                                      builder: (context) =>
                                                          Material(
                                                        type: MaterialType
                                                            .transparency,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(16),
                                                          child: Center(
                                                            child: Container(
                                                              width:
                                                                  screenWidth,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16),
                                                                color:
                                                                    ConstantColors
                                                                        .white,
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        16),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    const Text(
                                                                      "Medium",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight: FontWeight
                                                                              .w600,
                                                                          color:
                                                                              ConstantColors.headingBlue),
                                                                    ),
                                                                    const Gap(
                                                                        8),
                                                                    StatefulBuilder(builder:
                                                                        (context,
                                                                            setState) {
                                                                      return DropdownButton<
                                                                          String>(
                                                                        hint: Text(
                                                                            "Select Medium"),
                                                                        value: planController
                                                                            .dropMediumValue,
                                                                        items: planController.planMediumList.isNotEmpty
                                                                            ? planController.planMediumList.map<DropdownMenuItem<String>>(
                                                                                (MediumModel mediumItem) {
                                                                                  return DropdownMenuItem(
                                                                                    value: mediumItem.id,
                                                                                    child: Text(mediumItem.medium.toString()),
                                                                                  );
                                                                                },
                                                                              ).toList()
                                                                            : [],
                                                                        onChanged:
                                                                            (String?
                                                                                mediumValue) {
                                                                          setState(
                                                                              () {
                                                                            planController.dropMediumValue =
                                                                                mediumValue!;
                                                                          });
                                                                          log("med id : $mediumValue");
                                                                        },
                                                                      );
                                                                    }),
                                                                    const Gap(
                                                                        8),
                                                                    const Gap(
                                                                        16),
                                                                    ButtonWidget(
                                                                      buttonHeight:
                                                                          42,
                                                                      buttonWidth:
                                                                          screenWidth,
                                                                      buttonColor:
                                                                          ConstantColors
                                                                              .headingBlue,
                                                                      buttonText:
                                                                          "Choose My Plan",
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.pop(
                                                                            context);
                                                                        Navigator.push(
                                                                            context,
                                                                            MaterialPageRoute(
                                                                              builder: (context) => SubscriptionScreen(index: widget.index, stdId: planController.dropClassValue!, medId: planController.dropMediumValue!),
                                                                            ));
                                                                      },
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
