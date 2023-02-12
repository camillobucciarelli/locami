import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../common_ui/app_scaffold.dart';
import '../../../common_ui/logo.dart';
import '../../../common_ui/responsive/responsive_stateless_widget.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/theme.dart';
import '../../../translations/translations_keys.g.dart';

part 'widgets/actions.dart';

part 'widgets/header.dart';

class HomePage extends ResponsiveStatelessWidget {
  const HomePage({super.key});

  @override
  Widget buildResponsive(BuildContext context, BoxConstraints constraints) {
    return AppScaffold(
      body: [
        const _Header(),
        SizedBox(height: ResponsiveSpacing.m.w),
        const _Actions(),
      ],
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }
}
