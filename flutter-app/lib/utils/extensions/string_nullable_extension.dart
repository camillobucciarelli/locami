extension StringNullableExtension on String? {
  bool get isNullOrEmpty => this == null || this == '';

  bool get isNotNullOrEmpty => this != null && this != '';
}
