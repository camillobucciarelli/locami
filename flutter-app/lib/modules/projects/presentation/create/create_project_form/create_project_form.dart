part of 'create_project_form_widget.dart';

mixin _CreateProjectForm {
  // Form controls names
  static const String nameControlName = 'name';
  static const String descriptionControlName = 'description';
  static const String usersControlName = 'users';
  static const int nameMaxLength = 30;
  static const int descriptionMaxLength = 50;


  // Form
  final FormGroup form = FormGroup({
    nameControlName: FormControl<String>(
      validators: [
        Validators.required,
        Validators.minLength(3),
        Validators.maxLength(nameMaxLength),
      ],
    ),
    descriptionControlName: FormControl<String>(
      validators: [
        Validators.required,
        Validators.minLength(3),
        Validators.maxLength(descriptionMaxLength),
      ],
    ),
    usersControlName: FormArray<FormGroup>(
      [],
      validators: [
        Validators.minLength(1),
      ],
    ),
  });

  // Get values
  String get name => form.control(nameControlName).value;

  String get description => form.control(descriptionControlName).value;

  List<FormGroup> get users => form.control(usersControlName).value;

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
