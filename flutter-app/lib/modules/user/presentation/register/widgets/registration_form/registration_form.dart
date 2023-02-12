import 'package:reactive_forms/reactive_forms.dart';

mixin RegistrationForm {
  // Form controls names
  static const String firstNameControlName = 'firstName';
  static const String lastNameControlName = 'lastName';
  static const String emailControlName = 'email';
  static const String passwordControlName = 'password';
  static const String confirmPasswordControlName = 'confirmPassword';

  // Form
  final FormGroup form = FormGroup(
    {
      firstNameControlName: FormControl<String>(
        validators: [Validators.required, Validators.minLength(3)],
      ),
      lastNameControlName: FormControl<String>(
        validators: [Validators.required, Validators.minLength(3)],
      ),
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
  String get firstName => form.control(firstNameControlName).value;

  String get lastName => form.control(lastNameControlName).value;

  String get email => form.control(emailControlName).value;

  String get password => form.control(passwordControlName).value;

  // Validate
  bool get isValidForm => form.valid;
}
