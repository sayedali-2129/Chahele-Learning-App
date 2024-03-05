class StandardModel {
  String standard;
  String image;
  String? id;
  StandardModel({
    required this.standard,
    required this.image,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'standard': standard,
      'image': image,
      'id': id,
    };
  }

  factory StandardModel.fromMap(Map<String, dynamic> map) {
    return StandardModel(
      standard: map['standard'] as String,
      image: map['image'] as String,
      id: map['id'] != null ? map['id'] as String : null,
    );
  }

  StandardModel copyWith({
    String? standard,
    String? image,
    String? id,
  }) {
    return StandardModel(
      standard: standard ?? this.standard,
      image: image ?? this.image,
      id: id ?? this.id,
    );
  }
}
