import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../core/theme/theme.dart';

class AppScaffold extends StatelessWidget {
  final AppBar? appBar;
  final List<Widget>? body;
  final SliverChildListDelegate? bodyDelegate;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final BoxConstraints? constraints;

  const AppScaffold({
    super.key,
    this.body,
    this.bodyDelegate,
    this.appBar,
    this.padding,
    this.constraints,
    this.backgroundColor,
  }) : assert(body != null || bodyDelegate != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Center(
        child: Container(
          constraints: constraints,
          child: CustomScrollView(
            shrinkWrap: true,
            slivers: [
              SliverPadding(
                padding: padding ?? EdgeInsets.all(ResponsiveSpacing.xl.w),
                sliver: SliverList(
                  delegate: bodyDelegate ?? SliverChildListDelegate(body ?? []),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: backgroundColor,
    );
  }
}
