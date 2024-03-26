import 'package:cloud_firestore/cloud_firestore.dart';

class PlanModel {
  String? id;
  String? userId;
  String? stdId;
  String? medId;
  String? standard;
  String? medium;
  int? planDuration;
  int? totalAmount;
  String? guardianName;
  String? schoolName;
  Timestamp? startDate;
  Timestamp? endDate;
  PlanModel({
    this.id,
    this.userId,
    this.stdId,
    this.medId,
    this.standard,
    this.medium,
    this.planDuration,
    this.totalAmount,
    this.guardianName,
    this.schoolName,
    this.startDate,
    this.endDate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'stdId': stdId,
      'medId': medId,
      'standard': standard,
      'medium': medium,
      'planDuration': planDuration,
      'totalAmount': totalAmount,
      'guardianName': guardianName,
      'schoolName': schoolName,
      'startDate': startDate,
      'endDate': endDate,
    };
  }

  factory PlanModel.fromMap(Map<String, dynamic> map) {
    return PlanModel(
      id: map['id'] != null ? map['id'] as String : null,
      userId: map['userId'] != null ? map['userId'] as String : null,
      stdId: map['stdId'] != null ? map['stdId'] as String : null,
      medId: map['medId'] != null ? map['medId'] as String : null,
      standard: map['standard'] != null ? map['standard'] as String : null,
      medium: map['medium'] != null ? map['medium'] as String : null,
      planDuration:
          map['planDuration'] != null ? map['planDuration'] as int : null,
      totalAmount:
          map['totalAmount'] != null ? map['totalAmount'] as int : null,
      guardianName:
          map['guardianName'] != null ? map['guardianName'] as String : null,
      schoolName:
          map['schoolName'] != null ? map['schoolName'] as String : null,
      startDate:
          map['startDate'] != null ? map['startDate'] as Timestamp : null,
      endDate: map['endDate'] != null ? map['endDate'] as Timestamp : null,
    );
  }

  PlanModel copyWith({
    String? id,
    String? userId,
    String? stdId,
    String? medId,
    String? standard,
    String? medium,
    int? planDuration,
    int? totalAmount,
    String? guardianName,
    String? schoolName,
    Timestamp? startDate,
    Timestamp? endDate,
  }) {
    return PlanModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      stdId: stdId ?? this.stdId,
      medId: medId ?? this.medId,
      standard: standard ?? this.standard,
      medium: medium ?? this.medium,
      planDuration: planDuration ?? this.planDuration,
      totalAmount: totalAmount ?? this.totalAmount,
      guardianName: guardianName ?? this.guardianName,
      schoolName: schoolName ?? this.schoolName,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }
}
