import 'package:chahele_project/controller/authentication_provider.dart';
import 'package:chahele_project/utils/constant_colors/constant_colors.dart';
import 'package:chahele_project/utils/constant_images/constant_images.dart';
import 'package:chahele_project/view/authentication_screens/widgets/login_buttons.dart';
import 'package:chahele_project/view/authentication_screens/widgets/pinput.dart';
import 'package:chahele_project/view/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.verificationId});

  final String verificationId;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: ConstantColors.white,
            ),
          ),
          backgroundColor: ConstantColors.mainBlueTheme,
        ),
        backgroundColor: ConstantColors.mainBlueTheme,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 194.12,
                    width: 200,
                    child: SvgPicture.asset(ConstantImage.otpSvg),
                  ),
                  const Gap(24),
                  const Text(
                    "Login",
                    style: TextStyle(
                        // fontFamily: 'Poppins Semibold',
                        color: ConstantColors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w600),
                  ),
                  const Gap(24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "OTP Verification",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: ConstantColors.white),
                            ),
                            const Gap(8),
                            Text(
                              "Enter the verification code we just sent to your number +91********81",
                              style: TextStyle(
                                color: ConstantColors.white.withOpacity(0.7),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Gap(8),
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            PinputWidget(
                              controller: pinController,
                              onSubmitted: (value) {
                                value = pinController.text;
                              },
                            ),
                            const Gap(24),
                            LoginButtons(
                              screenWidth: screenWidth,
                              text: "Verify",
                              onPressed: () {
                                verifyOtp();
                              },
                            ),
                            const Gap(16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Didn't Get OTP?",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: ConstantColors.white),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Resend",
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: ConstantColors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Gap(50)
                ],
              ),
            ),
          ),
        ));
  }

  void verifyOtp() {
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);

    String otp = pinController.text;
    authProvider.verifyOtp(
        onSuccess: (verificationId) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
              (route) => false);
        },
        onFailure: () {},
        verificationId: widget.verificationId,
        otpCode: otp);
  }
}