import 'package:flutter/material.dart';

import '../core/theme/theme.dart';

class AppScaffold extends StatelessWidget {
  final List<Widget> body;
  final Color? backgroundColor;
  final EdgeInsets? padding;

  const AppScaffold({
    super.key,
    required this.body,
    this.padding,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: padding ?? EdgeInsets.symmetric(
            vertical: ResponsiveSpacing.s(context),
            horizontal: ResponsiveSpacing.xxl(context),
          ),
          children: body,
        ),
      ),
      backgroundColor: backgroundColor,
    );
  }
}
