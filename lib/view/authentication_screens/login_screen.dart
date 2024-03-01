import 'package:chahele_project/controller/authentication_provider.dart';
import 'package:chahele_project/utils/constant_colors/constant_colors.dart';
import 'package:chahele_project/utils/constant_images/constant_images.dart';
import 'package:chahele_project/view/authentication_screens/otp_screen.dart';
import 'package:chahele_project/view/authentication_screens/widgets/login_buttons.dart';
import 'package:chahele_project/view/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final validator = GlobalKey<FormState>();
  final phoneNumberController = TextEditingController();
  String selectedCode = "";
  FToast? fToast;
  String? phoneText;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast!.init(context);
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthenticationProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: ConstantColors.mainBlueTheme,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 194.12,
                width: 200,
                child: SvgPicture.asset(ConstantImage.logInSvg),
              ),
              const Gap(24),
              const Text(
                "Login",
                style: TextStyle(
                    color: ConstantColors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w600),
              ),
              const Gap(20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(6),
                    child: Text(
                      "Mobile Number",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: ConstantColors.white),
                    ),
                  ),
                  const Gap(8),
                  Form(
                    key: validator,
                    child: IntlPhoneField(
                      // validator: (value) {
                      //   print(value ?? 'null');
                      //   if (value == null && value!.number.isEmpty) {
                      //     return "invalid number";
                      //   } else if (value.number.length < 10) {
                      //     return "invalid number";
                      //   } else {
                      //     return null;
                      //   }
                      // },
                      disableLengthCheck: true,
                      showCountryFlag: false,
                      pickerDialogStyle: PickerDialogStyle(
                        backgroundColor: ConstantColors.white,
                        countryNameStyle:
                            const TextStyle(fontWeight: FontWeight.w500),
                        searchFieldPadding: const EdgeInsets.all(8),
                      ),
                      autovalidateMode: AutovalidateMode.disabled,
                      onChanged: (value) {
                        authProvider.countryCode(value);
                      },
                      controller: phoneNumberController,
                      initialCountryCode: 'IN',
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 14),
                      decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 13),
                        filled: true,
                        fillColor: ConstantColors.white,
                        hintText: "Number goes here",
                        hintStyle: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w400),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Gap(31.88),
                  Center(
                    child: LoginButtons(
                        screenWidth: screenWidth,
                        text: "Send code",
                        onPressed: () {
                          // final isValid = validator.currentState!.validate();
                          // log(isValid.toString());
                          // if (!validator.currentState!.validate()) {
                          //   validator.currentState!.validate();
                          // } else {
                          if (phoneNumberController.text.isEmpty) {
                            fToast!.showToast(
                              gravity: ToastGravity.BOTTOM,
                              toastDuration: const Duration(seconds: 2),
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: ConstantColors.white,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.close,
                                      color: Colors.red,
                                    ),
                                    Gap(10),
                                    Text("Please enter your number")
                                  ],
                                ),
                              ),
                            );
                          } else {
                            sentPhoneNumber();
                            // if (authProvider.isLoading == true) {
                            //   customLoading(context, "Sending OTP...");
                            // }

                            phoneNumberController.clear();
                            Fluttertoast.showToast(
                                msg: "OTP Sent",
                                backgroundColor: ConstantColors.white,
                                timeInSecForIosWeb: 2,
                                gravity: ToastGravity.BOTTOM,
                                toastLength: Toast.LENGTH_SHORT);
                          }

                          // fToast!.showToast(
                          //   gravity: ToastGravity.SNACKBAR,
                          //   toastDuration: const Duration(seconds: 2),
                          //   child: Container(
                          //     padding: const EdgeInsets.all(16),
                          //     decoration: BoxDecoration(
                          //       color: ConstantColors.white,
                          //       borderRadius: BorderRadius.circular(25),
                          //     ),
                          //     child: const Row(
                          //       mainAxisSize: MainAxisSize.min,
                          //       children: [
                          //         Icon(
                          //           Icons.done,
                          //           color: ConstantColors.mainBlueTheme,
                          //         ),
                          //         Gap(20),
                          //         Text("OTP Sent")
                          //       ],
                          //     ),
                          //   ),
                          // );
                        }),
                  ),
                  const Gap(17),
                  Center(
                    child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          );
                        },
                        style: ButtonStyle(
                          side: const MaterialStatePropertyAll(
                            BorderSide(
                              color: ConstantColors.white,
                            ),
                          ),
                          fixedSize: const MaterialStatePropertyAll(
                            Size.fromHeight(43),
                          ),
                          maximumSize: MaterialStatePropertyAll(
                            Size.fromWidth(screenWidth),
                          ),
                        ),
                        child: const Text(
                          "Skip login",
                          style: TextStyle(
                              color: ConstantColors.white,
                              fontWeight: FontWeight.w500),
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void sentPhoneNumber() async {
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);

    String phoneNumber =
        "${authProvider.selectedCode}${phoneNumberController.text.trim()}";

    await authProvider.login(
      phoneNumber: phoneNumber,
      onFailure: () {
        Fluttertoast.showToast(
            msg: "Invalid Number",
            backgroundColor: ConstantColors.white,
            timeInSecForIosWeb: 2,
            gravity: ToastGravity.BOTTOM);
      },
      onSuccess: (verificationId) {
        Navigator.pop(context);

        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OtpScreen(verificationId: verificationId),
            ));
      },
    );
  }
}
