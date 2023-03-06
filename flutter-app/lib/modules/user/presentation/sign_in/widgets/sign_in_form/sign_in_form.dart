part of 'sign_in_form_widget.dart';

mixin SignInForm {
  // Form controls names
  static const String emailControlName = 'email';
  static const String passwordControlName = 'password';

  // Form
  final FormGroup form = FormGroup({
    emailControlName: FormControl<String>(
      validators: [Validators.required, Validators.email],
    ),
    passwordControlName: FormControl<String>(
      validators: [Validators.required, Validators.minLength(6)],
    ),
  });

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
