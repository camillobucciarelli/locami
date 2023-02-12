part of '../../register_page.dart';

class _RegistrationFormWidget extends StatefulWidget {
  const _RegistrationFormWidget({Key? key}) : super(key: key);

  @override
  State<_RegistrationFormWidget> createState() => _RegistrationFormWidgetState();
}

class _RegistrationFormWidgetState extends State<_RegistrationFormWidget> with RegistrationForm {
  @override
  Widget build(BuildContext context) {
    final rowSpacing = ResponsiveSpacing.s(context);
    final inlineFormSpacing = ResponsiveSpacing.m(context);
    final columnSpacing = rowSpacing;

    return ReactiveForm(
      formGroup: form,
      child: Column(
        children: [
          ReactiveTextField(
            formControlName: RegistrationForm.firstNameControlName,
            validationMessages: {
              ValidationMessage.required: (_) => LocaleKeys.registration_form_first_name_error_required.tr(),
              ValidationMessage.minLength: (_) => LocaleKeys.registration_form_first_name_error_min_length.tr(),
            },
            decoration: InputDecoration(
              labelText: LocaleKeys.registration_form_first_name_label.tr(),
            ),
            textInputAction: TextInputAction.next,
          ),
          SizedBox(height: inlineFormSpacing),
          ReactiveTextField(
            formControlName: RegistrationForm.lastNameControlName,
            validationMessages: {
              ValidationMessage.required: (_) => LocaleKeys.registration_form_last_name_error_required.tr(),
              ValidationMessage.minLength: (_) => LocaleKeys.registration_form_last_name_error_min_length.tr(),
            },
            decoration: InputDecoration(
              labelText: LocaleKeys.registration_form_last_name_label.tr(),
            ),
            textInputAction: TextInputAction.next,
          ),
          SizedBox(height: inlineFormSpacing),
          ReactiveTextField(
            formControlName: RegistrationForm.emailControlName,
            validationMessages: {
              ValidationMessage.required: (_) => LocaleKeys.registration_form_email_error_required.tr(),
              ValidationMessage.email: (_) => LocaleKeys.registration_form_email_error_email.tr(),
            },
            decoration: InputDecoration(
              labelText: LocaleKeys.registration_form_email_label.tr(),
            ),
            textInputAction: TextInputAction.next,
          ),
          SizedBox(height: inlineFormSpacing),
          ReactiveTextField(
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
          ),
          SizedBox(height: inlineFormSpacing),
          ReactiveTextField(
            formControlName: RegistrationForm.confirmPasswordControlName,
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
          ),
          SizedBox(height: inlineFormSpacing),
          ResponsiveRowColumn(
            layout: ResponsiveWrapper.of(context).isSmallerThan(BreakPoints.tablet.name)
                ? ResponsiveRowColumnType.COLUMN
                : ResponsiveRowColumnType.ROW,
            rowMainAxisAlignment: MainAxisAlignment.center,
            columnCrossAxisAlignment: CrossAxisAlignment.center,
            rowSpacing: rowSpacing,
            columnSpacing: columnSpacing,
            rowPadding: const EdgeInsets.symmetric(vertical: Spacing.xxl),
            columnPadding: const EdgeInsets.symmetric(horizontal: Spacing.xxl),
            children: [
              ResponsiveRowColumnItem(
                child: ElevatedButton(
                  onPressed: _checkValidityAndRegister,
                  child: Text(LocaleKeys.registration_form_buttons_submit.tr()),
                ),
              ),
              ResponsiveRowColumnItem(
                child: ElevatedButton(
                  onPressed: () => const LoginPageRoute().go(context),
                  child: Text(LocaleKeys.registration_form_buttons_sign_in.tr()),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _checkValidityAndRegister() {
    if (isValidForm) {
      context.read<UserCubit>().register(firstName: firstName, lastName: lastName, email: email, password: password);
    } else {
      form.markAllAsTouched();
    }
  }
}
