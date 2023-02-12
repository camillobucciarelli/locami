part of 'registration_form_widget.dart';

mixin RegistrationForm {
  // Form controls names
  static const String emailControlName = 'email';
  static const String passwordControlName = 'password';
  static const String confirmPasswordControlName = 'confirmPassword';

  // Form
  final FormGroup form = FormGroup(
    {
      emailControlName: FormControl<String>(
        value: 'email@email.it',
        validators: [Validators.required, Validators.email],
      ),
      passwordControlName: FormControl<String>(
        value: 'password',
        validators: [Validators.required, Validators.minLength(6)],
      ),
      confirmPasswordControlName: FormControl<String>(
        value: 'password',
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
