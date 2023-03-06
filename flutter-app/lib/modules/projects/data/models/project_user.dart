import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../utils/json_converters/firestore/firestore_document_reference_converter.dart';
import 'user_roles.dart';

part 'project_user.g.dart';

@JsonSerializable(explicitToJson: true)
class ProjectUser extends Equatable {
  @FirestoreDocumentReferenceConverter()
  final DocumentReference<Map<String, dynamic>> ref;
  final UserRoles role;

  const ProjectUser({
    required this.ref,
    required this.role,
  });

  factory ProjectUser.fromJson(Map<String, dynamic> json) => _$ProjectUserFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectUserToJson(this);

  @override
  List<Object?> get props => [
        ref,
        role,
      ];
}
