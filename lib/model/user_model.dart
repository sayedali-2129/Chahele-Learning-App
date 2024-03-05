class UserModel {
  String name;
  String phoneNumber;
  String dob;
  String email;
  String age;
  String? id;
  String image;
  UserModel({
    required this.name,
    required this.phoneNumber,
    required this.dob,
    required this.email,
    required this.age,
    this.id,
    required this.image,
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
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      phoneNumber: map['phoneNumber'] as String,
      dob: map['dob'] as String,
      email: map['email'] as String,
      age: map['age'] as String,
      id: map['id'] != null ? map['id'] as String : null,
      image: map['image'] as String,
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
  }) {
    return UserModel(
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      dob: dob ?? this.dob,
      email: email ?? this.email,
      age: age ?? this.age,
      id: id ?? this.id,
      image: image ?? this.image,
    );
  }
}
