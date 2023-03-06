import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  static final _shadow = BoxShadow(
    color: Colors.black.withOpacity(0.1),
    offset: const Offset(0, 1),
    blurRadius: 4,
    spreadRadius: 2,
  );
  final Widget child;
  final EdgeInsets? padding;
  final double? width;
  final double? height;

  const AppCard({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        boxShadow: [_shadow],
      ),
      width: width,
      height: height,
      child: child,
    );
  }
}
