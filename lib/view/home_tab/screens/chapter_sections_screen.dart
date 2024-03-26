import 'dart:developer';

import 'package:chahele_project/controller/course_provider.dart';
import 'package:chahele_project/utils/constant_colors/constant_colors.dart';
import 'package:chahele_project/utils/constant_icons/constant_icons.dart';
import 'package:chahele_project/view/exam_tab/screens/terms_and_conditions.dart';
import 'package:chahele_project/view/home_tab/screens/video_player_screen.dart';
import 'package:chahele_project/widgets/button_widget.dart';
import 'package:chahele_project/widgets/cached_network_image.dart';
import 'package:chahele_project/widgets/custom_toast.dart';
import 'package:chahele_project/widgets/heading_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SectionsScreen extends StatefulWidget {
  const SectionsScreen({super.key, required this.index, required this.id});
  final int index;
  final String id;

  @override
  State<SectionsScreen> createState() => _SectionsScreenState();
}

class _SectionsScreenState extends State<SectionsScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<CourseProvider>(context, listen: false)
          .fetchSections(widget.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final sectionProvider = Provider.of<CourseProvider>(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          HeadingAppBar(
              heading: sectionProvider.chapterList[widget.index].chapter,
              isBackButtomn: true),
          SliverSkeletonizer(
            enabled: sectionProvider.isLoading == true,
            child: SliverList.builder(
                itemCount: sectionProvider.sectionList.length,
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(16),
                      child: SizedBox(
                        width: screenWidth,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //Section Name
                            Text(
                              "${index + 1} - ${sectionProvider.sectionList[index].sectionName}",
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: ConstantColors.headingBlue),
                            ),
                            const Gap(16),
                            //Video
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => VideoPlayerScreen(
                                        videoUrl: sectionProvider
                                            .sectionList[index].videoUrl,
                                        sectionName: sectionProvider
                                            .sectionList[index].sectionName),
                                  ),
                                );
                              },
                              child: Container(
                                clipBehavior: Clip.antiAlias,
                                height: 200,
                                width: screenWidth,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Stack(
                                  fit: StackFit.expand,
                                  alignment: Alignment.center,
                                  children: [
                                    Opacity(
                                      opacity: 0.7,
                                      child: CustomCachedNetworkImage(
                                        image: sectionProvider
                                            .sectionList[index].image,
                                      ),
                                    ),
                                    Center(
                                      child: SvgPicture.asset(
                                        ConstantIcons.playIconSvg,
                                        height: 50,
                                        width: 50,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Gap(16),
                            //Description
                            Text(
                              sectionProvider.sectionList[index].description,
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: ConstantColors.black.withOpacity(0.7)),
                            ),
                            const Gap(16),
                            //Exam Page
                            ButtonWidget(
                              buttonHeight: 42,
                              buttonWidth: screenWidth,
                              buttonColor: ConstantColors.headingBlue,
                              buttonText: "Go To Exam Page",
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ExamTandCScreen(
                                      sectionId:
                                          sectionProvider.sectionList[index].id,
                                      index: index,
                                    ),
                                  ),
                                );
                              },
                            ),

                            const Gap(16),
                            ButtonWidget(
                              buttonHeight: 42,
                              buttonWidth: screenWidth,
                              buttonColor: ConstantColors.mainBlueTheme,
                              buttonText: "Download PDF",
                              onPressed: () async {
                                downloadPdf(
                                    sectionProvider.sectionList[index].pdfUrl,
                                    sectionProvider
                                        .sectionList[index].sectionName);
                              },
                            ),
                          ],
                        ),
                      ),
                    )),
          )
        ],
      ),
    );
  }

  void downloadPdf(String pdfUrl, String fileName) async {
    var status = await Permission.storage.request();

    if (status.isGranted) {
      FileDownloader.downloadFile(
          url: pdfUrl,
          name: fileName,
          onDownloadCompleted: (path) {
            successToast(context, "Download Completed");
          },
          onDownloadError: (errorMessage) {
            successToast(context, "Something went wrong");
          },
          notificationType: NotificationType.all);
    } else {
      log("permission not granted");
    }
  }
}
