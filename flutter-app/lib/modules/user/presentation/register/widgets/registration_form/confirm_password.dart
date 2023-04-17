part of 'registration_form_widget.dart';

class _ConfirmPassword extends StatelessWidget {
  const _ConfirmPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      formControlName: _RegistrationForm.confirmPasswordControlName,
      validationMessages: {
        ValidationMessage.required: (_) => LocaleKeys.registration_form_confirm_password_error_required.tr(),
        ValidationMessage.minLength: (_) => LocaleKeys.registration_form_confirm_password_error_min_length.tr(),
        ValidationMessage.mustMatch: (_) => LocaleKeys.registration_form_confirm_password_error_must_match.tr(),
      },
      decoration: InputDecoration(
        labelText: LocaleKeys.registration_form_confirm_password_label.tr(),
      ),
      textInputAction: TextInputAction.done,
      obscureText: true,
    );
  }
}
