part of '../create_project_form_widget.dart';

class NameField extends StatelessWidget {

  const NameField({super.key});

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      formControlName: _CreateProjectForm.nameControlName,
      validationMessages: {
        ValidationMessage.required: (_) => LocaleKeys.projects_create_project_form_name_error_required.tr(),
        ValidationMessage.minLength: (_) => LocaleKeys.projects_create_project_form_name_error_min_length.tr(),
        ValidationMessage.maxLength: (_) => LocaleKeys.projects_create_project_form_name_error_max_length.tr(),
      },
      decoration: InputDecoration(
        labelText: LocaleKeys.projects_create_project_form_name_label.tr(),
        counter: const TextFieldCounter(
          formControlName: _CreateProjectForm.nameControlName,
          maxLength: _CreateProjectForm.nameMaxLength,
        ),
      ),
      textInputAction: TextInputAction.next,
    );
  }
}
