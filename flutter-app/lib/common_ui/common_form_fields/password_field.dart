import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../translations/translations_keys.g.dart';

class PasswordField extends StatelessWidget {
  final String controlName;

  const PasswordField({Key? key, required this.controlName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      formControlName: controlName,
      validationMessages: {
        ValidationMessage.required: (_) => LocaleKeys.common_form_fields_password_error_required.tr(),
        ValidationMessage.minLength: (_) => LocaleKeys.common_form_fields_password_error_min_length.tr(),
      },
      decoration: InputDecoration(
        labelText: LocaleKeys.common_form_fields_password_label.tr(),
      ),
      textInputAction: TextInputAction.next,
      obscureText: true,
    );
  }
}
