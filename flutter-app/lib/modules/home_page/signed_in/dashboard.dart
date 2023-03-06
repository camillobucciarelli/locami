import 'package:flutter/material.dart';

import '../../../common_ui/app_scaffold.dart';
import '../../../common_ui/responsive/responsive_stateless_widget.dart';
import '../../../core/theme/theme.dart';
import '../../projects/presentation/home_widget/projects_home_widget.dart';

part 'widgets/large_screen_layout.dart';

part 'widgets/small_screen_layout.dart';

class Dashboard extends ResponsiveStatelessWidget {
  static const _breakpoint = 1366.0;

  const Dashboard({super.key});

  @override
  Widget buildResponsive(BuildContext context, BoxConstraints constraints) {
    return AppScaffold(
      bodyDelegate: constraints.maxWidth > _breakpoint ? LargeScreenLayout() : SmallScreenLayout(),
    );
  }
}
