import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:italia_design_system/italia_design_system.dart';

import '../../../../router.dart';
import 'widgets/registration_form.dart';

class RegistrationPage extends StatelessWidget {
  static const String routeName = '/registration';
  static final GoRoute route = GoRoute(
    path: RegistrationPage.routeName,
    pageBuilder: buildPage(const RegistrationPage()),
  );

  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(Spacing.l),
          shrinkWrap: true,
          children: [
            Text(
              'Crea il tuo account',
              style: TitilliumTextStyles.h1(),
            ),
            Padding(
              padding: EdgeInsets.only(right: ResponsiveSpacing.xxl(context)),
              child: Text(
                'una volta creato l\'account comunicalo al tuo comune insieme alla documentazione '
                'necessaria per il rilascio dei buoni pasto per poter utilizzare tutte le '
                'funzionalità online.',
                style: TitilliumTextStyles.body(),
              ),
            ),
            const SizedBox(height: Spacing.l),
            const RegistrationForm(),
          ],
        ),
      ),
    );
  }
}
