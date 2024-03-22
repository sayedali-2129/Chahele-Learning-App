import 'package:chahele_project/controller/authentication_provider.dart';
import 'package:chahele_project/model/user_model.dart';
import 'package:chahele_project/utils/constant_colors/constant_colors.dart';
import 'package:chahele_project/utils/constant_icons/constant_icons.dart';
import 'package:chahele_project/view/authentication_screens/login_screen.dart';
import 'package:chahele_project/view/bottom_navigation_bar/bottom_nav_widget.dart';
import 'package:chahele_project/view/profile_tab/profile_setup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class AnimatedSplashScreen extends StatefulWidget {
  const AnimatedSplashScreen({super.key});

  @override
  State<AnimatedSplashScreen> createState() => _AnimatedSplashScreenState();
}

class _AnimatedSplashScreenState extends State<AnimatedSplashScreen> {
  double _width = 250;
  double _height = 250;

  bool isWaiting = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 4200)).then((value) {
      setState(() {
        isWaiting = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;

    final authProvider = Provider.of<AuthenticationProvider>(context);

    return Scaffold(
      backgroundColor: ConstantColors.white,
      body: isWaiting
          ? Center(
              child: Animate(
                effects: [
                  ScaleEffect(
                    alignment: Alignment.center,
                    curve: Curves.decelerate,
                    duration: const Duration(seconds: 4),
                    delay: const Duration(milliseconds: 4000),
                    // begin: Offset(_height, _width),
                    end: Offset(screenheight, _width),
                  )
                ],
                // ignore: sized_box_for_whitespace
                child: Container(
                  width: _width,
                  height: _width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Animate(
                        effects: [
                          CrossfadeEffect(
                            delay: const Duration(milliseconds: 2500),
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
                      const Gap(30),
                      Animate(
                        effects: const [
                          SlideEffect(
                            curve: Curves.decelerate,
                            begin: Offset(0, 100),
                            end: Offset(0, 0),
                            delay: Duration(seconds: 1),
                            duration: Duration(milliseconds: 1500),
                          ),
                        ],
                        child: SvgPicture.asset(
                          ConstantIcons.chahelAnimatedText,
                          height: 70,
                          width: 240,
                        ).animate().shake(
                            delay: const Duration(milliseconds: 800),
                            duration: const Duration(milliseconds: 4000),
                            curve: Curves.decelerate,
                            offset: const Offset(0, -8),
                            rotation: 0,
                            hz: 1),
                      ),
                    ],
                  ),
                ),
              ),
            )
          //user check
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
                        if (snapshot.hasData && snapshot.data!.exists) {
                          final userData =
                              snapshot.data!.data() as Map<String, dynamic>;
                          final user = UserModel.fromMap(userData);
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
                      },
                    );
                  } else {
                    return const LoginScreen();
                  }
                }
              },
            ),
    );
  }
}
