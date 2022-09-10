import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locale_manager/presentation/widget/translation_form_dialog.dart';

import '../state/translation_cubit.dart';

class AddNewTranslationButton extends StatefulWidget {
  const AddNewTranslationButton({super.key});

  @override
  State<AddNewTranslationButton> createState() => _AddNewTranslationButtonState();
}

class _AddNewTranslationButtonState extends State<AddNewTranslationButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final result = await openTranslationFormDialog(context, title: 'Add new translation');
        if (result != null && mounted) {
          context.read<TranslationCubit>().addTranslation(result[0], result[1]);
        }
      },
      child: const Text('Add new translation'),
    );
  }
}
