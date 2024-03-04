import 'package:chahele_project/utils/constant_colors/constant_colors.dart';
import 'package:chahele_project/utils/constant_images/constant_images.dart';
import 'package:flutter/material.dart';

class SyllubusContainer extends StatelessWidget {
  const SyllubusContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
//     Random random = Random();
// int randomIndex = random.nextInt(ConstImages.)
// Image randomImage = randomImages[randomIndex];
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: [
        Container(
          height: 98,
          width: 98,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: Colors.black12,
                  blurRadius: 20,
                  spreadRadius: 2,
                  offset: Offset(10, 5))
            ],
            borderRadius: BorderRadius.circular(24),
            image: const DecorationImage(
                image: AssetImage(ConstImages.syllabusBg1),
                fit: BoxFit.cover,
                opacity: 0.7),
          ),
        ),
        Positioned(
          left: 45,
          child: Center(
            child: Container(
              width: 75,
              height: 30,
              decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 20,
                        spreadRadius: 0,
                        offset: Offset(5, 0))
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(7.9),
                    topLeft: Radius.circular(7.9),
                  ),
                  color: ConstantColors.syllabusStackColor),
              child: const Center(
                child: Text(
                  "State",
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
