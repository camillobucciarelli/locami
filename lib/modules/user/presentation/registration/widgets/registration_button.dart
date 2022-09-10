import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:italia_design_system/italia_design_system.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../_commons/widgets/loader_button.dart';
import '../../cubit/user_cubit.dart';
import '../../email_verification/email_verification_page.dart';

class RegistrationButton extends StatefulWidget {
  const RegistrationButton({super.key});

  @override
  State<RegistrationButton> createState() => _RegistrationButtonState();
}

class _RegistrationButtonState extends State<RegistrationButton> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) async {
        if (state is UserSignedIn) {
          Router.neglect(context, () => context.go(EmailVerificationPage.routeName));
        }
        if (state is RegisterProgress || state is RegisterFailure) {
          (ReactiveForm.of(context, listen: false) as FormGroup).markAsDisabled();
        }
        if (state is RegisterFailure) {
          await ItaliaDialog.error(
            title: 'Errore',
            content: state.failure.message,
            primaryAction: ItaliaDialogAction(
              onPressed: () => Navigator.pop(context),
              text: 'Ok',
            ),
          ).show(context);
          if (mounted) {
            (ReactiveForm.of(context, listen: false) as FormGroup).markAsEnabled();
          }
        }
      },
      builder: (context, state) {
        return LoaderButton.elevated(
          text: 'Registrati',
          loadingSemanticLabel: 'Registrazione in corso...',
          loading: state is RegisterProgress,
          onPressed: () => _sendRegistration(context),
        );
      },
    );
  }

  void _sendRegistration(BuildContext context) {
    final form = (ReactiveForm.of(context, listen: false) as FormGroup)..markAllAsTouched();
    if (form.valid) {
      context.read<UserCubit>().register(form.value);
    }
  }
}
