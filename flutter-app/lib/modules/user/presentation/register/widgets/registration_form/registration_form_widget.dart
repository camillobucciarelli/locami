import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../../common_ui/app_snack_bar.dart';
import '../../../../../../common_ui/responsive/responsive_state.dart';
import '../../../../../../common_ui/responsive/responsive_stateless_widget.dart';
import '../../../../../../core/router/app_router.dart';
import '../../../../../../core/theme/theme.dart';
import '../../../../../../translations/translations_keys.g.dart';
import '../../../state/user_cubit.dart';

part 'confirm_password.dart';

part 'email.dart';

part 'password.dart';

part 'registration_form.dart';

part 'spacer.dart';

part 'submit_button.dart';

class RegistrationFormWidget extends StatefulWidget {
  const RegistrationFormWidget({super.key});

  @override
  State<RegistrationFormWidget> createState() => _RegistrationFormWidgetState();
}

class _RegistrationFormWidgetState extends ResponsiveState<RegistrationFormWidget> with RegistrationForm {
  @override
  Widget buildResponsive(BuildContext context, BoxConstraints constraints) {
    return ReactiveForm(
      formGroup: form,
      child: Column(
        children: [
          const _Email(),
          const _Spacer(),
          const _Password(),
          const _Spacer(),
          const _ConfirmPassword(),
          const _Spacer(),
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
