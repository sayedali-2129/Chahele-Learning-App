import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class SectionModel {
  String? id;
  String sectionName;
  String description;
  String videoUrl;
  String pdfUrl;
  SectionModel({
    this.id,
    required this.sectionName,
    required this.description,
    required this.videoUrl,
    required this.pdfUrl,
  });

  SectionModel copyWith({
    String? id,
    String? sectionName,
    String? description,
    String? videoUrl,
    String? pdfUrl,
  }) {
    return SectionModel(
      id: id ?? this.id,
      sectionName: sectionName ?? this.sectionName,
      description: description ?? this.description,
      videoUrl: videoUrl ?? this.videoUrl,
      pdfUrl: pdfUrl ?? this.pdfUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'sectionName': sectionName,
      'description': description,
      'videoUrl': videoUrl,
      'pdfUrl': pdfUrl,
    };
  }

  factory SectionModel.fromMap(Map<String, dynamic> map) {
    return SectionModel(
      id: map['id'] != null ? map['id'] as String : null,
      sectionName: map['sectionName'] as String,
      description: map['description'] as String,
      videoUrl: map['videoUrl'] as String,
      pdfUrl: map['pdfUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SectionModel.fromJson(String source) =>
      SectionModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
