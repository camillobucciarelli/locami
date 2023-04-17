part of 'project_user_table_widget.dart';

mixin _CreateProjectUserForm {
  // Form controls names
  static const String userControlName = 'ref';
  static const String roleControlName = 'role';

  // Form
  final FormGroup userForm = FormGroup({
    userControlName: FormControl<DocumentReference>(
      validators: [Validators.required],
    ),
    roleControlName: FormControl<UserRoles>(
      validators: [Validators.required],
    ),
  });

  // Get values
  DocumentReference get userRef => userForm.control(userControlName).value;

  UserRoles get role => userForm.control(roleControlName).value;

  // Validate
  bool get isValidForm => userForm.valid;

  // Lock form
  void lockForm() {
    userForm.markAsDisabled();
  }

  // Unlock form
  void unlockForm() {
    userForm.markAsEnabled();
  }
}
