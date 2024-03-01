// import 'package:chahele_project/utils/constant_colors/constant_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:gap/gap.dart';

// class ToastWidget extends StatefulWidget {
//   const ToastWidget({super.key});

//   @override
//   State<ToastWidget> createState() => _ToastWidgetState();
// }

// class _ToastWidgetState extends State<ToastWidget> {
//   FToast? fToast;
  

//   @override
//   void initState() {
//     super.initState();
//     fToast = FToast();
//     fToast!.init(context);
//   }
//   @override
//   Widget build(BuildContext context) {
//     return  fToast!.showToast(
//                               gravity: ToastGravity.BOTTOM,
//                               toastDuration: const Duration(seconds: 2),
//                               child: Container(
//                                 padding: const EdgeInsets.all(16),
//                                 decoration: BoxDecoration(
//                                   color: ConstantColors.white,
//                                   borderRadius: BorderRadius.circular(25),
//                                 ),
//                                 child: const Row(
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: [
//                                     Icon(
//                                       Icons.close,
//                                       color: Colors.red,
//                                     ),
//                                     Gap(10),
//                                     Text("Please enter your number")
//                                   ],
//                                 ),
//                               ),
//                             );
//   }
// }