import 'package:chahele_project/model/chapter_model.dart';
import 'package:chahele_project/model/medium_model.dart';
import 'package:chahele_project/model/section_model.dart';
import 'package:chahele_project/model/standard_model.dart';
import 'package:chahele_project/model/subject_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CourseProvider with ChangeNotifier {
  final firebase = FirebaseFirestore.instance;
  List<StandardModel> standardsList = [];
  List<MediumModel> mediumList = [];
  List<SubjectModel> subjectList = [];
  List<ChapterModel> chapterList = [];
  List<SectionModel> sectionList = [];
  bool isLoading = false;

//Standard Fetch
  Future<void> fetchStandards() async {
    isLoading = true;
    notifyListeners();
    final responce = await firebase.collection('standards').get();

    standardsList = responce.docs
        .map((e) => StandardModel.fromMap(e.data()).copyWith(id: e.id))
        .toList();
    isLoading = false;
    notifyListeners();
  }

//Fetch Medium
  Future<void> fetchMediumData(String id) async {
    isLoading = true;
    notifyListeners();
    final responce =
        await firebase.collection('medium').where('id', isEqualTo: id).get();

    mediumList = responce.docs
        .map((e) => MediumModel.fromMap(e.data()).copyWith(id: e.id))
        .toList();
    isLoading = false;
    notifyListeners();
  }

  //Fetch Subjects
  Future<void> fetchSubjects() async {
    isLoading = true;
    notifyListeners();

    final responce = await firebase.collection('subjects').get();

    subjectList = responce.docs
        .map((e) => SubjectModel.fromMap(e.data()).copyWith(id: e.id))
        .toList();

    isLoading = false;
    notifyListeners();
  }

//fetch chapter
  Future<void> fetchChapter() async {
    isLoading = true;
    notifyListeners();

    final responce = await firebase.collection('chapter').get();

    chapterList = responce.docs
        .map((e) => ChapterModel.fromMap(e.data()).copyWith(id: e.id))
        .toList();

    isLoading = false;
    notifyListeners();
  }

  //fetch Sections

  Future<void> fetchSections() async {
    isLoading = true;
    notifyListeners();

    final responce = await firebase.collection('sections').get();

    sectionList = responce.docs
        .map((e) => SectionModel.fromMap(e.data()).copyWith(id: e.id))
        .toList();

    isLoading = false;
    notifyListeners();
  }

  // Future<void> pdfDownload(
  //     {required String fileName,
  //     required String fileUrl,
  //     required VoidCallback onSuccess,
  //     required VoidCallback onFailure}) async {
  //   isLoading = true;
  //   notifyListeners();

  //   var status = await Permission.storage.request();

  //   if (status.isGranted) {
  //     const downloadPath = '/storage/emulated/0/Download/';
  //     Directory directory = Directory(downloadPath);
  //     final file = File("${directory.path}/$fileName");

  //     try {
  //       await Dio().download(fileUrl, file);
  //       onSuccess();
  //     } on DioException catch (e) {
  //       onFailure();
  //       log(e.message.toString());
  //     } finally {
  //       isLoading = false;
  //       notifyListeners();
  //     }
  //   } else {
  //     onFailure();
  //     isLoading = false;
  //     notifyListeners();
  //   }
  // }
}
