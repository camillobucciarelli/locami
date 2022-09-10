part of 'translation_cubit.dart';

abstract class TranslationState extends Equatable {
  const TranslationState();
}

class TranslationInitial extends TranslationState {
  @override
  List<Object> get props => [];
}

class TranslationData extends TranslationState {
  final Map<String, dynamic> json;

  const TranslationData(this.json);

  @override
  List<Object?> get props => [json];
}
