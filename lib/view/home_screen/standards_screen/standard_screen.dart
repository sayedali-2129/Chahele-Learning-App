import 'package:chahele_project/controller/standard_provider.dart';
import 'package:chahele_project/utils/widgets/heading_app_bar.dart';
import 'package:chahele_project/view/home_screen/medium_screen/medium_screen.dart';
import 'package:chahele_project/view/home_screen/widgets/standards_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StandardScreen extends StatelessWidget {
  const StandardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final standardProvider = Provider.of<StandardProvider>(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const HeadingAppBar(heading: "Standard's"),
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
                      child: StandardContainer(
                          standard:
                              standardProvider.standardsList[index].standard,
                          image: standardProvider.standardsList[index].image),
                    )),
          )
        ],
      ),
    );
  }
}
