extension DateTimeExtension on DateTime {
  DateTime get onlyDate {
    return DateTime(year, month, day);
  }

  DateTime get startOfMonth {
    return DateTime(year, month, 0).add(const Duration(days: 1));
  }

  DateTime get endOfMonth {
    return DateTime(year, month + 1, 0);
  }
}
