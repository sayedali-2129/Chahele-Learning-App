import 'package:chahele_project/controller/course_provider.dart';
import 'package:chahele_project/view/home_tab/screens/chapter_list_screen.dart';
import 'package:chahele_project/view/home_tab/widgets/rec_stack_container.dart';
import 'package:chahele_project/widgets/heading_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SubjectScreen extends StatefulWidget {
  const SubjectScreen({super.key, required this.id});
  final String id;

  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<CourseProvider>(context, listen: false)
          .fetchSubjects(widget.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final provider = Provider.of<CourseProvider>(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const HeadingAppBar(heading: "Subjects", isBackButtomn: true),
          SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverSkeletonizer(
                enabled: provider.isLoading == true,
                child: SliverList.separated(
                  separatorBuilder: (context, index) => const Gap(16),
                  itemCount: provider.subjectList.length,
                  itemBuilder: (context, index) => RecStackContainer(
                    screenWidth: screenWidth,
                    content: provider.subjectList[index].subject,
                    image: provider.subjectList[index].image,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChapterListScreen(
                                id: provider.subjectList[index].id!,
                                index: index),
                          ));
                    },
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
