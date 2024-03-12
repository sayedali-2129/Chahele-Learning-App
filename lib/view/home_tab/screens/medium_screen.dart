import 'package:chahele_project/controller/course_provider.dart';
import 'package:chahele_project/view/home_tab/screens/subjects_screen.dart';
import 'package:chahele_project/view/home_tab/widgets/rec_stack_container.dart';
import 'package:chahele_project/view/widgets/heading_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class MediumScreen extends StatelessWidget {
  const MediumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final standardProvider = Provider.of<CourseProvider>(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const HeadingAppBar(heading: "Medium", isBackButtomn: true),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList.separated(
              separatorBuilder: (context, index) => const Gap(16),
              itemCount: standardProvider.mediumList.length,
              itemBuilder: (context, index) => RecStackContainer(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SubjectScreen(),
                        ));
                  },
                  screenWidth: screenWidth,
                  image: standardProvider.mediumList[index].image,
                  content: standardProvider.mediumList[index].medium),
            ),
          )
        ],
      ),
    );
  }
}
