import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl_phone_field/phone_number.dart';

class AuthenticationProvider with ChangeNotifier {
  //Firebase Auth Instance
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

//Loading
  bool isLoading = false;
//country code with number
  String? selectedCode;

  //Current User
  User? currentUser = FirebaseAuth.instance.currentUser;

//onChanged function country code
  void countryCode(PhoneNumber code) {
    selectedCode = code.countryCode;

    notifyListeners();
  }

//Login
  Future<void> login({
    required String phoneNumber,
    required VoidCallback onFailure,
    required void Function(String) onSuccess,
  }) async {
    isLoading = true;
    notifyListeners();
    try {
      await firebaseAuth
          .verifyPhoneNumber(
              phoneNumber: phoneNumber,
              verificationCompleted: (phoneAuthCredential) {},
              verificationFailed: (error) {
                isLoading = false;
                notifyListeners();
                onFailure();
              },
              codeSent: (verificationId, forceResendingToken) {
                isLoading = false;
                notifyListeners();
                onSuccess(verificationId);
              },
              codeAutoRetrievalTimeout: (verificationId) {})
          .onError((error, stackTrace) {
        onFailure();
      });
      isLoading = false;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      isLoading = false;
      notifyListeners();
      onFailure();
      log(e.message!);
    }
  }

//Otp
  Future<void> verifyOtp({
    required void Function(String) onSuccess,
    required VoidCallback onFailure,
    required String verificationId,
    required String otpCode,
  }) async {
    isLoading = true;
    notifyListeners();
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otpCode);

      await firebaseAuth.signInWithCredential(credential);

      onSuccess(verificationId);
      isLoading = false;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      log(e.message!);
      onFailure();
    }
  }

  Future<void> logOutUser() async {
    await firebaseAuth.signOut();
  }

  // Future<void> deleteUser() async {
  //   User? user = firebaseAuth.currentUser;

  //   try {
  //     if (user != null) {
  //       await user.delete();
  //       user = currentUser;
  //       log("User Deleted");
  //     } else {
  //       log("no user signed");
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     log(e.code.toString());
  //   }
  // }

  Future<void> checkUserexist(
      {required VoidCallback onExist, VoidCallback? onNewUser}) async {
    User? user = firebaseAuth.currentUser;

    if (user != null) {
      DocumentSnapshot userSnapshot =
          await firebaseFirestore.collection('users').doc(user.uid).get();

      if (userSnapshot.exists) {
        onExist();
      } else {
        onNewUser!();
      }
    }
  }
}
