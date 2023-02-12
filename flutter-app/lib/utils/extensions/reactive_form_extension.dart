// 🐦 Flutter imports:
import 'package:flutter/widgets.dart';

// 📦 Package imports:
import 'package:reactive_forms/reactive_forms.dart';

extension ReactiveFormExtension on BuildContext {
  FormGroup get form {
    final form = ReactiveForm.of(this, listen: false);
    if (form is FormGroup) {
      return form;
    }
    throw Exception('No form detected');
  }
}
