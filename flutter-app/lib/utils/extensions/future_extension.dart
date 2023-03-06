// 🎯 Dart imports:

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

import '../../core/error_management/failure.dart';

// 🌎 Project imports:

extension FutureExtension<T> on Future<T> {
  void actions({
    VoidCallback? progress,
    Function(T)? success,
    Function(Failure)? failure,
  }) {
    progress?.call();
    then((value) => success?.call(value)).catchError(
      (e) {
        if (e is Failure) {
          failure?.call(e);
        } else {
          failure?.call(Failure.genericFromException(e));
        }
      },
    );
  }
}
