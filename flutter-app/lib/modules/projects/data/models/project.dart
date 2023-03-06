// Create Project model class that extends Equatable and have JsonSerializable methods to convert Project model to json and vice versa
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../utils/json_converters/firestore/firestore_document_reference_converter.dart';
import '../../../../utils/json_converters/firestore/firestore_timestamp_date_time_converter.dart';
import 'project_user.dart';

part 'project.g.dart';

@JsonSerializable(explicitToJson: true)
class Project extends Equatable {
  @JsonKey(includeToJson: false)
  final String? id;
  final String name;
  final String? description;
  final List<ProjectUser> users;
  @FirestoreTimestampDateTimeConverter()
  final DateTime createdAt;
  @FirestoreDocumentReferenceConverter()
  final DocumentReference<Map<String, dynamic>> createdBy;
  @FirestoreTimestampDateTimeConverter()
  final DateTime updatedAt;
  @FirestoreDocumentReferenceConverter()
  final DocumentReference<Map<String, dynamic>> updatedBy;

  const Project({
    this.id,
    required this.name,
    this.description,
    required this.users,
    required this.createdAt,
    required this.createdBy,
    required this.updatedAt,
    required this.updatedBy,
  });

  factory Project.fromFirestore(Map<String, dynamic> json, {String? id}) {
    return _$ProjectFromJson({'id': id, ...json});
  }

  Map<String, dynamic> toJson() => _$ProjectToJson(this);

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        users,
        createdAt,
        createdBy,
        updatedAt,
        updatedBy,
      ];
}
