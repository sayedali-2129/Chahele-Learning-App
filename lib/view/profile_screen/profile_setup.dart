import 'package:chahele_project/utils/constant_colors/constant_colors.dart';
import 'package:chahele_project/utils/constant_images/constant_images.dart';
import 'package:chahele_project/utils/widgets/button_widget.dart';
import 'package:chahele_project/utils/widgets/heading_app_bar.dart';
import 'package:chahele_project/view/profile_screen/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class ProfileSetUp extends StatelessWidget {
  const ProfileSetUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      slivers: [
        const HeadingAppBar(heading: "Set Up Profile"),
        SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Profile Image
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => Material(
                                  type: MaterialType.transparency,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    children: [
                                      Container(
                                        height: 300,
                                        width: 300,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                      ),
                                      Center(
                                          child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 180,
                                            height: 180,
                                            decoration: const BoxDecoration(
                                                color: ConstantColors
                                                    .syllabusStackColor,
                                                shape: BoxShape.circle),
                                            child: const Center(
                                              child: Icon(Icons.add_rounded,
                                                  size: 50),
                                            ),
                                          ),
                                          const Gap(16),
                                          const ButtonWidget(
                                              buttonHeight: 42,
                                              buttonWidth: 170,
                                              buttonColor:
                                                  ConstantColors.mainBlueTheme,
                                              buttonText: "Save")
                                        ],
                                      )),
                                    ],
                                  ),
                                ));
                      },
                      child: CircleAvatar(
                        radius: 60,
                        child: SvgPicture.asset(
                          ConstantImage.imageAvathar,
                          height: 120,
                          width: 120,
                        ),
                      ),
                    )
                  ],
                ),
                const Gap(16),

                //Name
                const Text(
                  "Name",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: ConstantColors.headingBlue),
                ),
                const Gap(16),
                TextfieldWidget(),
                const Gap(16),

                //DOB
                const Text(
                  "DOB",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: ConstantColors.headingBlue),
                ),
                const Gap(16),
                SizedBox(
                  height: 50,
                  child: PhysicalModel(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    shadowColor: Colors.black45,
                    elevation: 10,
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 24),
                        filled: true,
                        fillColor: ConstantColors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ),
                ),
                const Gap(16),
                //Phone number
                const Text(
                  "Phone Number",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: ConstantColors.headingBlue),
                ),
                const Gap(16),

                TextfieldWidget(),
                const Gap(16),
                //Email

                const Text(
                  "Email",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: ConstantColors.headingBlue),
                ),
                const Gap(16),

                TextfieldWidget(),
                const Gap(16),
                //Age

                const Text(
                  "Age",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: ConstantColors.headingBlue),
                ),
                const Gap(16),

                TextfieldWidget(),
                const Gap(16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ButtonWidget(
                      buttonColor: ConstantColors.mainBlueTheme,
                      buttonHeight: 42,
                      buttonWidth: 163,
                      buttonText: "Save",
                      onPressed: () {},
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
