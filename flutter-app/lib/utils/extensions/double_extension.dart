extension DoubleExtension on double {
  static const int _defaultDecimals = 2;

  String toStringWholeNumber({int decimals = _defaultDecimals}) {
    if (truncate() == this) {
      return toStringAsFixed(0);
    }

    return toStringAsFixed(decimals);
  }
}
