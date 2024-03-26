import 'package:chahele_project/utils/constant_colors/constant_colors.dart';
import 'package:chahele_project/widgets/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RecStackContainer extends StatelessWidget {
  const RecStackContainer({
    super.key,
    required this.screenWidth,
    required this.content,
    required this.image,
    required this.onPressed,
    required this.isStdContainerEnable,
    this.standard,
  });
  final String content;
  final String image;
  final bool isStdContainerEnable;
  final String? standard;

  final double screenWidth;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            width: screenWidth,
            height: 200,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(24)),
            ),
            child: Opacity(
                opacity: 0.8, child: CustomCachedNetworkImage(image: image)),
          ),
          isStdContainerEnable == true
              ? Positioned(
                  left: 30,
                  top: 0,
                  child: Container(
                    height: 60,
                    width: 70,
                    decoration: const BoxDecoration(
                        color: ConstantColors.syllabusStackOp80,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                    child: Center(
                      child: Text(
                        standard!,
                        style: TextStyle(
                            color: ConstantColors.headingBlue,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                )
              : Gap(0),
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
                        content,
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
      ),
    );
  }
}
