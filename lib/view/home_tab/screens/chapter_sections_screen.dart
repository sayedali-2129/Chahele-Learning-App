import 'package:chahele_project/controller/course_provider.dart';
import 'package:chahele_project/utils/constant_colors/constant_colors.dart';
import 'package:chahele_project/utils/constant_icons/constant_icons.dart';
import 'package:chahele_project/view/home_tab/screens/video_player_screen.dart';
import 'package:chahele_project/view/widgets/heading_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class SectionsScreen extends StatefulWidget {
  const SectionsScreen({super.key, required this.index});
  final int index;

  @override
  State<SectionsScreen> createState() => _SectionsScreenState();
}

class _SectionsScreenState extends State<SectionsScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<CourseProvider>(context, listen: false).fetchSections();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final sectionProvider = Provider.of<CourseProvider>(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const HeadingAppBar(heading: "Sections", isBackButtomn: true),
          SliverList.builder(
              itemCount: sectionProvider.sectionList.length,
              itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(16),
                    child: SizedBox(
                      width: screenWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Section Name
                          Text(
                            "${index + 1} - ${sectionProvider.sectionList[index].sectionName}",
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: ConstantColors.headingBlue),
                          ),
                          const Gap(16),
                          //Video
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => VideoPlayerScreen(
                                      videoUrl: sectionProvider
                                          .sectionList[index].videoUrl,
                                      sectionName: sectionProvider
                                          .sectionList[index].sectionName),
                                ),
                              );
                            },
                            child: Container(
                              height: 200,
                              decoration: BoxDecoration(
                                  color: ConstantColors.buttonScndColor,
                                  borderRadius: BorderRadius.circular(16)),
                              child: Center(
                                child: SvgPicture.asset(
                                  ConstantIcons.playIconSvg,
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                            ),
                          ),
                          const Gap(16),
                          //Description
                          Text(
                            "Please add your content here. Keep it short and simple. And smile Please add your cont short and simple. And smile Pyour content here. Kort and simple. And smile ",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: ConstantColors.black.withOpacity(0.7)),
                          ),
                        ],
                      ),
                    ),
                  ))
        ],
      ),
    );
  }
}
