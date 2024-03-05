import 'package:chahele_project/utils/constant_colors/constant_colors.dart';
import 'package:flutter/material.dart';

class HeadingAppBar extends StatelessWidget {
  const HeadingAppBar({
    super.key,
    required this.heading,
  });
  final String heading;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        surfaceTintColor: ConstantColors.white,
        titleSpacing: 0,
        leading: Padding(
          padding: const EdgeInsets.all(16),
          child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios)),
        ),
        expandedHeight: 60,
        pinned: true,
        forceElevated: true,
        centerTitle: false,
        backgroundColor: ConstantColors.white,
        elevation: 8,
        shadowColor: Colors.black.withOpacity(0.4),
        title: Text(
          heading,
          style: const TextStyle(
              color: ConstantColors.headingBlue,
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ));
  }
}
