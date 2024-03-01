// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void customLoading(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (context) => Center(
      child: Lottie.asset("assets/lottie/Animation - 1709136420373.json",
          height: 250, width: 250),
    ),
  );

  //   AlertDialog(
  // backgroundColor: ConstantColors.mainBlueTheme,
  // elevation: 0,
  // contentPadding: EdgeInsets.zero,
  // content: PopScope(
  //   canPop: false,
  //   child: Center(
  //     child: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: [
  //         const Gap(20),
  //         const RiveAnimation.asset(
  //           "assets/rive/loading.riv",
  //           alignment: Alignment.center,
  //         ),
  //         const Gap(20),
  //         Text(
  //           message,
  //           style: const TextStyle(color: ConstantColors.black),
  //         ),
  //         const Gap(20),
  //       ],
  //     ),
  //   ),

  // child: Center(
  //   child: CircularProgressIndicator(),
  // ),
}
