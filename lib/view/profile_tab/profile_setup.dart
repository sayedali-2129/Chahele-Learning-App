import 'package:chahele_project/controller/authentication_provider.dart';
import 'package:chahele_project/controller/image_provider.dart';
import 'package:chahele_project/controller/user_provider.dart';
import 'package:chahele_project/model/user_model.dart';
import 'package:chahele_project/utils/constant_colors/constant_colors.dart';
import 'package:chahele_project/utils/constant_images/constant_images.dart';
import 'package:chahele_project/view/bottom_navigation_bar/bottom_nav_widget.dart';
import 'package:chahele_project/view/profile_tab/widgets/textfield_widget.dart';
import 'package:chahele_project/view/widgets/button_widget.dart';
import 'package:chahele_project/view/widgets/custom_loading.dart';
import 'package:chahele_project/view/widgets/custom_toast.dart';
import 'package:chahele_project/view/widgets/heading_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ProfileSetUp extends StatefulWidget {
  const ProfileSetUp({super.key, required this.phoneNumber});
  final String phoneNumber;

  @override
  State<ProfileSetUp> createState() => _ProfileSetUpState();
}

class _ProfileSetUpState extends State<ProfileSetUp> {
  @override
  Widget build(BuildContext context) {
    final imageProvider = Provider.of<ImagePickProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);
    final authProvider = Provider.of<AuthenticationProvider>(context);
    userProvider.phoneNumberController.text = widget.phoneNumber;
    return Scaffold(
        body: CustomScrollView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      slivers: [
        const HeadingAppBar(heading: "Set Up Profile", isBackButtomn: false),
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
                TextfieldWidget(controller: userProvider.nameController),
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
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: ConstantColors.black.withOpacity(0.7)),
                      onTap: () async {
                        final DateTime? date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            lastDate: DateTime.now(),
                            firstDate: DateTime(1950));

                        final formattedDate =
                            DateFormat("dd-MM-yyyy").format(date!);
                        setState(() {});
                        userProvider.dobController.text =
                            formattedDate.toString();
                      },
                      readOnly: true,
                      controller: userProvider.dobController,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(15),
                          filled: true,
                          fillColor: ConstantColors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          suffixIcon:
                              const Icon(Icons.calendar_month_outlined)),
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

                TextfieldWidget(
                    controller: userProvider.phoneNumberController,
                    readOnly: true),
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

                TextfieldWidget(
                    controller: userProvider.emailController,
                    keyboardType: TextInputType.emailAddress),
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

                TextfieldWidget(
                    controller: userProvider.ageController,
                    keyboardType: TextInputType.number),
                const Gap(16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ButtonWidget(
                      buttonColor: ConstantColors.mainBlueTheme,
                      buttonHeight: 42,
                      buttonWidth: 163,
                      buttonText: "Save",
                      onPressed: () async {
                        userProvider.addUserDetails(
                            onSuccess: () {},
                            onFailure: () {},
                            userModel: UserModel(
                                id: authProvider.firebaseAuth.currentUser!.uid,
                                name: userProvider.nameController.text,
                                phoneNumber:
                                    userProvider.phoneNumberController.text,
                                dob: userProvider.dobController.text,
                                email: userProvider.emailController.text,
                                age: userProvider.ageController.text,
                                image: imageProvider.imageUrl!));

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const BottomNavigationWidget(),
                          ),
                        );
                        userProvider.clearFields();
                        imageProvider.clearImage();
                      },
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
