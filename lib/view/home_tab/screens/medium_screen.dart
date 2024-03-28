import 'package:chahele_project/controller/authentication_provider.dart';
import 'package:chahele_project/controller/course_provider.dart';
import 'package:chahele_project/view/authentication_screens/login_screen.dart';
import 'package:chahele_project/view/home_tab/screens/subjects_screen.dart';
import 'package:chahele_project/view/home_tab/widgets/rec_stack_container.dart';
import 'package:chahele_project/widgets/heading_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class MediumScreen extends StatefulWidget {
  const MediumScreen({super.key, required this.id, required this.index});
  final String id;
  final int index;

  @override
  State<MediumScreen> createState() => _MediumScreenState();
}

class _MediumScreenState extends State<MediumScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<CourseProvider>(context, listen: false)
          .fetchMediumData(widget.id);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Consumer2<CourseProvider, AuthenticationProvider>(
        builder: (context, standardProvider, authProvider, _) {
      return Scaffold(
        body: CustomScrollView(
          slivers: [
            HeadingAppBar(
                heading: standardProvider.standardsList[widget.index].standard,
                isBackButtomn: true),
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverList.separated(
                separatorBuilder: (context, index) => const Gap(16),
                itemCount: standardProvider.mediumList.length,
                itemBuilder: (context, index) => RecStackContainer(
                    isStdContainerEnable: false,
                    onPressed: () {
                      authProvider.firebaseAuth.currentUser == null
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            )
                          : Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SubjectScreen(
                                    index: index,
                                    id: standardProvider.mediumList[index].id!),
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
    });
  }
}
