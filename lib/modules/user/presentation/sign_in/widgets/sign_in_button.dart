import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:italia_design_system/italia_design_system.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../_commons/widgets/loader_button.dart';
import '../../../../dashboard/dashboard_page.dart';
import '../../cubit/user_cubit.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UserSignedIn) {
          context.go(DashboardPage.routeName);
        }
        if (state is SignInProgress || state is SignInFailure) {
          (ReactiveForm.of(context, listen: false) as FormGroup).markAsDisabled();
        }
        if (state is SignInFailure) {
          ItaliaDialog.error(
            title: 'Errore',
            content: state.failure.message,
            primaryAction: ItaliaDialogAction(
              onPressed: () => Navigator.pop(context),
              text: 'Ok',
            ),
          ).show(context);
        }
      },
      builder: (context, state) {
        return LoaderButton.elevated(
          text: 'Accedi',
          loadingSemanticLabel: 'Accesso in corso...',
          loading: state is SignInProgress,
          onPressed: () => _sendSignIn(context),
        );
      },
    );
  }

  void _sendSignIn(BuildContext context) {
    final form = (ReactiveForm.of(context, listen: false) as FormGroup)..markAllAsTouched();
    if (form.valid) {
      context.read<UserCubit>().signIn(form.value);
    }
  }
}
