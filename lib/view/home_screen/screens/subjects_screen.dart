import 'package:chahele_project/controller/standard_provider.dart';
import 'package:chahele_project/utils/widgets/heading_app_bar.dart';
import 'package:chahele_project/view/home_screen/screens/chapter_list_screen.dart';
import 'package:chahele_project/view/home_screen/widgets/rec_stack_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubjectScreen extends StatefulWidget {
  const SubjectScreen({super.key});

  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<StandardProvider>(context, listen: false).fetchSubjects();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final provider = Provider.of<StandardProvider>(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const HeadingAppBar(heading: "Subjects"),
          SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverList.builder(
                itemCount: provider.subjectList.length,
                itemBuilder: (context, index) => RecStackContainer(
                  screenWidth: screenWidth,
                  content: provider.subjectList[index].subject,
                  image: provider.subjectList[index].image,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChapterListScreen(),
                        ));
                  },
                ),
              ))
        ],
      ),
    );
  }
}
