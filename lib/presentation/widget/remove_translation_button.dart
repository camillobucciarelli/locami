import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locale_manager/presentation/widget/translation_form_dialog.dart';

import '../state/translation_cubit.dart';

class RemoveTranslationButton extends StatefulWidget {
  final MapEntry<String, dynamic> entry;

  const RemoveTranslationButton({
    super.key,
    required this.entry,
  });

  @override
  State<RemoveTranslationButton> createState() => _RemoveTranslationButtonState();
}

class _RemoveTranslationButtonState extends State<RemoveTranslationButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final result = await showOkCancelAlertDialog(
          context: context,
          title: 'Delete key',
          message: 'Are you sure you want to delete this key?',
          okLabel: 'Delete',
          cancelLabel: 'Cancel',
          barrierDismissible: false,
        );
        if (result == OkCancelResult.ok && mounted) {
          context.read<TranslationCubit>().removeTranslation(widget.entry.key);
        }
      },
      child: const Text('Remove'),
    );
  }
}
