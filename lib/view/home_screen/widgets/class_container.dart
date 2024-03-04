import 'package:chahele_project/utils/constant_colors/constant_colors.dart';
import 'package:chahele_project/utils/constant_images/constant_images.dart';
import 'package:flutter/material.dart';

class ClassContainer extends StatelessWidget {
  const ClassContainer({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: screenWidth,
          height: 180,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(24)),
            image: DecorationImage(
                image: AssetImage(ConstImages.classBg1), fit: BoxFit.cover),
          ),
        ),
        Positioned(
          right: 0,
          child: Center(
            child: Container(
              height: 48,
              width: 176,
              decoration: const BoxDecoration(
                color: ConstantColors.syllabusStackOp80,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(9.82),
                  topLeft: Radius.circular(9.82),
                ),
              ),
              child: const Center(
                child: Text(
                  "English V",
                  style: TextStyle(
                      color: ConstantColors.headingBlue,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
