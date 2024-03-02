import 'package:chahele_project/utils/constant_colors/constant_colors.dart';
import 'package:chahele_project/utils/constant_images/constant_images.dart';
import 'package:chahele_project/view/home_screen/widgets/ad_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Material(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            //App BAr
            SliverAppBar(
              expandedHeight: 70,
              forceElevated: true,
              centerTitle: true,
              backgroundColor: ConstantColors.white,
              elevation: 8,
              shadowColor: Colors.black.withOpacity(0.4),
              title: SizedBox(
                height: 42,
                width: 136,
                child: SvgPicture.asset(ConstantImage.appBarLogoSvg),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: SvgPicture.asset(
                    ConstantImage.notificationSvg,
                    height: 26,
                    width: 24,
                  ),
                )
              ],
            ),
            //AD Slider
            SliverToBoxAdapter(
              child: AdSlider(screenWidth: screenWidth),
            ),
            SliverFillRemaining(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Syllabus",
                          style: TextStyle(
                              color: ConstantColors.headingBlue,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "View All",
                            style: TextStyle(
                                color: ConstantColors.headingBlue,
                                fontSize: 10,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    SliverGrid.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3),
                      itemCount: 6,
                      itemBuilder: (context, index) => Container(
                        height: 98,
                        width: 98,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.amber),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
