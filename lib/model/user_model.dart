// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:chahele_project/model/plan_model.dart';

class UserModel {
  String name;
  String phoneNumber;
  String dob;
  String email;
  String age;
  String id;
  String image;
  String? guardianName;
  String? schoolName;
  bool? isUserActive = true;
  List<PlanModel>? purchaseDetails;
  UserModel({
    required this.name,
    required this.phoneNumber,
    required this.dob,
    required this.email,
    required this.age,
    required this.id,
    required this.image,
    this.guardianName,
    this.schoolName,
    this.isUserActive,
    this.purchaseDetails,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'phoneNumber': phoneNumber,
      'dob': dob,
      'email': email,
      'age': age,
      'id': id,
      'image': image,
      'guardianName': guardianName,
      'schoolName': schoolName,
      'isUserActive': isUserActive,
      'purchaseDetails': purchaseDetails
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      phoneNumber: map['phoneNumber'] as String,
      dob: map['dob'] as String,
      email: map['email'] as String,
      age: map['age'] as String,
      id: map['id'] as String,
      image: map['image'] as String,
      guardianName:
          map['guardianName'] != null ? map['guardianName'] as String : null,
      schoolName:
          map['schoolName'] != null ? map['schoolName'] as String : null,
      isUserActive:
          map['isUserActive'] != null ? map['isUserActive'] as bool : null,
      purchaseDetails: map['purchaseDetails'] != null
          ? List<PlanModel>.from(
              (map['purchaseDetails'] as List<dynamic>).map<PlanModel?>(
                (x) => PlanModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  UserModel copyWith({
    String? name,
    String? phoneNumber,
    String? dob,
    String? email,
    String? age,
    String? id,
    String? image,
    String? guardianName,
    String? schoolName,
    bool? isUserActive,
    List<PlanModel>? purchaseDetails,
  }) {
    return UserModel(
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      dob: dob ?? this.dob,
      email: email ?? this.email,
      age: age ?? this.age,
      id: id ?? this.id,
      image: image ?? this.image,
      guardianName: guardianName ?? this.guardianName,
      schoolName: schoolName ?? this.schoolName,
      isUserActive: isUserActive ?? this.isUserActive,
      purchaseDetails: purchaseDetails ?? this.purchaseDetails,
    );
  }
}
