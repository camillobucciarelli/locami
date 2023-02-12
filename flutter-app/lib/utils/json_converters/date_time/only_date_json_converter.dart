// 📦 Package imports:
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

class OnlyDateJsonConverter implements JsonConverter<DateTime, String> {
  const OnlyDateJsonConverter();

  @override
  DateTime fromJson(String json) {
    return DateFormat('yyyy-MM-dd').parse(json);
  }

  @override
  String toJson(DateTime object) {
    return DateFormat('yyyy-MM-dd').format(object);
  }
}
