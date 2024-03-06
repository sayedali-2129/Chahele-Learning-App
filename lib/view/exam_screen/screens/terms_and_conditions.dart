import 'package:chahele_project/utils/constant_colors/constant_colors.dart';
import 'package:chahele_project/view/exam_screen/widgets/appbar_terms.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ExamTandCScreen extends StatelessWidget {
  const ExamTandCScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const AppBarTandC(),
          const SliverGap(24),
          SliverToBoxAdapter(
            child: Container(
              width: screenWidth,
              height: 159,
              decoration: BoxDecoration(
                  color: ConstantColors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 7,
                        offset: const Offset(0, 1),
                        color: ConstantColors.black.withOpacity(0.15))
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "EXAM DETAILS",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: ConstantColors.black.withOpacity(0.7)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
