import 'package:chahele_project/utils/constant_colors/constant_colors.dart';
import 'package:flutter/material.dart';

class ClassContainer extends StatelessWidget {
  const ClassContainer({
    super.key,
    required this.screenWidth,
    required this.medium,
    required this.image,
  });
  final String medium;
  final String image;

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: screenWidth,
          height: 180,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(24)),
            image:
                DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
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
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Center(
                    child: Text(
                      medium,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                          color: ConstantColors.headingBlue,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
