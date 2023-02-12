import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../core/theme/theme.dart';

class AppScaffold extends StatelessWidget {
  final List<Widget> body;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final BoxConstraints? constraints;

  const AppScaffold({
    super.key,
    required this.body,
    this.padding,
    this.constraints,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: constraints,
          child: ListView(
            shrinkWrap: true,
            padding: padding ?? EdgeInsets.all(ResponsiveSpacing.xl.w),
            children: body,
          ),
        ),
      ),
      backgroundColor: backgroundColor,
    );
  }
}
