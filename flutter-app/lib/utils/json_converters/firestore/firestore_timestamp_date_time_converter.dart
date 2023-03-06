// 📦 Package imports:
import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreTimestampDateTimeConverter implements JsonConverter<DateTime, Timestamp> {
  const FirestoreTimestampDateTimeConverter();

  @override
  DateTime fromJson(Timestamp timestamp) {
    return timestamp.toDate().toUtc();
  }

  @override
  Timestamp toJson(DateTime date) {
    return Timestamp.fromDate(date.toUtc());
  }
}
