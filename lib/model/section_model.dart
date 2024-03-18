class SectionModel {
  String? id;
  String sectionName;
  String description;
  String videoUrl;
  String pdfUrl;
  String stdId;
  String medId;
  String subId;
  String chapterId;
  SectionModel({
    this.id,
    required this.sectionName,
    required this.description,
    required this.videoUrl,
    required this.pdfUrl,
    required this.stdId,
    required this.medId,
    required this.subId,
    required this.chapterId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'sectionName': sectionName,
      'description': description,
      'videoUrl': videoUrl,
      'pdfUrl': pdfUrl,
      'stdId': stdId,
      'medId': medId,
      'subId': subId,
      'chapterId': chapterId,
    };
  }

  factory SectionModel.fromMap(Map<String, dynamic> map) {
    return SectionModel(
      id: map['id'] != null ? map['id'] as String : null,
      sectionName: map['sectionName'] as String,
      description: map['description'] as String,
      videoUrl: map['videoUrl'] as String,
      pdfUrl: map['pdfUrl'] as String,
      stdId: map['stdId'] as String,
      medId: map['medId'] as String,
      subId: map['subId'] as String,
      chapterId: map['chapterId'] as String,
    );
  }

  SectionModel copyWith({
    String? id,
    String? sectionName,
    String? description,
    String? videoUrl,
    String? pdfUrl,
    String? stdId,
    String? medId,
    String? subId,
    String? chapterId,
  }) {
    return SectionModel(
      id: id ?? this.id,
      sectionName: sectionName ?? this.sectionName,
      description: description ?? this.description,
      videoUrl: videoUrl ?? this.videoUrl,
      pdfUrl: pdfUrl ?? this.pdfUrl,
      stdId: stdId ?? this.stdId,
      medId: medId ?? this.medId,
      subId: subId ?? this.subId,
      chapterId: chapterId ?? this.chapterId,
    );
  }
}
