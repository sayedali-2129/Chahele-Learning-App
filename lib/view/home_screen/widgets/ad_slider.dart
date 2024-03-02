import 'package:chahele_project/utils/constant_images/constant_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AdSlider extends StatelessWidget {
  const AdSlider({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 202,
            width: screenWidth,
            decoration: const BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
          ),
          Center(
            child: SvgPicture.asset(
              ConstantImage.adBannerSampleSvg,
              width: screenWidth,
              // height: 202,
            ),
          ),
        ],
      ),
    );
  }
}
