// ignore_for_file: use_build_context_synchronously

import 'package:chahele_project/controller/authentication_provider.dart';
import 'package:chahele_project/controller/user_provider.dart';
import 'package:chahele_project/model/user_model.dart';
import 'package:chahele_project/utils/constant_colors/constant_colors.dart';
import 'package:chahele_project/view/authentication_screens/login_screen.dart';
import 'package:chahele_project/view/profile_screen/widgets/account_logout.dart';
import 'package:chahele_project/view/profile_screen/widgets/logoutDialogue.dart';
import 'package:chahele_project/view/profile_screen/widgets/more_option_container.dart';
import 'package:chahele_project/view/profile_screen/widgets/profile_card.dart';
import 'package:chahele_project/view/widgets/heading_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthenticationProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);
    final userData = userProvider.getUserDetails();
    // final currentUser = authProvider.currentUser;

    // final user = authProvider.firebaseAuth.currentUser != null
    //     ? userProvider.userList.firstWhere(
    //         (user) => user.id == authProvider.firebaseAuth.currentUser!.uid,
    //       )
    //     : null;

    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: CustomScrollView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      slivers: [
        const HeadingAppBar(
          isBackButtomn: false,
          heading: "Profile",
        ),
        SliverFillRemaining(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  authProvider.firebaseAuth.currentUser != null
                      ? FutureBuilder<UserModel?>(
                          future: userData,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return const Text("Error");
                            }
                            final UserModel userDatas =
                                snapshot.data as UserModel;

                            return ProfileCard(
                                name: userDatas.name,
                                emailID: userDatas.email,
                                imageUrl: userDatas.image,
                                onTapEdit: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => const ProfileSetUp(),
                                  //   ),
                                  // );
                                });
                          },
                        )
                      : GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
                          child: const ContinueToLoginCont(),
                        ),

                  const Gap(16),
                  //Account & Logout
                  authProvider.firebaseAuth.currentUser != null
                      //If logged in
                      ? AccountContainer(
                          screenWidth: screenWidth,
                          onMyAccount: () {},
                          onLogout: () {
                            logOutDailogue(
                                context: context,
                                provider: authProvider,
                                message: "Are You Sure Want To Logout ?",
                                onYes: () async {
                                  // if (authProvider.firebaseAuth.currentUser != null) {
                                  //   customLoading(context, "Logging Out...");
                                  // Navigator.pop(context);
                                  await authProvider.logOutUser();
                                  // await Future.delayed(const Duration(seconds: 2));
                                  // Navigator.pop(context);
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen(),
                                      ));
                                  // } else {
                                  //   Navigator.pop(context);
                                  //   // failedToast(context, "No User Signed");
                                  //   logOutDailogue(
                                  //     context: context,
                                  //     provider: authProvider,
                                  //     message:
                                  //         "No User Signed\nAre You Want To Log In ?",
                                  //     onYes: () {
                                  //       Navigator.pushReplacement(
                                  //           context,
                                  //           MaterialPageRoute(
                                  //             builder: (context) =>
                                  //                 const LoginScreen(),
                                  //           ));
                                  //     },
                                  //   );
                                });
                          },
                        )
                      //If Skip Login

                      : const Gap(0),
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
                    onDeleteAccount: () {
                      // logOutDailogue(
                      //     context: context,
                      //     provider: authProvider,
                      //     message:
                      //         "Are You Sure Want To Delete This Account?",
                      //     onYes: () async {
                      //       if (authProvider.currentUser == null) {
                      //         log("null");
                      //       }
                      //       //When Skip Login
                      //       if (authProvider.currentUser != null) {
                      //         //When user login
                      //         customLoading(context, "Deleting Account...");
                      //         // Navigator.pop(context);
                      //         await authProvider.deleteUser();
                      //         await Future.delayed(
                      //             const Duration(seconds: 2));
                      //         Navigator.pop(context);
                      //         Navigator.pushReplacement(
                      //             context,
                      //             MaterialPageRoute(
                      //               builder: (context) => const LoginScreen(),
                      //             ));
                      //       } else {
                      //         Navigator.pop(context);
                      //         // failedToast(context, "No User Signed");
                      //         logOutDailogue(
                      //           context: context,
                      //           provider: authProvider,
                      //           message:
                      //               "No User Signed\nAre You Want To Log In ?",
                      //           onYes: () {
                      //             Navigator.pushReplacement(
                      //                 context,
                      //                 MaterialPageRoute(
                      //                   builder: (context) =>
                      //                       const LoginScreen(),
                      //                 ));
                      //           },
                      //         );
                      //       }
                      //     });
                    },
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}
