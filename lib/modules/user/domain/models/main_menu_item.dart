import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainMenuItem extends Equatable {
  final IconData icon;
  final String label;
  final String routeName;

  const MainMenuItem({required this.icon, required this.label, required this.routeName});

  Widget toSmallScreenWidget(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      onTap: () => context.goNamed(routeName),
    );
  }

  Widget toLargeScreenWidget(BuildContext context) {
    return TextButton(
      onPressed: () => context.goNamed(routeName),
      child: Text(label),
    );
  }

  @override
  List<Object?> get props => [icon, label, routeName];

}
