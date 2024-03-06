// ignore_for_file: use_build_context_synchronously

import 'package:chahele_project/controller/authentication_provider.dart';
import 'package:chahele_project/utils/constant_colors/constant_colors.dart';
import 'package:chahele_project/utils/constant_icons/constant_icons.dart';
import 'package:chahele_project/utils/widgets/button_widget.dart';
import 'package:chahele_project/utils/widgets/custom_loading.dart';
import 'package:chahele_project/utils/widgets/heading_app_bar.dart';
import 'package:chahele_project/view/authentication_screens/login_screen.dart';
import 'package:chahele_project/view/profile_screen/profile_setup.dart';
import 'package:chahele_project/view/profile_screen/widgets/account_logout.dart';
import 'package:chahele_project/view/profile_screen/widgets/more_option_container.dart';
import 'package:chahele_project/view/profile_screen/widgets/profile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthenticationProvider>(context);

    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        slivers: [
          const HeadingAppBar(
            heading: "Profile",
          ),
          SliverFillRemaining(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Profile Card
                    ProfileCard(
                      name: "Student Name",
                      emailID: "sampleemail@gmail.com",
                      onTapEdit: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProfileSetUp(),
                          ),
                        );
                      },
                    ),
                    const Gap(16),
                    //Account & Logout
                    AccountContainer(
                      screenWidth: screenWidth,
                      onMyAccount: () {},
                      onLogout: () {
                        showDialog(
                            context: context,
                            builder: (context) => Material(
                                  type: MaterialType.transparency,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        height: 214,
                                        width: 295,
                                        decoration: BoxDecoration(
                                          color: ConstantColors.white,
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                      ),
                                      Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: 60,
                                              width: 66,
                                              child: SvgPicture.asset(
                                                  ConstantIcons.warningIconSvg),
                                            ),
                                            const Gap(16),
                                            const Text(
                                              "Are You Sure Want To Logout ?",
                                              style: TextStyle(
                                                  color: ConstantColors
                                                      .headingBlue,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            const Gap(32),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                ButtonWidget(
                                                  buttonHeight: 33,
                                                  buttonWidth: 113,
                                                  buttonColor: ConstantColors
                                                      .buttonScndColor,
                                                  buttonText: "No",
                                                  textColor:
                                                      ConstantColors.black,
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                                const Gap(23),
                                                ButtonWidget(
                                                  buttonHeight: 33,
                                                  buttonWidth: 113,
                                                  buttonColor: ConstantColors
                                                      .mainBlueTheme,
                                                  buttonText: "Yes",
                                                  onPressed: () async {
                                                    customLoading(context,
                                                        "Logging Out...");
                                                    // Navigator.pop(context);
                                                    await authProvider
                                                        .logOutUser();
                                                    await Future.delayed(
                                                        const Duration(
                                                            seconds: 2));
                                                    Navigator.pop(context);
                                                    Navigator.pushReplacement(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              const LoginScreen(),
                                                        ));
                                                  },
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ));
                      },
                    ),
                    const Gap(24),
                    const Text(
                      "More",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: ConstantColors.black),
                    ),
                    const Gap(10),
                    //More
                    MoreOptionContainer(
                      screenWidth: screenWidth,
                      onShareApp: () {},
                      onRateUs: () {},
                      onAboutApp: () {},
                      onHelpSupport: () {},
                      onTermsCondit: () {},
                      onDeleteAccount: () {},
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
