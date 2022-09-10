import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:italia_design_system/italia_design_system.dart';

import '../../../../router.dart';
import 'widgets/intro_section.dart';
import 'widgets/sign_in_section.dart';
import 'widgets/register_section.dart';

class SignInPage extends StatelessWidget {
  static const String routeName = '/sign-in';
  static final GoRoute route = GoRoute(
    path: SignInPage.routeName,
    pageBuilder: buildPage(const SignInPage()),
  );
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: Spacing.xxl),
          shrinkWrap: true,
          children: const [
            IntroSection(),
            SizedBox(height: Spacing.xl),
            LoginSection(),
            RegisterSection(),
          ],
        ),
      ),
    );
  }
}
