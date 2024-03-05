import 'package:chahele_project/utils/constant_colors/constant_colors.dart';
import 'package:chahele_project/utils/widgets/heading_app_bar.dart';
import 'package:chahele_project/view/profile_screen/profile_setup.dart';
import 'package:chahele_project/view/profile_screen/widgets/account_logout.dart';
import 'package:chahele_project/view/profile_screen/widgets/more_option_container.dart';
import 'package:chahele_project/view/profile_screen/widgets/profile_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  // crossAxisAlignment: CrossAxisAlignment.start,
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
                      onLogout: () {},
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
