import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:italia_design_system/italia_design_system.dart';

import '../../registration/registration_page.dart';

class RegisterSection extends StatelessWidget {
  const RegisterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Spacing.l).copyWith(right: ResponsiveSpacing.xxl(context)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Oppure se non sei ancora registrato',
            textAlign: TextAlign.center,
            style: TitilliumTextStyles.body(),
          ),
          const SizedBox(height: Spacing.s),
          TextButton(
            onPressed: () => context.go(RegistrationPage.routeName),
            child: const Text('Registrati'),
          ),
        ],
      ),
    );
  }
}
