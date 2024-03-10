import 'package:chahele_project/utils/constant_colors/constant_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SelectedPlanContainer extends StatelessWidget {
  const SelectedPlanContainer({
    super.key,
    required this.screenWidth,
    required this.isSelected,
  });

  final double screenWidth;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final textColor =
        isSelected ? ConstantColors.white : ConstantColors.headingBlue;

    return Padding(
      padding: isSelected == true
          ? const EdgeInsets.all(0)
          : const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 90,
        width: screenWidth,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: isSelected == true
                ? ConstantColors.mainBlueTheme
                : ConstantColors.unselectedPlan),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Plan End",
                    style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 12),
                  ),
                  Text(
                    "Aug 08",
                    style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 10),
                  ),
                ],
              ),
              const Gap(8),
              VerticalDivider(
                color: textColor,
              ),
              const Gap(8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 6,
                        backgroundColor: ConstantColors.onlineDotGreen,
                      ),
                      const Gap(5),
                      Text(
                        "Class VII",
                        style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 12),
                      ),
                    ],
                  ),
                  Text(
                    "Your plane details - CBSE English medium\nSchool name and place ",
                    style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 10),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
