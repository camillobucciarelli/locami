// 📦 Package imports:
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

class DateTimeIsoJsonConverter implements JsonConverter<DateTime, String> {
  const DateTimeIsoJsonConverter();

  @override
  DateTime fromJson(String json) {
    return DateFormat('yyyy-MM-ddTHH:mm:ss').parse(json, true).toLocal();
  }

  @override
  String toJson(DateTime object) {
    return object.toUtc().toIso8601String();
  }
}
