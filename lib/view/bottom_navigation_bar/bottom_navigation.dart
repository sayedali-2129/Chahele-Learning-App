// ignore_for_file: deprecated_member_use

import 'package:chahele_project/utils/constant_colors/constant_colors.dart';
import 'package:chahele_project/utils/constant_icons/constant_icons.dart';
import 'package:chahele_project/view/choose_screen/choose_screen.dart';
import 'package:chahele_project/view/exam_screen/exam_screen.dart';
import 'package:chahele_project/view/home_screen/home_screen.dart';
import 'package:chahele_project/view/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({super.key});

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int currentPageIndex = 0;

  final List pages = [
    const HomeScreen(),
    const ChooseScreen(),
    const ExamScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPageIndex],
      bottomNavigationBar: SizedBox(
        height: 70,
        child: BottomNavigationBar(
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 11,
            unselectedFontSize: 11,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
            selectedItemColor: ConstantColors.mainBlueTheme,
            unselectedItemColor: ConstantColors.headingBlue,
            currentIndex: currentPageIndex,
            onTap: (value) {
              setState(() {
                currentPageIndex = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: currentPageIndex == 0
                    ? Padding(
                        padding: const EdgeInsets.all(8),
                        child: SvgPicture.asset(
                          ConstantIcons.homeSelectedSvg,
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          ConstantIcons.homeUnselectedSvg,
                        ),
                      ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                  icon: currentPageIndex == 1
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              SvgPicture.asset(ConstantIcons.chooseSelectedSvg),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            ConstantIcons.chooseUnselectedSvg,
                          ),
                        ),
                  label: "Choose"),
              BottomNavigationBarItem(
                  icon: currentPageIndex == 2
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              SvgPicture.asset(ConstantIcons.examsSelectedSvg),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            ConstantIcons.examUnselectedSvg,
                          ),
                        ),
                  label: "Exams"),
              BottomNavigationBarItem(
                  icon: currentPageIndex == 3
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                              ConstantIcons.profileSelectedSvg),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            ConstantIcons.profileUnselectedSvg,
                          ),
                        ),
                  label: "Profile"),
            ]),
      ),
    );
  }
}
