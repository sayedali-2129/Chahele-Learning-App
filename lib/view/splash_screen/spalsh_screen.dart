import 'package:chahele_project/controller/authentication_provider.dart';
import 'package:chahele_project/model/user_model.dart';
import 'package:chahele_project/utils/constant_colors/constant_colors.dart';
import 'package:chahele_project/utils/constant_icons/constant_icons.dart';
import 'package:chahele_project/view/authentication_screens/login_screen.dart';
import 'package:chahele_project/view/bottom_navigation_bar/bottom_nav_widget.dart';
import 'package:chahele_project/view/profile_tab/screens/profile_setup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isWaiting = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4)).then((value) {
      setState(() {
        isWaiting = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthenticationProvider>(context);

    return Scaffold(
      backgroundColor: ConstantColors.white,
      body: Center(
        child: isWaiting
            ? Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Animate(
                    effects: [
                      CrossfadeEffect(
                        curve: Curves.decelerate,
                        alignment: Alignment.center,
                        delay: const Duration(milliseconds: 2200),
                        duration: const Duration(milliseconds: 1500),
                        builder: (context) {
                          return SvgPicture.asset(
                            ConstantIcons.chahelAnimatedIcon,
                            width: 130,
                            height: 127,
                          );
                        },
                      ),
                    ],
                  ),
                  Gap(33),
                  Animate(
                    child: SvgPicture.asset(
                      ConstantIcons.chahelAnimatedText,
                      height: 70,
                      width: 240,
                    )
                        .animate()
                        .slide(
                            curve: Curves.decelerate,
                            begin: const Offset(0, 100),
                            end: const Offset(0, 0),
                            delay: const Duration(seconds: 0),
                            duration: const Duration(milliseconds: 2000))
                        .moveY(
                            begin: -50,
                            delay: const Duration(milliseconds: 800),
                            duration: const Duration(milliseconds: 3500),
                            curve: Curves.decelerate),
                  ),
                ],
              ))
            : FutureBuilder<User?>(
                future: authProvider.getCurrentUser(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: SvgPicture.asset(
                        ConstantIcons.chahelLogoSmallSvg,
                        height: 200,
                        width: 150,
                      ),
                    );
                  } else {
                    if (snapshot.hasData && snapshot.data != null) {
                      return StreamBuilder<DocumentSnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('users')
                            .doc(snapshot.data!.uid)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: SvgPicture.asset(
                                ConstantIcons.chahelLogoSmallSvg,
                                height: 200,
                                width: 150,
                              ),
                            );
                          } else {
                            if (snapshot.hasData && snapshot.data!.exists) {
                              final userData =
                                  snapshot.data!.data() as Map<String, dynamic>;
                              final user = UserModel.fromMap(
                                  userData); // This line might cause the error
                              if (user.age.isNotEmpty &&
                                  user.dob.isNotEmpty &&
                                  user.email.isNotEmpty &&
                                  user.image.isNotEmpty &&
                                  user.name.isNotEmpty) {
                                return const BottomNavigationWidget();
                              } else {
                                return ProfileSetUp(
                                  phoneNumber: user.phoneNumber,
                                );
                              }
                            } else {
                              return const BottomNavigationWidget();
                            }
                          }
                        },
                      );
                    } else {
                      return const LoginScreen();
                    }
                  }
                },
              ),
      ),
    );
  }
}
