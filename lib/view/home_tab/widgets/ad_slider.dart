import 'package:carousel_slider/carousel_slider.dart';
import 'package:chahele_project/controller/banner_controller.dart';
import 'package:chahele_project/utils/constant_colors/constant_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdSlider extends StatefulWidget {
  const AdSlider({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  State<AdSlider> createState() => _AdSliderState();
}

class _AdSliderState extends State<AdSlider> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<BannerController>(context, listen: false).fetchBanner();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BannerController>(context);

    // int _currentIndex = 0;

    // final _controller = CarouselController();

    int currentIndex = 0;

    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: provider.banners.length,
          itemBuilder: (context, index, realIndex) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: provider.banners.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(
                      color: ConstantColors.mainBlueTheme,
                    ),
                  )
                : Container(
                    width: widget.screenWidth,
                    height: 202,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                            image: NetworkImage(
                              provider.banners[index].image,
                            ),
                            fit: BoxFit.cover)),
                  ),
          ),
          options: CarouselOptions(
            viewportFraction: 1,
            initialPage: 0,
            autoPlay: true,
            autoPlayCurve: Curves.decelerate,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
        // DotsIndicator(
        //   dotsCount: provider.banners.length,
        //   position: currentIndex,
        // )
      ],
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