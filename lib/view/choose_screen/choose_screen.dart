import 'package:chahele_project/utils/constant_colors/constant_colors.dart';
import 'package:chahele_project/view/choose_screen/widgets/selected_plan.dart';
import 'package:chahele_project/view/widgets/button_widget.dart';
import 'package:chahele_project/view/widgets/heading_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ChooseScreen extends StatefulWidget {
  const ChooseScreen({super.key});

  @override
  State<ChooseScreen> createState() => _ChooseScreenState();
}

class _ChooseScreenState extends State<ChooseScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const HeadingAppBar(heading: "Choose Plan", isBackButtomn: false),
          SliverPadding(
            padding: const EdgeInsets.only(top: 24, bottom: 8),
            sliver: SliverList.separated(
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
                  ButtonWidget(
                    buttonHeight: 42,
                    buttonWidth: 155,
                    buttonColor: ConstantColors.mainBlueTheme,
                    buttonText: "Confirm",
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const SubjectScreen(),
                      //   ),
                      // );
                      showDialog(
                        context: context,
                        builder: (context) => Padding(
                          padding: const EdgeInsets.all(16),
                          child: Center(
                            child: Container(
                              width: screenWidth,
                              height: 460,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: ConstantColors.white,
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
