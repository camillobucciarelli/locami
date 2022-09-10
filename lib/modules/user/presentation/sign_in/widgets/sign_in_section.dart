import 'dart:math';

import 'package:flutter/material.dart';
import 'package:italia_design_system/italia_design_system.dart';

import 'sign_in_form.dart';

class LoginSection extends StatefulWidget {
  const LoginSection({super.key});

  @override
  State<LoginSection> createState() => _LoginSectionState();
}

class _LoginSectionState extends State<LoginSection> {
  bool _loginFormVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Spacing.l).copyWith(right: max(ResponsiveSpacing.xxl(context), Spacing.l)),
      color: ItaliaColors.lightGray.getVariant(ColorVariant.a03),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hai già un account?',
            textAlign: TextAlign.center,
            style: TitilliumTextStyles.body(),
          ),
          const SizedBox(height: Spacing.s),
          AnimatedSwitcher(
            duration: Durations.uiSwitch,
            child: _loginFormVisible
                ? const LoginForm()
                : ElevatedButton(
                    onPressed: () => setState(() => _loginFormVisible = true),
                    child: const Text('Accedi'),
                  ),
          ),
        ],
      ),
    );
  }
}
