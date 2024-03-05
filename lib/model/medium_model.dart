class MediumModel {
  String medium;
  String image;
  String? id;
  MediumModel({
    required this.medium,
    required this.image,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'medium': medium,
      'image': image,
      'id': id,
    };
  }

  factory MediumModel.fromMap(Map<String, dynamic> map) {
    return MediumModel(
      medium: map['medium'] as String,
      image: map['image'] as String,
      id: map['id'] != null ? map['id'] as String : null,
    );
  }

  MediumModel copyWith({
    String? medium,
    String? image,
    String? id,
  }) {
    return MediumModel(
      medium: medium ?? this.medium,
      image: image ?? this.image,
      id: id ?? this.id,
    );
  }
}
