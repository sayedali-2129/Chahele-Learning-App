import 'dart:developer';

import 'package:chahele_project/model/medium_model.dart';
import 'package:chahele_project/model/plan_model.dart';
import 'package:chahele_project/model/user_plan_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PlanController with ChangeNotifier {
  final firebase = FirebaseFirestore.instance;

  String? dropClassValue;
  String? dropMediumValue;
  // List<PlanModel> planList = [];
  List<MediumModel> planMediumList = [];

  UserPlanModel? userData;
  List<PlanModel> planList = [];

  bool isLoading = false;

  Future<void> fetchPlanDetails(
      {required String stdId, required String medId}) async {
    final responce = await firebase
        .collection('plan')
        .where(
          Filter.and(
            Filter('stdId', isEqualTo: stdId),
            Filter('medId', isEqualTo: medId),
          ),
        )
        .get();

    planList = responce.docs
        .map((e) => PlanModel.fromMap(e.data()).copyWith(id: e.id))
        .toList();
    notifyListeners();
  }

  Future<void> fetchPlanMediumData(String id) async {
    log("PLAN LIST:${planMediumList.length}");
    isLoading = true;
    notifyListeners();

    final response =
        await firebase.collection('medium').where('stdId', isEqualTo: id).get();

    planMediumList = response.docs
        .map((e) => MediumModel.fromMap(e.data()).copyWith(id: e.id))
        .toList();

    isLoading = false;
    notifyListeners();
  }

  //Purchase Plan
  Future<void> purchasePlanUser({
    required String userId,
    required PlanModel purchasedPlan,
    required VoidCallback onSuccess,
  }) async {
    try {
      isLoading = true;
      notifyListeners();

      Map<String, dynamic> planData = purchasedPlan.toMap();

      final userDoc = firebase.collection('users').doc(userId);

      await userDoc.update({
        'purchaseDetails': FieldValue.arrayUnion([planData]),
        'currentDate': FieldValue.serverTimestamp()
      });

      onSuccess();

      isLoading = false;
      notifyListeners();
    } on FirebaseException catch (e) {
      log(e.message.toString());
    }
  }

  Future<void> fetchUserPlans(String userId) async {
    final response = await firebase.collection('users').doc(userId).get();

    userData =
        UserPlanModel.fromMap(response.data()!).copyWith(id: response.id);

    notifyListeners();
  }
}
