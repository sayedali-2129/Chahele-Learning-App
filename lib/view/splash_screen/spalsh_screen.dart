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
import 'package:flutter_svg/svg.dart';
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
    Future.delayed(const Duration(seconds: 2)).then((value) {
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
                child: SvgPicture.asset(
                  ConstantIcons.chahelLogoSmallSvg,
                  height: 200,
                  width: 150,
                ),
              )
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
                          } else if (snapshot.hasError) {
                            return Text("Error: ${snapshot.error}");
                          } else if (snapshot.hasData &&
                              snapshot.data!.exists) {
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
                            return LoginScreen();
                          }
                        },
                      );
                    } else {
                      return LoginScreen();
                    }
                  }
                },
              ),
      ),
    );
  }
}
