class ChapterModel {
  String chapterName;
  String description;
  String? id;
  ChapterModel({
    required this.chapterName,
    required this.description,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'chapter': chapterName,
      'description': description,
      'id': id,
    };
  }

  factory ChapterModel.fromMap(Map<String, dynamic> map) {
    return ChapterModel(
      chapterName: map['chapter'] as String,
      description: map['description'] as String,
      id: map['id'] != null ? map['id'] as String : null,
    );
  }

  ChapterModel copyWith({
    String? chapterName,
    String? description,
    String? id,
  }) {
    return ChapterModel(
      chapterName: chapterName ?? this.chapterName,
      description: description ?? this.description,
      id: id ?? this.id,
    );
  }
}
