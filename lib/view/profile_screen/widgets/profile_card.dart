import 'package:chahele_project/utils/constant_colors/constant_colors.dart';
import 'package:chahele_project/utils/constant_icons/constant_icons.dart';
import 'package:chahele_project/utils/constant_images/constant_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.name,
    required this.emailID,
    this.onTapEdit,
  });
  final String name;
  final String emailID;
  final void Function()? onTapEdit;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      elevation: 5,
      color: ConstantColors.mainBlueTheme,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //User Image
            Container(
              height: 60,
              width: 60,
              decoration: const BoxDecoration(
                  color: ConstantColors.white, shape: BoxShape.circle),
              child: SvgPicture.asset(ConstantImage.imageAvathar),
            ),
            const Gap(10),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Name & Email
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: ConstantColors.white),
                      ),
                      Text(
                        emailID,
                        style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: ConstantColors.white),
                      )
                    ],
                  ),

                  //Edit Button
                  GestureDetector(
                    onTap: onTapEdit,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          ConstantIcons.editIcon,
                          height: 21,
                          width: 21,
                        ),
                        const Gap(8),
                        const Text(
                          "Edit",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: ConstantColors.white),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
