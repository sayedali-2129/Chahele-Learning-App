// import 'dart:developer';

// import 'package:chahele_project/controller/authentication_provider.dart';
// import 'package:chahele_project/controller/course_provider.dart';
// import 'package:chahele_project/controller/plan_controller.dart';
// import 'package:chahele_project/model/medium_model.dart';
// import 'package:chahele_project/model/standard_model.dart';
// import 'package:chahele_project/utils/constant_colors/constant_colors.dart';
// import 'package:chahele_project/view/authentication_screens/login_screen.dart';
// import 'package:chahele_project/view/choose_tab/subscription_screen.dart';
// import 'package:chahele_project/view/choose_tab/widgets/selected_plan.dart';
// import 'package:chahele_project/view/profile_tab/widgets/profile_card.dart';
// import 'package:chahele_project/widgets/button_widget.dart';
// import 'package:chahele_project/widgets/heading_app_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:provider/provider.dart';

// class ChooseScreen extends StatefulWidget {
//   const ChooseScreen({super.key, required this.index});
//   final int index;

//   @override
//   State<ChooseScreen> createState() => _ChooseScreenState();
// }

// class _ChooseScreenState extends State<ChooseScreen> {
//   List<StandardModel> classList = [];
//   List<MediumModel> mediumList = [];

//   @override
//   void initState() {
//     final courseProvider = Provider.of<CourseProvider>(context, listen: false);
//     final planProvider = Provider.of<PlanController>(context, listen: false);

//     classList = List.generate(courseProvider.planStandardList.length,
//         (index) => courseProvider.planStandardList[index]);

//     mediumList = List.generate(planProvider.planMediumList.length,
//         (index) => planProvider.planMediumList[index]);

//     log(mediumList.length.toString());
//     super.initState();
//   }

//   int selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final authProvider = Provider.of<AuthenticationProvider>(context);

//     return Consumer<PlanController>(builder: (context, planController, _) {
//       return Scaffold(
//         body: CustomScrollView(
//           slivers: [
//             const HeadingAppBar(heading: "Choose Plan", isBackButtomn: false),
//             SliverPadding(
//               padding: const EdgeInsets.only(top: 8, bottom: 8),
//               sliver: authProvider.firebaseAuth.currentUser == null
//                   ? SliverToBoxAdapter(
//                       child: Padding(
//                         padding: const EdgeInsets.all(16),
//                         child: GestureDetector(
//                           onTap: () {
//                             Navigator.pushReplacement(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => const LoginScreen(),
//                               ),
//                             );
//                           },
//                           child: const ContinueToLoginCont(
//                               content: "Please Login to choose your plan"),
//                         ),
//                       ),
//                     )
//                   : SliverList.separated(
//                       separatorBuilder: (context, index) => const Gap(8),
//                       itemCount: 5,
//                       itemBuilder: (context, index) {
//                         return GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               selectedIndex = index;
//                             });
//                           },
//                           child: SelectedPlanContainer(
//                             screenWidth: screenWidth,
//                             isSelected: selectedIndex == index,
//                           ),
//                         );
//                       },
//                     ),
//             ),
//             SliverToBoxAdapter(
//               child: Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     authProvider.firebaseAuth.currentUser == null
//                         ? const Gap(0)
//                         : ButtonWidget(
//                             buttonHeight: 42,
//                             buttonWidth: 155,
//                             buttonColor: ConstantColors.mainBlueTheme,
//                             buttonText: "Confirm",
//                             onPressed: () {
//                               showDialog(
//                                   context: context,
//                                   builder: (context) => Material(
//                                         type: MaterialType.transparency,
//                                         child: Padding(
//                                           padding: const EdgeInsets.all(16),
//                                           child: Center(
//                                             child: StatefulBuilder(builder:
//                                                 (context,
//                                                     StateSetter setState) {
//                                               return Container(
//                                                 width: screenWidth,
//                                                 decoration: BoxDecoration(
//                                                   borderRadius:
//                                                       BorderRadius.circular(16),
//                                                   color: ConstantColors.white,
//                                                 ),
//                                                 child: Padding(
//                                                   padding:
//                                                       const EdgeInsets.all(16),
//                                                   child: Column(
//                                                     mainAxisSize:
//                                                         MainAxisSize.min,
//                                                     crossAxisAlignment:
//                                                         CrossAxisAlignment
//                                                             .start,
//                                                     children: [
//                                                       const Text(
//                                                         "Standard",
//                                                         style: TextStyle(
//                                                             fontSize: 14,
//                                                             fontWeight:
//                                                                 FontWeight.w600,
//                                                             color: ConstantColors
//                                                                 .headingBlue),
//                                                       ),
//                                                       const Gap(8),
//                                                       DropdownButton(
//                                                           isExpanded: true,
//                                                           hint: Text(
//                                                               "Select STD"),
//                                                           value: planController
//                                                               .dropClassValue,
//                                                           items: classList.map<
//                                                               DropdownMenuItem<
//                                                                   String>>(
//                                                             (StandardModel
//                                                                 classItem) {
//                                                               return DropdownMenuItem(
//                                                                 value: classItem
//                                                                         .id ??
//                                                                     "dfdfd",
//                                                                 child: Text(classItem
//                                                                     .standard
//                                                                     .toString()),
//                                                               );
//                                                             },
//                                                           ).toList(),
//                                                           onChanged: (String?
//                                                               classValue) {
//                                                             log("STD ID:${classValue}");
//                                                             setState(() {
//                                                               planController
//                                                                       .dropClassValue =
//                                                                   classValue!;

//                                                               planController
//                                                                           .isLoading ==
//                                                                       true
//                                                                   ? Center(
//                                                                       child:
//                                                                           CircularProgressIndicator(),
//                                                                     )
//                                                                   : planController
//                                                                       .fetchPlanMediumData(
//                                                                           classValue);
//                                                             });
//                                                           }),
//                                                       const Gap(8),
//                                                       const Text(
//                                                         "Medium",
//                                                         style: TextStyle(
//                                                             fontSize: 14,
//                                                             fontWeight:
//                                                                 FontWeight.w600,
//                                                             color: ConstantColors
//                                                                 .headingBlue),
//                                                       ),
//                                                       const Gap(8),
//                                                       DropdownButton(
//                                                         hint: Text(
//                                                             "Select Medium"),
//                                                         value: planController
//                                                             .dropMediumValue,
//                                                         items: mediumList.map<
//                                                             DropdownMenuItem<
//                                                                 String>>(
//                                                           (MediumModel
//                                                               mediumItem) {
//                                                             return DropdownMenuItem(
//                                                               value:
//                                                                   mediumItem.id,
//                                                               child: Text(
//                                                                   mediumItem
//                                                                       .medium
//                                                                       .toString()),
//                                                             );
//                                                           },
//                                                         ).toList(),
//                                                         onChanged: (String?
//                                                             mediumValue) {
//                                                           setState(() {
//                                                             planController
//                                                                     .dropMediumValue =
//                                                                 mediumValue!;
//                                                           });
//                                                         },
//                                                       ),
//                                                       const Gap(16),
//                                                       ButtonWidget(
//                                                         buttonHeight: 42,
//                                                         buttonWidth:
//                                                             screenWidth,
//                                                         buttonColor:
//                                                             ConstantColors
//                                                                 .headingBlue,
//                                                         buttonText:
//                                                             "Choose My Plan",
//                                                         onPressed: () {
//                                                           Navigator.push(
//                                                             context,
//                                                             MaterialPageRoute(
//                                                               builder: (context) =>
//                                                                   SubscriptionScreen(
//                                                                       index:
//                                                                           selectedIndex),
//                                                             ),
//                                                           );
//                                                         },
//                                                       )
//                                                     ],
//                                                   ),
//                                                 ),
//                                               );
//                                             }),
//                                           ),
//                                         ),
//                                       ));
//                             },
//                           ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       );
//     });
//   }
// }
