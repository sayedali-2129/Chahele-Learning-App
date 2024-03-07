import 'package:chahele_project/utils/constant_colors/constant_colors.dart';
import 'package:chahele_project/utils/constant_images/constant_images.dart';
import 'package:chahele_project/utils/widgets/heading_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ChapterListScreen extends StatelessWidget {
  const ChapterListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const HeadingAppBar(heading: "Chapters"),
          SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverList.separated(
                separatorBuilder: (context, index) => const Gap(8),
                itemCount: 5,
                itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: ConstantColors.white,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 4,
                            spreadRadius: 0,
                            offset: const Offset(-1, 1),
                            color: ConstantColors.black.withOpacity(0.1))
                      ]),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //Chapter Name
                              Text(
                                "${index + 1} - Chapter Name",
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: ConstantColors.headingBlue),
                              ),
                              //Description
                              Text(
                                "Please add your content here. Keep it short and simple. And smile :)",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color:
                                        ConstantColors.black.withOpacity(0.7)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      //Image
                      Container(
                        height: 80,
                        width: 80,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(ConstantImage.chapterSample),
                                fit: BoxFit.cover),
                            color: Colors.amber,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(16),
                                bottomRight: Radius.circular(16))),
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
