import 'package:chahele_project/controller/banner_controller.dart';
import 'package:chahele_project/controller/course_provider.dart';
import 'package:chahele_project/utils/constant_colors/constant_colors.dart';
import 'package:chahele_project/utils/constant_icons/constant_icons.dart';
import 'package:chahele_project/utils/constant_images/constant_images.dart';
import 'package:chahele_project/view/home_tab/screens/medium_screen.dart';
import 'package:chahele_project/view/home_tab/screens/standard_screen.dart';
import 'package:chahele_project/view/home_tab/screens/subjects_screen.dart';
import 'package:chahele_project/view/home_tab/widgets/ad_slider.dart';
import 'package:chahele_project/view/home_tab/widgets/rec_stack_container.dart';
import 'package:chahele_project/view/home_tab/widgets/square_stack_container.dart';
import 'package:chahele_project/view/notification_screen/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<CourseProvider>(context, listen: false).fetchStandards();
      // Provider.of<CourseProvider>(context, listen: false).fetchMediumData();
      Provider.of<BannerController>(context, listen: false).fetchBanner();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final standardProvider = Provider.of<CourseProvider>(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          //App BAr
          SliverAppBar(
            surfaceTintColor: ConstantColors.white,
            expandedHeight: 60,
            pinned: true,
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
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NotificationScreen(),
                      ),
                    );
                  },
                  child: SvgPicture.asset(
                    ConstantIcons.notificationSvg,
                    height: 26,
                    width: 24,
                  ),
                ),
              ),
              const Gap(10)
            ],
          ),
          const SliverGap(16),
          //AD Slider
          SliverToBoxAdapter(
            child: AdSlider(screenWidth: screenWidth),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  //Standard Grid
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Standard's",
                        style: TextStyle(
                            color: ConstantColors.headingBlue,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const StandardScreen(),
                              ));
                        },
                        child: const Text(
                          "View All",
                          style: TextStyle(
                              // decoration: TextDecoration.underline,
                              // decorationColor: ConstantColors.viewAll,
                              decorationThickness: 2,
                              color: ConstantColors.viewAll,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  //Standards
                  GridView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 15.81,
                            crossAxisSpacing: 15.81,
                            crossAxisCount: 3),
                    itemCount: standardProvider.standardsList.length > 6
                        ? 6
                        : standardProvider.standardsList.length,
                    itemBuilder: (context, index) => Skeletonizer(
                      enabled: standardProvider.isLoading,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MediumScreen(
                                    index: index,
                                    id: standardProvider
                                        .standardsList[index].id!),
                              ));
                        },
                        child: SquareStackContainer(
                          content:
                              standardProvider.standardsList[index].standard,
                          image: standardProvider.standardsList[index].image,
                        ),
                      ),
                    ),
                  ),

                  //List of Classes
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "List of Class",
                        style: TextStyle(
                            color: ConstantColors.headingBlue,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "View All",
                          style: TextStyle(
                              color: ConstantColors.viewAll,
                              // decoration: TextDecoration.underline,
                              // decorationColor: ConstantColors.viewAll,
                              decorationThickness: 2,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  Skeletonizer(
                    enabled: standardProvider.isLoading == true,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const Gap(16),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: standardProvider.mediumList.length > 3
                          ? 3
                          : standardProvider.mediumList.length,
                      itemBuilder: (context, index) => RecStackContainer(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SubjectScreen(
                                    id: standardProvider.mediumList[index].id!),
                              ));
                        },
                        screenWidth: screenWidth,
                        image: standardProvider.mediumList[index].image,
                        content: standardProvider.mediumList[index].medium,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
