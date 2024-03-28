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
    );
  }

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
    );
  }
}
