class SubjectModel {
  String subject;
  String image;
  String? id;
  SubjectModel({
    required this.subject,
    required this.image,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'subject': subject,
      'image': image,
      'id': id,
    };
  }

  factory SubjectModel.fromMap(Map<String, dynamic> map) {
    return SubjectModel(
      subject: map['subject'] as String,
      image: map['image'] as String,
      id: map['id'] != null ? map['id'] as String : null,
    );
  }

  SubjectModel copyWith({
    String? subject,
    String? image,
    String? id,
  }) {
    return SubjectModel(
      subject: subject ?? this.subject,
      image: image ?? this.image,
      id: id ?? this.id,
    );
  }
}
