import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class TextFieldCounter extends StatelessWidget {
  final String formControlName;
  final int maxLength;
  const TextFieldCounter({super.key, required this.formControlName, required this.maxLength});

  @override
  Widget build(BuildContext context) {
    return ReactiveValueListenableBuilder<String>(
      builder: (context, formControl, child) {
        return Text(
          '${formControl.value?.length ?? 0} of $maxLength',
          style: Theme.of(context).inputDecorationTheme.helperStyle,
        );
      },
      formControlName: formControlName,
    );
  }
}
