class ChapterModel {
  String chapter;
  String about;
  String? id;
  String stdId;
  String medId;
  String subId;
  int chapterNumber;
  ChapterModel({
    required this.chapter,
    required this.about,
    this.id,
    required this.stdId,
    required this.medId,
    required this.subId,
    required this.chapterNumber,
  });

  ChapterModel copyWith({
    String? chapter,
    String? about,
    String? id,
    String? stdId,
    String? medId,
    String? subId,
    int? chapterNumber,
  }) {
    return ChapterModel(
      chapter: chapter ?? this.chapter,
      about: about ?? this.about,
      id: id ?? this.id,
      stdId: stdId ?? this.stdId,
      medId: medId ?? this.medId,
      subId: subId ?? this.subId,
      chapterNumber: chapterNumber ?? this.chapterNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'chapter': chapter,
      'about': about,
      'id': id,
      'stdId': stdId,
      'medId': medId,
      'subId': subId,
      'chapterNumber': chapterNumber,
    };
  }

  factory ChapterModel.fromMap(Map<String, dynamic> map) {
    return ChapterModel(
      chapter: map['chapter'] as String,
      about: map['about'] as String,
      id: map['id'] != null ? map['id'] as String : null,
      stdId: map['stdId'] as String,
      medId: map['medId'] as String,
      subId: map['subId'] as String,
      chapterNumber: map['chapterNumber'] as int,
    );
  }
}
