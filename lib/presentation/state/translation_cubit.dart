import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../data/data_source/translations_data_source.dart';

part 'translation_state.dart';

@injectable
class TranslationCubit extends Cubit<TranslationState> {
  final TranslationsDataSource _translationsDataSource;
  TranslationCubit(this._translationsDataSource) : super(const TranslationData({}));

  void loadTranslations(String locale, String? country) async {
    final json = await _translationsDataSource.getStringsForLocale(locale, country);
    emit(TranslationData(json));
  }

  void saveTranslations(String locale, String? country) async {
    if (state is TranslationData) {
      await _translationsDataSource.saveStringsForLocale(locale, country, (state as TranslationData).json);
    }
  }

  void addTranslation(String key, String value) {
    if (state is TranslationData) {
      final json = {...(state as TranslationData).json};
      json.putIfAbsent(key, () => value);
      emit(TranslationData(json));
    }
  }

  void removeTranslation(String key) {
    if (state is TranslationData) {
      final json = {...(state as TranslationData).json};
      json.remove(key);
      emit(TranslationData(json));
    }
  }

  void updateTranslation(String key, String value) {
    if (state is TranslationData) {
      final json = {...(state as TranslationData).json};
      json.update(key, (dynamic _) => value);
      emit(TranslationData(json));
    }
  }
}
