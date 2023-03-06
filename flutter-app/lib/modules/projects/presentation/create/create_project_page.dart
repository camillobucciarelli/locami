import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common_ui/app_scaffold.dart';
import '../../../../common_ui/responsive/responsive_stateless_widget.dart';
import '../../../../core/theme/theme.dart';

class CreateProjectPage extends ResponsiveStatelessWidget {
  static const maxPageWidth = 750.0;

  const CreateProjectPage({super.key});

  @override
  Widget buildResponsive(BuildContext context, BoxConstraints constraints) {
    final verticalSpacing = ResponsiveSpacing.m.w;

    return AppScaffold(
      body: [
      ],
      constraints: const BoxConstraints(maxWidth: maxPageWidth),
    );
  }
}
