import 'package:chahele_project/controller/course_provider.dart';
import 'package:chahele_project/view/home_screen/screens/medium_screen.dart';
import 'package:chahele_project/view/home_screen/widgets/square_stack_container.dart';
import 'package:chahele_project/view/widgets/heading_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StandardScreen extends StatelessWidget {
  const StandardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final standardProvider = Provider.of<CourseProvider>(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const HeadingAppBar(heading: "Standard's", isBackButtomn: true),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverGrid.builder(
                itemCount: standardProvider.standardsList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 15.81,
                    crossAxisSpacing: 15.81,
                    crossAxisCount: 3),
                itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MediumScreen(),
                            ));
                      },
                      child: SquareStackContainer(
                          content:
                              standardProvider.standardsList[index].standard,
                          image: standardProvider.standardsList[index].image),
                    )),
          )
        ],
      ),
    );
  }
}
