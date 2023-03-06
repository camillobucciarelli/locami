import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../utils/json_converters/firestore/firestore_timestamp_date_time_converter.dart';


part 'application_user.g.dart';

@JsonSerializable(explicitToJson: true)
class ApplicationUser extends Equatable {
  @JsonKey(includeToJson: false)
  final String uid;
  final String? firstName;
  final String? lastName;
  final String email;
  final bool disabled;
  @FirestoreTimestampDateTimeConverter()
  final DateTime createdAt;

  const  ApplicationUser({
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.disabled,
    required this.createdAt,
  });

  factory ApplicationUser.fromJson(Map<String, dynamic> json, {required String id}) {
    return _$ApplicationUserFromJson({'uid': id, ...json});
  }

  Map<String, dynamic> toJson() => _$ApplicationUserToJson(this);

  @override
  List<Object?> get props => [
        uid,
        firstName,
        lastName,
        email,
        disabled,
        createdAt,
      ];
}
