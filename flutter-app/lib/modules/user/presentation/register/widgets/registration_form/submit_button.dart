part of 'registration_form_widget.dart';

class _SubmitButton extends StatelessWidget {
  final VoidCallback onPressed;
  final VoidCallback unlockForm;

  const _SubmitButton(this.onPressed, {Key? key, required this.unlockForm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      builder: (context, state) {
        return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
            onPressed: state is! RegisterProcessingState ? onPressed : null,
            child: SizedBox(
              width: double.infinity,
              child: Text(LocaleKeys.registration_form_buttons_submit.tr(), textAlign: TextAlign.center),
            ),
          ),
          const SizedBox(height: Spacing.s),
          if (state is RegisterProcessingState) ...const [
            SizedBox(height: Spacing.s),
            LinearProgressIndicator(),
          ],
        ]);
      },
      listener: _listen,
      buildWhen: _buildWhen,
      listenWhen: _listenWhen,
    );
  }

  bool _buildWhen(_, UserState current) => current is RegisterState;

  bool _listenWhen(_, UserState current) => current is RegisterState || current is UserSignedInState;

  void _listen(BuildContext context, UserState state) {
    unlockForm();

    if (state is UserSignedInState) {
      const HomeRoute().go(context);

      return;
    }

    if (state is WeakPasswordState) {
      ScaffoldMessenger.of(context).showSnackBar(
        AppSnackBar.error(context, messageKey: LocaleKeys.registration_form_errors_weak_password),
      );

      return;
    }

    if (state is EmailAlreadyInUseState) {
      ScaffoldMessenger.of(context).showSnackBar(
        AppSnackBar.error(context, messageKey: LocaleKeys.registration_form_errors_email_already_in_use),
      );

      return;
    }

    if (state is InvalidEmailState) {
      ScaffoldMessenger.of(context).showSnackBar(
        AppSnackBar.error(context, messageKey: LocaleKeys.registration_form_errors_invalid_email),
      );

      return;
    }

    if (state is RegisterFailureState) {
      ScaffoldMessenger.of(context).showSnackBar(
        AppSnackBar.error(context, messageKey: LocaleKeys.registration_form_errors_register_failure),
      );

      return;
    }
  }
}
