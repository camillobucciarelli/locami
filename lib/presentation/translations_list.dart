import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locale_manager/core/dependency_injection/dependency_injection.dart';
import 'package:locale_manager/presentation/state/translation_cubit.dart';
import 'package:locale_manager/presentation/widget/remove_translation_button.dart';

import 'widget/add_new_translation_button.dart';
import 'widget/edit_translation_button.dart';

class TranslationsList extends StatelessWidget {
  const TranslationsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TranslationCubit>(
      create: (context) => injector(),
      child: BlocBuilder<TranslationCubit, TranslationState>(
        builder: (context, state) {
          if (state is TranslationData) {
            return ListView(
              padding: const EdgeInsets.all(20),
              children: [
                ...state.json.entries.map(_buildEntry),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: UnconstrainedBox(
                    child: AddNewTranslationButton(),
                  ),
                ),
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _buildEntry(MapEntry<String, dynamic> entry) {
    return ListTile(
      title: Text(entry.key),
      subtitle: Text(entry.value),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          EditTranslationButton(entry: entry),
          RemoveTranslationButton(entry: entry),
        ],
      ),
    );
  }
}
