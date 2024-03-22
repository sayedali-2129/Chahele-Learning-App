import 'package:chahele_project/controller/course_provider.dart';
import 'package:chahele_project/view/home_tab/screens/chapter_sections_screen.dart';
import 'package:chahele_project/view/home_tab/widgets/chapter_list_tile_container.dart';
import 'package:chahele_project/widgets/heading_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ChapterListScreen extends StatefulWidget {
  const ChapterListScreen({super.key, required this.index, required this.id});
  final int index;
  final String id;

  @override
  State<ChapterListScreen> createState() => _ChapterListScreenState();
}

class _ChapterListScreenState extends State<ChapterListScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<CourseProvider>(context, listen: false)
          .fetchChapter(widget.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final subjectProvider = Provider.of<CourseProvider>(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          HeadingAppBar(
              heading: subjectProvider.subjectList[widget.index].subject,
              isBackButtomn: true),
          SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverSkeletonizer(
                enabled: subjectProvider.isLoading == true,
                child: SliverList.separated(
                  separatorBuilder: (context, index) => const Gap(8),
                  itemCount: subjectProvider.chapterList.length,
                  itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SectionsScreen(
                                index: index,
                                id: subjectProvider.chapterList[index].id!,
                              ),
                            ));
                      },
                      child: ChapterListTile(
                          chapterName:
                              subjectProvider.chapterList[index].chapter,
                          description: subjectProvider.chapterList[index].about,
                          index: index)),
                ),
              ))
        ],
      ),
    );
  }
}
