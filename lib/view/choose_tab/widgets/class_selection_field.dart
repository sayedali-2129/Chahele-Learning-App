import 'package:chahele_project/utils/constant_colors/constant_colors.dart';
import 'package:chahele_project/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

Future<dynamic> classSelectionField({
  required BuildContext context,
  required double screenWidth,
  required List<DropdownMenuItem<String>>? syllabusItems,
  required List<DropdownMenuItem<String>>? classItems,
  required String classValue,
  required String syllabusValue,
  required void Function()? onPressed,
}) {
  return showDialog(
      context: context,
      builder: (context) => Material(
            type: MaterialType.transparency,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: StatefulBuilder(
                  builder: (context, StateSetter setState) {
                    return Container(
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
                              "Standard",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: ConstantColors.headingBlue),
                            ),
                            const Gap(8),
                            DropdownButton(
                                value: classValue,
                                items: classItems,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    classValue = newValue!;
                                  });
                                }),
                            const Gap(8),
                            const Text(
                              "Medium",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: ConstantColors.headingBlue),
                            ),
                            const Gap(8),
                            DropdownButton(
                              items: syllabusItems,
                              value: syllabusValue,
                              onChanged: (String? newValue) {
                                setState(() {
                                  syllabusValue = newValue!;
                                });
                              },
                            ),
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
                    );
                  },
                ),
              ),
            ),
          ));
}
