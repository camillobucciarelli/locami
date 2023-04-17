part of '../create_project_form_widget.dart';

class DescriptionField extends StatelessWidget {
  static const _lines = 5;

  const DescriptionField({super.key});

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      formControlName: _CreateProjectForm.descriptionControlName,
      validationMessages: {
        ValidationMessage.required: (_) => LocaleKeys.projects_create_project_form_description_error_required.tr(),
        ValidationMessage.minLength: (_) => LocaleKeys.projects_create_project_form_description_error_min_length.tr(),
        ValidationMessage.maxLength: (_) => LocaleKeys.projects_create_project_form_description_error_max_length.tr(),
      },
      decoration: InputDecoration(
        labelText: LocaleKeys.projects_create_project_form_description_label.tr(),
        counter: const TextFieldCounter(
          formControlName: _CreateProjectForm.descriptionControlName,
          maxLength: _CreateProjectForm.descriptionMaxLength,
        ),
      ),
      textInputAction: TextInputAction.next,
      maxLines: _lines,
      minLines: _lines,
    );
  }
}
