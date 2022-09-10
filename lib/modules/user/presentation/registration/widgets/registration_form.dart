import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:italia_design_system/italia_design_system.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/regex.dart';
import '../../../../_commons/reactive_forms/reactive_checkbox_list_tile.dart';
import '../../../../_commons/widgets/form_container.dart';
import '../../sign_in/sign_in_page.dart';
import 'registration_button.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _form = FormGroup({
    'firstName': FormControl<String>(
      validators: [
        Validators.required,
      ],
    ),
    'lastName': FormControl<String>(
      validators: [
        Validators.required,
      ],
    ),
    'email': FormControl<String>(
      validators: [
        Validators.required,
        Validators.email,
      ],
    ),
    'phoneNumber': FormControl<String>(
      validators: [
        Validators.required,
        Validators.pattern(Regex.phoneNumber),
      ],
    ),
    'password': FormControl<String>(
      validators: [
        Validators.required,
        Validators.minLength(8),
      ],
    ),
    'passwordConfirmation': FormControl<String>(
      validators: [
        Validators.required,
        Validators.minLength(8),
      ],
    ),
    'privacyPolicy': FormControl<bool>(
      validators: [
        Validators.requiredTrue,
      ],
    ),
  }, validators: [
    Validators.mustMatch('password', 'passwordConfirmation'),
  ]);

  @override
  Widget build(BuildContext context) {
    return FormContainer(
      child: ReactiveForm(
        formGroup: _form,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _firstName,
            const SizedBox(height: Spacing.m),
            _lastName,
            const SizedBox(height: Spacing.m),
            _email,
            const SizedBox(height: Spacing.m),
            _phoneNumber,
            const SizedBox(height: Spacing.m),
            _password,
            const SizedBox(height: Spacing.m),
            _passwordConfirmation,
            const SizedBox(height: Spacing.m),
            _privacyPolicy,
            const SizedBox(height: Spacing.m),
            Wrap(
              spacing: Spacing.m,
              runSpacing: Spacing.s,
              children: [
                const RegistrationButton(),
                TextButton(
                  onPressed: () => Router.neglect(context, () => context.go(SignInPage.routeName)),
                  child: const Text('Ho già un account', textAlign: TextAlign.start),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget get _firstName {
    return ReactiveTextField(
      formControlName: 'firstName',
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.words,
      autocorrect: false,
      autofocus: false,
      decoration: const InputDecoration(
        labelText: 'Nome',
      ),
      validationMessages: {
        ValidationMessage.required: (_) => 'Il nome è obbligatorio',
      },
    );
  }

  Widget get _lastName {
    return ReactiveTextField(
      formControlName: 'lastName',
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.words,
      autocorrect: false,
      autofocus: false,
      decoration: const InputDecoration(
        labelText: 'Cognome',
      ),
      validationMessages: {
        ValidationMessage.required: (_) => 'Il cognome è obbligatorio',
      },
    );
  }

  Widget get _email {
    return ReactiveTextField(
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
    );
  }

  Widget get _phoneNumber {
    return ReactiveTextField(
      formControlName: 'phoneNumber',
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.phone,
      autocorrect: false,
      autofocus: false,
      decoration: const InputDecoration(
        labelText: 'Numero di telefono',
      ),
      validationMessages: {
        ValidationMessage.required: (_) => 'Il numero di telefono è obbligatorio',
        ValidationMessage.pattern: (_) => 'Il numero di telefono non è valido',
      },
    );
  }

  Widget get _password {
    return ReactiveTextField(
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
        ValidationMessage.minLength: (_) => 'La password deve avere almeno 8 caratteri',
      },
    );
  }

  Widget get _passwordConfirmation {
    return ReactiveTextField(
      formControlName: 'passwordConfirmation',
      textInputAction: TextInputAction.next,
      obscureText: true,
      autocorrect: false,
      autofocus: false,
      decoration: const InputDecoration(
        labelText: 'Conferma password',
      ),
      showErrors: (control) => control.invalid && control.dirty,
      validationMessages: {
        ValidationMessage.required: (_) => 'La password è obbligatoria',
        ValidationMessage.minLength: (_) => 'La password deve avere almeno 8 caratteri',
        ValidationMessage.mustMatch: (_) => 'Le password non corrispondono',
      },
    );
  }

  ReactiveCheckboxTile get _privacyPolicy {
    return ReactiveCheckboxTile(
      formControlName: 'privacyPolicy',
      title: _privacyPolicyText,
      validationMessages: {
        ValidationMessage.requiredTrue: (_) => 'Devi accettare i termini e le condizioni',
      },
    );
  }

  Widget get _privacyPolicyText {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Accetto i termini e le condizioni consultabili alla seguente pagina, ',
            style: TitilliumTextStyles.body(),
          ),
          TextSpan(
            text: 'termini e condizioni',
            style: TitilliumTextStyles.body(color: ItaliaColors.primary.getColor()),
            recognizer: TapGestureRecognizer()..onTap = _navigateToPrivacyPolicy,
          ),
        ],
      ),
    );
  }

  Future<void> _navigateToPrivacyPolicy() async {
    final uri = Uri.parse('https://www.italia.it/privacy-policy');
    if (await canLaunchUrl(uri)) {
      launchUrl(uri);
    }
  }
}
