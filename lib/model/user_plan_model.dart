import 'package:chahele_project/model/plan_model.dart';

class UserPlanModel {
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
  List<PlanModel>? purchasedPlans;
  UserPlanModel({
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
    this.purchasedPlans,
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
      'purchasedPlans': purchasedPlans != null
          ? UserPlanModel.listToMapofMap(purchasedPlans!)
          : null,
    };
  }

  factory UserPlanModel.fromMap(Map<String, dynamic> map) {
    return UserPlanModel(
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
          map['isUserActive'] != null ? map['isUserActive'] == 'true' : null,
      purchasedPlans: map['purchasedPlans'] != null
          ? mapToListofPlanModel(extractData(map['purchasedPlans']))
          : null,
    );
  }

  UserPlanModel copyWith({
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
    List<PlanModel>? purchasedPlans,
  }) {
    return UserPlanModel(
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
      purchasedPlans: purchasedPlans ?? this.purchasedPlans,
    );
  }

//List to map of Map
  static Map<String, Map<String, dynamic>> listToMapofMap(
      List<PlanModel> planList) {
    Map<String, Map<String, dynamic>> resultMap = {};
    for (PlanModel plan in planList) {
      resultMap[plan.id!] = plan.toMap();
    }
    return resultMap;
  }

  //Map of map to list
  static List<PlanModel> mapToListofPlanModel(
      Map<String, Map<String, dynamic>> map) {
    List<PlanModel> resultList = [];

    map.entries.forEach((entry) {
      String planId = entry.key;
      Map<String, dynamic> planData = entry.value;

      PlanModel planModel = PlanModel(
        id: planData['id'],
        endDate: planData['endDate'],
        isActive: planData['isActive'],
        medId: planData['medId'],
        stdId: planData['stdId'],
        medium: planData['medium'],
        standard: planData['standard'],
        planDuration: planData['planDuration'],
        startDate: planData['startDate'],
        totalAmount: planData['totalAmount'],
        userId: planData['userId'],
      );

      resultList.add(planModel);
    });
    return resultList;
  }

//FIRESTORE DATA CONVERT TO TYPE MAP<STRING,MAP<STRING,DYNAMIC>>
  static Map<String, Map<String, dynamic>> extractData(
      Map<String, dynamic> data) {
    Map<String, Map<String, dynamic>> resultMap = {};

    data.forEach((key, value) {
      resultMap[key] = Map<String, dynamic>.from(value);
    });

    return resultMap;
  }
}
