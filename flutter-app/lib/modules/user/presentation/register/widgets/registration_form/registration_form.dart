part of 'registration_form_widget.dart';

mixin _RegistrationForm {
  // Form controls names
  static const String emailControlName = 'email';
  static const String passwordControlName = 'password';
  static const String confirmPasswordControlName = 'confirmPassword';

  // Form
  final FormGroup form = FormGroup(
    {
      emailControlName: FormControl<String>(
        validators: [Validators.required, Validators.email],
      ),
      passwordControlName: FormControl<String>(
        validators: [Validators.required, Validators.minLength(6)],
      ),
      confirmPasswordControlName: FormControl<String>(
        validators: [Validators.required, Validators.minLength(6)],
      ),
    },
    validators: [Validators.mustMatch(passwordControlName, confirmPasswordControlName)],
  );

  // Get values
  String get email => form.control(emailControlName).value;

  String get password => form.control(passwordControlName).value;

  // Validate
  bool get isValidForm => form.valid;

  // Lock form
  void lockForm() {
    form.markAsDisabled();
  }

  // Unlock form
  void unlockForm() {
    form.markAsEnabled();
  }
}
