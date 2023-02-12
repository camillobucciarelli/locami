// 📦 Package imports:
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

class NullableDateTimeIsoJsonConverter implements JsonConverter<DateTime?, String?> {
  const NullableDateTimeIsoJsonConverter();

  @override
  DateTime? fromJson(String? json) {
    if (json != null) {
      return DateFormat('yyyy-MM-ddTHH:mm:ss').parse(json, true).toLocal();
    }

    return null;
  }

  @override
  String? toJson(DateTime? object) {
    if (object != null) {
      return object.toUtc().toIso8601String();
    }

    return null;
  }
}
