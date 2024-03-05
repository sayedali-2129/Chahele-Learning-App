import 'package:carousel_slider/carousel_slider.dart';
import 'package:chahele_project/utils/constant_images/constant_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AdSlider extends StatelessWidget {
  const AdSlider({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    // int _currentIndex = 0;

    // final _controller = CarouselController();

    return CarouselSlider.builder(
      itemCount: 3,
      itemBuilder: (context, index, realIndex) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Container(
          width: screenWidth,
          height: 202,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          child: SvgPicture.asset(
            ConstantImage.adBannerSampleSvg,
            fit: BoxFit.cover,
          ),
        ),
      ),
      options: CarouselOptions(
        viewportFraction: 1,
        initialPage: 0,
      ),
    );
  }
}




// Stack(
//       alignment: Alignment.center,
//       children: [
//         Container(
//           height: 202,
//           width: screenWidth,
//           decoration: const BoxDecoration(
//             color: Colors.amber,
//             borderRadius: BorderRadius.all(Radius.circular(16)),
//           ),
//         ),
//         Center(
//           child: SvgPicture.asset(
//             ConstantImage.adBannerSampleSvg,
//             width: screenWidth,
//             // height: 202,
//           ),
//         ),
//       ],
//     );