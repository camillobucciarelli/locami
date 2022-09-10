import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:italia_design_system/italia_design_system.dart';

import '../../../../router.dart';
import '../../../_commons/widgets/loader_button.dart';
import '../../../dashboard/dashboard_page.dart';
import '../cubit/user_cubit.dart';
import '../widgets/user_signed_in_selector.dart';

class EmailVerificationPage extends StatelessWidget {
  static const String routeName = '/verify-email';
  static final GoRoute route = GoRoute(
    path: EmailVerificationPage.routeName,
    pageBuilder: buildPage(const EmailVerificationPage()),
  );

  const EmailVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<UserCubit, UserState>(
        listener: (context, state) {
          if (state is EmailVerified) {
            context.go(DashboardPage.routeName);
          }
        },
        child: Container(
          padding: const EdgeInsets.all(Spacing.l).copyWith(right: ResponsiveSpacing.xxl(context)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Verifica il tuo indirizzo email',
                style: TitilliumTextStyles.h1(),
              ),
              UserSignedIdSelector(
                builder: (context, state) {
                  return Text(
                    'Ti abbiamo inviato un messaggio di posta elettronica all\'indirizzo '
                    '${state?.user.email}, segui le istruzioni contenute nel messaggio '
                    'per verificare il tuo indirizzo email e accedere a tutte le funzionalità.',
                    style: TitilliumTextStyles.body(),
                  );
                },
              ),
              const SizedBox(height: Spacing.xl, width: double.infinity),
              Wrap(
                spacing: Spacing.l,
                runSpacing: Spacing.m,
                children: <Widget>[
                  BlocSelector<UserCubit, UserState, bool>(
                    selector: (state) => state is SendEmailVerificationProgress,
                    builder: (context, state) {
                      return LoaderButton.elevated(
                        text: 'Invia di nuovo',
                        loadingSemanticLabel: 'Invio email in corso...',
                        loading: state,
                        onPressed: context.read<UserCubit>().sendVerificationEmail,
                      );
                    },
                  ),
                  BlocSelector<UserCubit, UserState, bool>(
                    selector: (state) => state is SignOutProgress,
                    builder: (context, state) {
                      return LoaderButton.text(
                        text: 'Torna alla login',
                        loadingSemanticLabel: 'uscita dall\'applicazione in corso...',
                        loading: state,
                        onPressed: context.read<UserCubit>().signOut,
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
