import 'dart:developer';

import 'package:chahele_project/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserProvider with ChangeNotifier {
  final fireBase = FirebaseFirestore.instance;

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
      final responce =
          await fireBase.collection('users').add(userModel.toMap());

      userList.insert(0, userModel.copyWith(id: responce.id));
      onSuccess();
      isLoading = false;
      notifyListeners();
    } on FirebaseException catch (e) {
      log(e.message.toString());
    }
  }
}
