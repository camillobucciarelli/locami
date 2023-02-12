import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../common_ui/app_scaffold.dart';
import '../../../common_ui/logo.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/breakpoints.dart';
import '../../../core/theme/theme.dart';
import '../../../translations/translations_keys.g.dart';

part 'widgets/actions.dart';

part 'widgets/header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: const [
        _Header(),
        _Actions(),
      ],
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }
}
