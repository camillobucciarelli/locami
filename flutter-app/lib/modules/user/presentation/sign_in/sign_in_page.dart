import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common_ui/app_scaffold.dart';
import '../../../../common_ui/logo.dart';
import '../../../../common_ui/responsive/responsive_stateless_widget.dart';
import '../../../../core/theme/theme.dart';
import 'widgets/sign_in_form/sign_in_form_widget.dart';

part 'widgets/header.dart';

class SignInPage extends ResponsiveStatelessWidget {
  static const maxPageWidth = 750.0;

  const SignInPage({super.key});

  @override
  Widget buildResponsive(BuildContext context, BoxConstraints constraints) {
    final verticalSpacing = ResponsiveSpacing.m.w;

    return AppScaffold(
      body: [
        const _Header(),
        SizedBox(height: verticalSpacing),
        const SignInFormWidget(),
      ],
      constraints: const BoxConstraints(maxWidth: maxPageWidth),
    );
  }
}
