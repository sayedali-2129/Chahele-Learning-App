import 'package:chahele_project/controller/standard_provider.dart';
import 'package:chahele_project/utils/widgets/heading_app_bar.dart';
import 'package:chahele_project/view/home_screen/widgets/class_container.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class MediumScreen extends StatelessWidget {
  const MediumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final standardProvider = Provider.of<StandardProvider>(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const HeadingAppBar(heading: "Medium"),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList.separated(
              separatorBuilder: (context, index) => const Gap(16),
              itemCount: standardProvider.mediumList.length,
              itemBuilder: (context, index) => ClassContainer(
                  screenWidth: screenWidth,
                  image: standardProvider.mediumList[index].image,
                  medium: standardProvider.mediumList[index].medium),
            ),
          )
        ],
      ),
    );
  }
}
