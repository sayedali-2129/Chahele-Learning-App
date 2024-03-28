import 'dart:developer';

import 'package:chahele_project/model/medium_model.dart';
import 'package:chahele_project/model/plan_model.dart';
import 'package:chahele_project/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class PlanController with ChangeNotifier {
  final firebase = FirebaseFirestore.instance;
  UserModel? userList;

  String? dropClassValue;
  String? dropMediumValue;
  // List<PlanModel> planList = [];
  List<MediumModel> planMediumList = [];

  UserModel? userData;
  List<PlanModel> planList = [];

  bool isLoading = false;

  // void planField(
  //     {required Timestamp startDate,
  //     required Timestamp endDate,
  //     required int totalAmount,
  //     required int planDuration,
  //     required String userId,
  //     required String medium,
  //     required String standard}) {
  //   userDataList(startDate, endDate, totalAmount, planDuration, userId, medium,
  //       standard);

  //   userData = UserModel(purchasedPlans: planList);
  // }

  userDataList(
      {required Timestamp startDate,
      required Timestamp endDate,
      required int totalAmount,
      required int planDuration,
      required String userId,
      required String medium,
      required String standard}) {
    planList.add(PlanModel(
      id: const Uuid().v1(),
      medium: medium,
      standard: standard,
      medId: dropMediumValue,
      stdId: dropClassValue,
      totalAmount: totalAmount,
      startDate: startDate,
      endDate: endDate,
      planDuration: planDuration,
      userId: userId,
    ));
  }

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
    isLoading = true;
    notifyListeners();

    planMediumList.clear();

    final response =
        await firebase.collection('medium').where('stdId', isEqualTo: id).get();

    planMediumList.addAll(response.docs
        .map((e) => MediumModel.fromMap(e.data()).copyWith(id: e.id))
        .toList());

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
      final userData = await userDoc.get();

      List<dynamic> existingPurchaseDetails = userData['purchaseDetails'] ?? [];
      existingPurchaseDetails.add(planData);

      await userDoc.update({
        'purchaseDetails': existingPurchaseDetails,
      });
      onSuccess();

      isLoading = false;
      notifyListeners();
    } on FirebaseException catch (e) {
      log(e.code);
    }
  }
}




// planField(startDate: startDate,
//                        endDate:selectedPlan == 0
//                             ? Timestamp.fromMillisecondsSinceEpoch(
//                                 startDate.millisecondsSinceEpoch +
//                                     (30 * 24 * 60 * 60 * 1000))
//                             : Timestamp.fromMicrosecondsSinceEpoch(
//                                 startDate.millisecondsSinceEpoch +
//                                     (365 * 24 * 60 * 60 * 1000)), 
//                         totalAmount: planProvider.planList[widget.index].totalAmount!,
//                          planDuration: planProvider.planList[widget.index].planDuration!,
//                           userId: authProvider.firebaseAuth.currentUser!.uid,
//                            medium: planProvider.planList[widget.index].medium!,
//                             standard: planProvider.planList[widget.index].standard!,)