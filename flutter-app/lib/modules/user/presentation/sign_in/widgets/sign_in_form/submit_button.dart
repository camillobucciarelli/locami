part of 'sign_in_form_widget.dart';

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
            onPressed: state is! SignInProcessingState ? onPressed : null,
            child: SizedBox(
              width: double.infinity,
              child: Text(LocaleKeys.sign_in_form_buttons_submit.tr(), textAlign: TextAlign.center),
            ),
          ),
          const SizedBox(height: Spacing.s),
          if (state is SignInProcessingState) ...const [
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

  bool _buildWhen(_, UserState current) => current is SignInState;

  bool _listenWhen(_, UserState current) => current is SignInState || current is UserSignedInState;

  void _listen(BuildContext context, UserState state) {
    unlockForm();

    if (state is UserSignedInState) {
      const HomeRoute().go(context);

      return;
    }

    if (state is WrongCredentialsState) {
      ScaffoldMessenger.of(context).showSnackBar(
        AppSnackBar.error(context, messageKey: LocaleKeys.sign_in_form_errors_wrong_credential),
      );

      return;
    }

    if (state is SignInFailureState) {
      ScaffoldMessenger.of(context).showSnackBar(
        AppSnackBar.error(context, messageKey: LocaleKeys.sign_in_form_errors_sign_in_failure),
      );

      return;
    }
  }
}
