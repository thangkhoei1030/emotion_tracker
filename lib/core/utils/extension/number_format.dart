import 'package:emotion_tracker/core/src_core.dart';

extension NumberFormat on String? {
  double toDoubleEtx([double numbCheck = 0]) =>
      double.tryParse(this ?? "") ?? numbCheck;
  int toIntEtx([int numbCheck = 1]) => int.tryParse(this ?? "") ?? numbCheck;
}

extension FormatMoney on num? {
  String formatMoney() => "${formatNumber()} \u20AB";

  String formatNumber() => CurrencyUtils.formatCurrency(this);
}

extension FormatNumberToTimer on int {
  String convertToHM() {
    int h = this ~/ 60;
    int s = this % 60;
    return "${_addZeroIfNeeded(h)} : ${_addZeroIfNeeded(s)}";
  }

  String _addZeroIfNeeded(int value) {
    return value < 10 ? "0$value" : "$value";
  }
}
