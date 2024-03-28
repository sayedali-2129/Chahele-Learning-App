import 'package:chahele_project/controller/authentication_provider.dart';
import 'package:chahele_project/controller/plan_controller.dart';
import 'package:chahele_project/view/authentication_screens/login_screen.dart';
import 'package:chahele_project/view/choose_tab/widgets/selected_plan.dart';
import 'package:chahele_project/view/profile_tab/widgets/profile_card.dart';
import 'package:chahele_project/widgets/heading_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({super.key});

  @override
  State<MyAccountScreen> createState() => _ChooseScreenState();
}

class _ChooseScreenState extends State<MyAccountScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final authProvider = Provider.of<AuthenticationProvider>(context);
    final planController = Provider.of<PlanController>(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const HeadingAppBar(heading: "My Account", isBackButtomn: true),
          SliverPadding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            sliver: authProvider.firebaseAuth.currentUser == null
                ? SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        child: const ContinueToLoginCont(
                            content: "Please Login to choose your plan"),
                      ),
                    ),
                  )
                : SliverList.separated(
                    separatorBuilder: (context, index) => const Gap(8),
                    itemCount: planController.userData!.purchaseDetails!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: SelectedPlanContainer(
                          schoolName: planController.userData!.schoolName!,
                          standard: planController
                              .userData!.purchaseDetails![index].standard!,
                          medium: planController
                              .userData!.purchaseDetails![index].medium!,
                          screenWidth: screenWidth,
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
