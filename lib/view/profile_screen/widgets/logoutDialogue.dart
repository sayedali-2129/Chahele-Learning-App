import 'package:chahele_project/controller/authentication_provider.dart';
import 'package:chahele_project/utils/constant_colors/constant_colors.dart';
import 'package:chahele_project/utils/constant_icons/constant_icons.dart';
import 'package:chahele_project/utils/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

Future<dynamic> logOutDailogue(
    {required BuildContext context,
    required AuthenticationProvider provider,
    required String message,
    required final void Function()? onYes}) {
  return showDialog(
      context: context,
      builder: (context) => Material(
            type: MaterialType.transparency,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 214,
                  width: 295,
                  decoration: BoxDecoration(
                    color: ConstantColors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 60,
                        width: 66,
                        child: SvgPicture.asset(ConstantIcons.warningIconSvg),
                      ),
                      const Gap(16),
                      Text(
                        message,
                        style: const TextStyle(
                            color: ConstantColors.headingBlue,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                      const Gap(32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ButtonWidget(
                            buttonHeight: 33,
                            buttonWidth: 113,
                            buttonColor: ConstantColors.buttonScndColor,
                            buttonText: "No",
                            textColor: ConstantColors.black,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          const Gap(23),
                          ButtonWidget(
                              buttonHeight: 33,
                              buttonWidth: 113,
                              buttonColor: ConstantColors.mainBlueTheme,
                              buttonText: "Yes",
                              onPressed: onYes),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ));
}
