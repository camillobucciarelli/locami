part of 'registration_form_widget.dart';

class _Password extends StatelessWidget {
  const _Password({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      formControlName: RegistrationForm.passwordControlName,
      validationMessages: {
        ValidationMessage.required: (_) => LocaleKeys.registration_form_password_error_required.tr(),
        ValidationMessage.minLength: (_) => LocaleKeys.registration_form_password_error_min_length.tr(),
      },
      decoration: InputDecoration(
        labelText: LocaleKeys.registration_form_password_label.tr(),
      ),
      textInputAction: TextInputAction.next,
      obscureText: true,
    );
  }
}
