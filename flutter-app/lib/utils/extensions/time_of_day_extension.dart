// 🐦 Flutter imports:
import 'package:flutter/material.dart';

extension TimeOfDayExtension on TimeOfDay {
  /// Compares this object to another object.
  ///
  /// It returns a negative integer if `this` is ordered before [other],
  /// a positive integer if `this` is ordered after [other],
  /// and zero if `this` and [other] are ordered together.
  ///
  /// The [other] argument is a [TimeOfDay] to compare with this.
  int compareTo(TimeOfDay other) {
    if (hour < other.hour) return -1;
    if (hour > other.hour) return 1;
    if (minute < other.minute) return -1;
    if (minute > other.minute) return 1;

    return 0;
  }

  /// Compares this object to another object.
  ///
  /// It returns [true] if `this` is ordered before [other].
  bool isBefore(TimeOfDay other) => compareTo(other) == -1;

  /// Compares this object to another object.
  ///
  /// It returns [true] if `this` is ordered after [other].
  bool isAfter(TimeOfDay other) => compareTo(other) == 1;

  /// Compares this object to another object.
  ///
  /// It returns [true] if `this` is equals [other].
  bool isSame(TimeOfDay other) => compareTo(other) == 0;

  /// Compares this object to another object.
  ///
  /// It returns [true] if `this` is ordered after [start] and before [end].
  bool isBetween(TimeOfDay start, TimeOfDay end) => isAfter(start) && isBefore(end);

  /// Compares this object to another object.
  ///
  /// It returns [true] if `this` is ordered after [start] or equals [start] and before [end] or equals [end].
  bool isBetweenInclusive(TimeOfDay start, TimeOfDay end) =>
      (isAfter(start) || isSame(start)) && (isBefore(end) || isSame(end));
}
