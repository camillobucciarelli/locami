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

part 'sign_in_form.dart';

part 'spacer.dart';

part 'submit_button.dart';

class SignInFormWidget extends StatefulWidget {
  const SignInFormWidget({super.key});

  @override
  State<SignInFormWidget> createState() => _SignInFormWidgetState();
}

class _SignInFormWidgetState extends ResponsiveState<SignInFormWidget> with SignInForm {
  @override
  Widget buildResponsive(BuildContext context, BoxConstraints constraints) {
    return ReactiveForm(
      formGroup: form,
      child: Column(
        children: [
          const EmailField(controlName: SignInForm.emailControlName),
          const _Spacer(),
          const PasswordField(controlName: SignInForm.passwordControlName),
          const _Spacer(),
          _SubmitButton(_checkValidityAndSignIn, unlockForm: unlockForm),
        ],
      ),
    );
  }

  void _checkValidityAndSignIn() {
    if (isValidForm) {
      lockForm();
      context.read<UserCubit>().signIn(email: email, password: password);
    }
  }
}
