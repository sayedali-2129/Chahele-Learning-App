import 'package:chahele_project/controller/image_provider.dart';
import 'package:chahele_project/utils/constant_colors/constant_colors.dart';
import 'package:chahele_project/utils/constant_images/constant_images.dart';
import 'package:chahele_project/utils/widgets/button_widget.dart';
import 'package:chahele_project/utils/widgets/custom_loading.dart';
import 'package:chahele_project/utils/widgets/custom_toast.dart';
import 'package:chahele_project/utils/widgets/heading_app_bar.dart';
import 'package:chahele_project/view/profile_screen/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class ProfileSetUp extends StatelessWidget {
  const ProfileSetUp({super.key});

  @override
  Widget build(BuildContext context) {
    final imageProvider = Provider.of<ImagePickProvider>(context);
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
                      onTap: () async {
                        customLoading(context, "Saving Image");

                        await imageProvider.pickImage(onFailure: () {
                          Navigator.pop(context);
                        });

                        await imageProvider.saveImage(
                          imageProvider.imageFile!,
                          () {
                            successToast(context, "Image added successfully");
                          },
                        );
                        // ignore: use_build_context_synchronously
                        Navigator.pop(context);
                        // if (imageProvider.imageUrl ==
                        //     null) {
                        //   log("null");
                        // } else {
                        //   log(imageProvider.imageUrl!);
                        // }
                      },
                      child: imageProvider.imageUrl == null
                          ? const CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 70,
                              backgroundImage:
                                  AssetImage(ConstantImage.addUSerImage),
                            )
                          : CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 70,
                              backgroundImage:
                                  NetworkImage(imageProvider.imageUrl!)),
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
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: Container(
                    height: 50,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 1,
                              spreadRadius: 0,
                              color: Colors.black26,
                              blurStyle: BlurStyle.outer)
                        ]),
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
