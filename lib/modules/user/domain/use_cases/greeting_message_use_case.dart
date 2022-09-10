import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/extensions/time_of_day_extension.dart';

@lazySingleton
class GreetingMessageUseCase {
  static const _morningStart = TimeOfDay(hour: 0, minute: 0);
  static const _morningEnd = TimeOfDay(hour: 11, minute: 59);
  static const _afternoonStart = TimeOfDay(hour: 12, minute: 00);
  static const _afternoonEnd = TimeOfDay(hour: 17, minute: 59);
  static const _eveningStart = TimeOfDay(hour: 18, minute: 00);
  static const _eveningEnd = TimeOfDay(hour: 23, minute: 59);

  GreetingMessageUseCase();

  String call(GreetingMessageUseCaseParams params) {
    if (params.currentTime.isBetweenInclusive(_morningStart, _morningEnd)) {
      return 'Buongiorno ${params.user.displayName}';
    }
    if (params.currentTime.isBetweenInclusive(_afternoonStart, _afternoonEnd)) {
      return 'Buon pomeriggio ${params.user.displayName}';
    }
    if (params.currentTime.isBetweenInclusive(_eveningStart, _eveningEnd)) {
      return 'Buonasera ${params.user.displayName}';
    }
    return 'Ciao ${params.user.displayName}';
  }
}

class GreetingMessageUseCaseParams extends Equatable {
  final TimeOfDay currentTime;
  final User user;

  const GreetingMessageUseCaseParams({required this.currentTime, required this.user});

  @override
  List<Object?> get props => [currentTime, user];
}
