import 'package:flutter/material.dart';

abstract class ResponsiveStatelessWidget extends StatelessWidget {
  const ResponsiveStatelessWidget({super.key});

  Widget buildResponsive(BuildContext context, BoxConstraints constraints);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: buildResponsive);
  }
}
