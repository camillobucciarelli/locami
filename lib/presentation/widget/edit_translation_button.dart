import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locale_manager/presentation/widget/translation_form_dialog.dart';

import '../state/translation_cubit.dart';

class EditTranslationButton extends StatefulWidget {
  final MapEntry<String, dynamic> entry;

  const EditTranslationButton({
    super.key,
    required this.entry,
  });

  @override
  State<EditTranslationButton> createState() => _EditTranslationButtonState();
}

class _EditTranslationButtonState extends State<EditTranslationButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final result = await openTranslationFormDialog(
          context,
          title: 'Update translation',
          key: widget.entry.key,
          value: widget.entry.value,
        );
        if (result != null && mounted) {
          context.read<TranslationCubit>().updateTranslation(result[0], result[1]);
        }
      },
      child: const Text('Edit'),
    );
  }
}
