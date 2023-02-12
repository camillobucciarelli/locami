import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../common_ui/app_scaffold.dart';
import '../../../../common_ui/logo.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/theme/breakpoints.dart';
import '../../../../core/theme/theme.dart';
import '../../../../translations/translations_keys.g.dart';
import '../state/user_cubit.dart';
import 'widgets/registration_form/registration_form.dart';

part 'widgets/header.dart';

part 'widgets/registration_form/registration_form_widget.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: [const _Header(), SizedBox(height: ResponsiveSpacing.m(context)), const _RegistrationFormWidget()],
      padding: EdgeInsets.symmetric(
        vertical: ResponsiveSpacing.s(context),
        horizontal: ResponsiveSpacing.custom(context, Spacing.xxl * 10),
      ),
    );
  }
}
