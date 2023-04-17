import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../utils/json_converters/firestore/firestore_document_reference_converter.dart';
import '../../../user/data/models/application_user.dart';
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

  Future<ApplicationUser> get user async {
    final doc = await ref.get();
    final data = doc.data();
    if(!doc.exists || data == null) {
      throw Exception('User not found');
    }

    return ApplicationUser.fromJson(data, id: doc.id);
  }

  @override
  List<Object?> get props => [
        ref,
        role,
      ];
}
