import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../../common_ui/app_snack_bar.dart';
import '../../../../../../common_ui/common_form_fields/email_field.dart';
import '../../../../../../common_ui/common_form_fields/password_field.dart';
import '../../../../../../common_ui/responsive/responsive_state.dart';
import '../../../../../../common_ui/responsive/responsive_stateless_widget.dart';
import '../../../../../../core/router/app_router.dart';
import '../../../../../../core/theme/theme.dart';
import '../../../../../../translations/translations_keys.g.dart';
import '../../../state/user_cubit.dart';

part 'confirm_password.dart';

part 'registration_form.dart';

part 'submit_button.dart';

class RegistrationFormWidget extends StatefulWidget {
  const RegistrationFormWidget({super.key});

  @override
  State<RegistrationFormWidget> createState() => _RegistrationFormWidgetState();
}

class _RegistrationFormWidgetState extends ResponsiveState<RegistrationFormWidget> with _RegistrationForm {
  @override
  Widget buildResponsive(BuildContext context, BoxConstraints constraints) {
    return ReactiveForm(
      formGroup: form,
      child: Column(
        children: [
          const EmailField(controlName: _RegistrationForm.emailControlName),
          const Spacer(),
          const PasswordField(controlName: _RegistrationForm.passwordControlName),
          const Spacer(),
          const _ConfirmPassword(),
          const Spacer(),
          _SubmitButton(_checkValidityAndRegister, unlockForm: unlockForm),
        ],
      ),
    );
  }

  void _checkValidityAndRegister() {
    if (isValidForm) {
      lockForm();
      context.read<UserCubit>().register(email: email, password: password);
    }
  }
}
