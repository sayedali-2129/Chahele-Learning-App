import 'dart:developer';

import 'package:chahele_project/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserProvider with ChangeNotifier {
  final fireBase = FirebaseFirestore.instance;
  final firebaseAuth = FirebaseAuth.instance;

  // String userUid = FirebaseAuth.instance.currentUser!.uid;

  bool isLoading = false;

  List<UserModel> userList = [];

//Userdetails Controllers
  final nameController = TextEditingController();
  final dobController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final ageController = TextEditingController();

  Future<void> addUserDetails(
      {required VoidCallback onSuccess,
      required VoidCallback onFailure,
      required UserModel userModel}) async {
    isLoading = true;
    notifyListeners();
    try {
      await fireBase
          .collection('users')
          .doc(userModel.id)
          .set(userModel.toMap());

      // userList.add(userModel.copyWith(id: userModel.id));
      onSuccess();
      isLoading = false;
      notifyListeners();
    } on FirebaseException catch (e) {
      log(e.message.toString());
    }
  }

  void clearFields() {
    nameController.clear();
    dobController.clear();
    phoneNumberController.clear();
    emailController.clear();
    ageController.clear();
  }

  // Future<void> fetchUser() async {
  //   final responce = await fireBase.collection('users').get();

  //   userList = responce.docs
  //       .map((e) => UserModel.fromMap(e.data()).copyWith(id: e.id))
  //       .toList();
  // }

  Future<UserModel?> getUserDetails() async {
    try {
      User? user = firebaseAuth.currentUser;

      if (user == null) {
        return null;
      }

      final snapshot = await fireBase
          .collection('users')
          .where("id", isEqualTo: user.uid)
          .limit(1)
          .get();

      if (snapshot.docs.isEmpty) {
        return null;
      }

      final userData = snapshot.docs
          .map((e) => UserModel.fromMap(e.data()).copyWith(id: e.id))
          .single;

      return userData;
    } catch (e) {
      print("Error fetching user details: $e");
      return null;
    }
  }
}
