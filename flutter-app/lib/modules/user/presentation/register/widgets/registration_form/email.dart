part of 'registration_form_widget.dart';

class _Email extends StatelessWidget {
  const _Email({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      formControlName: RegistrationForm.emailControlName,
      validationMessages: {
        ValidationMessage.required: (_) => LocaleKeys.registration_form_email_error_required.tr(),
        ValidationMessage.email: (_) => LocaleKeys.registration_form_email_error_email.tr(),
      },
      decoration: InputDecoration(
        labelText: LocaleKeys.registration_form_email_label.tr(),
      ),
      textInputAction: TextInputAction.next,
    );
  }
}
