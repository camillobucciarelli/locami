// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

class TimeOfDayJsonConverter implements JsonConverter<TimeOfDay, String> {
  const TimeOfDayJsonConverter();

  @override
  TimeOfDay fromJson(String json) {
    return TimeOfDay.fromDateTime(DateFormat('HH:mm').parse(json));
  }

  @override
  String toJson(TimeOfDay object) {
    return DateFormat('HH:mm').format(DateTime(0, 1, 1, object.hour, object.minute, 0, 0, 0));
  }
}
