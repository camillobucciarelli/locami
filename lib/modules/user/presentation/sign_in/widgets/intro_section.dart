import 'package:flutter/material.dart';
import 'package:italia_design_system/italia_design_system.dart';

class IntroSection extends StatelessWidget {
  const IntroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.l),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Benvenuto su Buono Semplice',
            style: TitilliumTextStyles.h1(),
          ),
          Text(
            'L\'applicazione che ti permette di gestire i buoni pasto per i tuoi figli.',
            style: TitilliumTextStyles.body(),
          )
        ],
      ),
    );
  }
}
