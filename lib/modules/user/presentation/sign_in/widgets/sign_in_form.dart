import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:italia_design_system/italia_design_system.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'sign_in_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _form = FormGroup({
    'email': FormControl(
      value: kDebugMode ? 'bucciarelli.camillo92@gmail.com' : null,
      validators: [
        Validators.required,
        Validators.email,
      ],
    ),
    'password': FormControl(
      value: kDebugMode ? 'qwer4321' : null,
      validators: [
        Validators.required,
        Validators.minLength(8),
      ],
    ),
  });

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: _form,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReactiveTextField(
            formControlName: 'email',
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            autocorrect: false,
            autofocus: false,
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
            validationMessages: {
              ValidationMessage.required: (_) => 'L\'email è obbligatoria',
              ValidationMessage.email: (_) => 'L\'email non è valida',
            },
          ),
          const SizedBox(height: Spacing.m),
          ReactiveTextField(
            formControlName: 'password',
            textInputAction: TextInputAction.next,
            obscureText: true,
            autocorrect: false,
            autofocus: false,
            decoration: const InputDecoration(
              labelText: 'Password',
            ),
            validationMessages: {
              ValidationMessage.required: (_) => 'La password è obbligatoria',
              ValidationMessage.minLength: (_) => 'La password deve essere di almeno 8 caratteri',
            },
          ),
          const SizedBox(height: Spacing.m),
          const SignInButton(),
        ],
      ),
    );
  }
}
