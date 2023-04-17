import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../../common_ui/common_form_fields/email_field.dart';
import '../../../../../../common_ui/common_form_fields/password_field.dart';
import '../../../../../../common_ui/responsive/responsive_state.dart';
import '../../../../../common_ui/common_form_fields/form_spacer.dart';
import '../../../../../common_ui/common_form_fields/text_field_counter.dart';
import '../../../../../translations/translations_keys.g.dart';
import '../../../data/models/project_user.dart';
import '../../../data/models/user_roles.dart';
import '../../project_user/table/project_user_table_widget.dart';

part 'create_project_form.dart';

part 'fields/name_field.dart';

part 'fields/description_field.dart';

part 'widgets/header.dart';

class CreateProjectFormWidget extends StatefulWidget {
  const CreateProjectFormWidget({super.key});

  @override
  State<CreateProjectFormWidget> createState() => _CreateProjectFormWidgetState();
}

class _CreateProjectFormWidgetState extends ResponsiveState<CreateProjectFormWidget>
    with _CreateProjectForm {
  @override
  Widget buildResponsive(BuildContext context, BoxConstraints constraints) {
    return ReactiveForm(
      formGroup: form,
      child: Column(
        children: [
          Header(),
          const FormSpacer(),
          const NameField(),
          const FormSpacer(),
          const DescriptionField(),
          const FormSpacer(),
          ProjectUserTableWidget(),
        ],
      ),
    );
  }

  void _checkValidityAndRegister() {
    if (isValidForm) {
      lockForm();
    }
  }
}
