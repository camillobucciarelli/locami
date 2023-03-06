// 🎯 Dart imports:

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

import '../../core/error_management/failure.dart';

// 🌎 Project imports:

extension StreamExtension<T> on Stream<T> {
  void actions({
    VoidCallback? progress,
    Function(T)? success,
    Function(Failure)? failure,
  }) {
    progress?.call();
    handleError((e) {
      if (e is Failure) {
        failure?.call(e);
      } else {
        failure?.call(Failure.genericFromException(e));
      }
    }).forEach((value) => success?.call(value));
  }
}
