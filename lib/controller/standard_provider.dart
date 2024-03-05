import 'package:chahele_project/model/medium_model.dart';
import 'package:chahele_project/model/standard_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StandardProvider with ChangeNotifier {
  final firebase = FirebaseFirestore.instance;
  List<StandardModel> standardsList = [];
  List<MediumModel> mediumList = [];
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
  Future<void> fetchMediumData() async {
    isLoading = true;
    notifyListeners();
    final responce = await firebase.collection('medium').get();

    mediumList = responce.docs
        .map((e) => MediumModel.fromMap(e.data()).copyWith(id: e.id))
        .toList();
    isLoading = false;
    notifyListeners();
  }
}
