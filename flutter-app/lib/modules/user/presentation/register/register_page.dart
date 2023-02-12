import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common_ui/app_scaffold.dart';
import '../../../../common_ui/logo.dart';
import '../../../../common_ui/responsive/responsive_stateless_widget.dart';
import '../../../../core/theme/theme.dart';
import 'widgets/registration_form/registration_form_widget.dart';

part 'widgets/header.dart';

class RegisterPage extends ResponsiveStatelessWidget {
  static const maxPageWidth = 750.0;

  const RegisterPage({super.key});

  @override
  Widget buildResponsive(BuildContext context, BoxConstraints constraints) {
    final verticalSpacing = ResponsiveSpacing.m.w;

    return AppScaffold(
      body: [
        const _Header(),
        SizedBox(height: verticalSpacing),
        const RegistrationFormWidget(),
      ],
      constraints: const BoxConstraints(maxWidth: maxPageWidth),
    );
  }
}
