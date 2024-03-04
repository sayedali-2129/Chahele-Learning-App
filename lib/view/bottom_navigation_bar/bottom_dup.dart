import 'package:chahele_project/utils/constant_colors/constant_colors.dart';
import 'package:chahele_project/utils/constant_icons/constant_icons.dart';
import 'package:chahele_project/view/choose_screen/choose_screen.dart';
import 'package:chahele_project/view/exam_screen/exam_screen.dart';
import 'package:chahele_project/view/home_screen/home_screen.dart';
import 'package:chahele_project/view/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottonNavTab extends StatelessWidget {
  const BottonNavTab({super.key});

  @override
  Widget build(BuildContext context) {
    //   final List pages = [
    //   const HomeScreen(),
    //   const ChooseScreen(),
    //   const ExamScreen(),
    //   const ProfileScreen()
    // ];

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: const TabBarView(children: [
          HomeScreen(),
          ChooseScreen(),
          ExamScreen(),
          ProfileScreen()
        ]),
        bottomNavigationBar: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: EdgeInsets.all(8),
            indicator: const UnderlineTabIndicator(
                borderSide:
                    BorderSide(color: ConstantColors.mainBlueTheme, width: 8.0),
                insets: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 66.0),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(4),
                    bottomLeft: Radius.circular(4))),
            labelStyle: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins'),
            tabs: [
              Tab(
                icon: SvgPicture.asset(ConstantIcons.homeUnselectedSvg),
                text: "Home",
              ),
              Tab(
                text: "Choose",
                icon: SvgPicture.asset(ConstantIcons.chooseUnselectedSvg),
              ),
              Tab(
                text: "Exams",
                icon: SvgPicture.asset(ConstantIcons.examUnselectedSvg),
              ),
              Tab(
                text: "Profile",
                icon: SvgPicture.asset(ConstantIcons.profileUnselectedSvg),
              ),
            ]),
      ),
    );
  }
}
