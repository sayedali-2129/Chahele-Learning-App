import 'package:chahele_project/controller/authentication_provider.dart';
import 'package:chahele_project/utils/constant_colors/constant_colors.dart';
import 'package:chahele_project/view/authentication_screens/login_screen.dart';
import 'package:chahele_project/view/choose_tab/widgets/plan_dialogue_fields.dart';
import 'package:chahele_project/view/choose_tab/widgets/selected_plan.dart';
import 'package:chahele_project/view/home_tab/screens/subjects_screen.dart';
import 'package:chahele_project/view/profile_tab/widgets/profile_card.dart';
import 'package:chahele_project/view/widgets/button_widget.dart';
import 'package:chahele_project/view/widgets/heading_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

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
    final authProvider = Provider.of<AuthenticationProvider>(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const HeadingAppBar(heading: "Choose Plan", isBackButtomn: false),
          SliverPadding(
            padding: const EdgeInsets.only(top: 24, bottom: 8),
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
                            planFields(
                              screenWidth: screenWidth,
                              context: context,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SubjectScreen(),
                                  ),
                                );
                              },
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
