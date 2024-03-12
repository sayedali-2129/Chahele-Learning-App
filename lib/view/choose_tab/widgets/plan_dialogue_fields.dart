import 'package:chahele_project/view/profile_tab/widgets/textfield_widget.dart';
import 'package:chahele_project/view/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../utils/constant_colors/constant_colors.dart';

Future<dynamic> planFields(
    {required BuildContext context,
    required double screenWidth,
    required void Function()? onPressed}) {
  return showDialog(
    context: context,
    builder: (context) => Material(
      type: MaterialType.transparency,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Container(
            width: screenWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: ConstantColors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Name",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: ConstantColors.headingBlue),
                  ),
                  const Gap(8),
                  const TextfieldWidget(),
                  const Gap(8),
                  const Text(
                    "Guardian Name",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: ConstantColors.headingBlue),
                  ),
                  const Gap(8),
                  const TextfieldWidget(),
                  const Gap(8),
                  const Text(
                    "Syllabus",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: ConstantColors.headingBlue),
                  ),
                  const Gap(8),
                  const TextfieldWidget(),
                  const Gap(8),
                  const Text(
                    "School Name",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: ConstantColors.headingBlue),
                  ),
                  const Gap(8),
                  const TextfieldWidget(),
                  const Gap(8),
                  const Text(
                    "Class",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: ConstantColors.headingBlue),
                  ),
                  const Gap(8),
                  const TextfieldWidget(),
                  const Gap(16),
                  ButtonWidget(
                      buttonHeight: 42,
                      buttonWidth: screenWidth,
                      buttonColor: ConstantColors.headingBlue,
                      buttonText: "Choose My Plan",
                      onPressed: onPressed)
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
