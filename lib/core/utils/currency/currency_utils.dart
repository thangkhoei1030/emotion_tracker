import 'dart:math';

import 'package:intl/intl.dart';

import '../../values/const.dart';
import '../validate.dart';

class CurrencyUtils {
  static const String invoiceSeparator = " | ";
  static const String vnd = "VNĐ";
  static const String millionSort = 'tr';
  static const String billion = 'tỷ';
  static const String moneySpaceStr = ",";
  static const int moneySpacePos = 3;

  static String formatMoney(int money) {
    if (money == 0) return "0";
    String m = money.toString();
    if (m.length <= 6) {
      return getDecimalFormattedString(m);
    } else if (m.length <= 9) {
      String milStr = m;
      String decimalStr = '';
      if (m.length == 7) {
        milStr = m.substring(0, 1);
        decimalStr = m.substring(1, 2);
      } else if (m.length == 8) {
        milStr = m.substring(0, 2);
        decimalStr = m.substring(2, 3);
      } else if (m.length == 9) {
        milStr = m.substring(0, 3);
      }

      int mil = int.parse(milStr);
      if (decimalStr.isNotEmpty) {
        int decimal = int.parse(decimalStr);
        if (decimal != 0) {
          decimalStr = ',$decimal';
        } else {
          decimalStr = '';
        }
      }

      if (mil > 0) {
        return "$mil$decimalStr $millionSort";
      } else {
        return getDecimalFormattedString(m);
      }
    } else {
      String str = m.substring(0, m.length - 6);
      int newLength = str.length;
      String tr = int.parse(str.substring(newLength - 3, newLength)).toString();
      String ty = str.substring(0, newLength - 3);
      if (int.parse(tr) > 0) {
        return "$ty $billion $tr $millionSort";
      } else {
        return "$ty $billion";
      }
    }
  }

  static String getDecimalFormattedString(String value) {
    String str1 = "";
    String str3 = "";

    String decimal =
        value.contains(".") ? value.substring(value.indexOf(".")) : "";

    if (value.contains(".")) {
      str1 = value.substring(0, value.indexOf("."));
    } else {
      str1 = value;
    }
    int i = 0;
    int j = -1 + str1.length;
    for (int k = j;; k--) {
      if (k < 0) {
        return str3 + decimal;
      }
      if (i == moneySpacePos) {
        str3 = moneySpaceStr + str3;
        i = 0;
      }
      str3 = str1[k] + str3;
      i++;
    }
  }

  static String getMoneyByCurrency(String money,
      {String currencyCode = "" //AppConst.vnd
      }) {
    if (money.isEmpty || money == "null") return "";

    return "${getDecimalFormattedString(money)} ${currencyCode.toUpperCase()}";
  }

  static String formatCurrency(
    dynamic number, {
    bool isDot = AppConst.isDot,
    bool isCheckError = false,
    int? maxLengthNum,
    dynamic customMaxValue,
  }) {
    if (number == null || number == '' || number == 0) return "0";
    String numberFormat = number.toDouble().toStringAsFixed(0);

    if (customMaxValue != null) {
      if (number > customMaxValue) {
        numberFormat = customMaxValue.toDouble().toStringAsFixed(0);
      }
    } else {
      int maxLengthNum0 = maxLengthNum ?? AppConst.currencyUtilsMaxLength;
      if (!(numberFormat == '${pow(10, maxLengthNum0)}' ||
          numberFormat == '-${pow(10, maxLengthNum0)}')) {
        if (numberFormat == '${pow(10, maxLengthNum0 + 1)}' ||
            numberFormat == '-${pow(10, maxLengthNum0 + 1)}') {
          numberFormat = numberFormat.substring(0, numberFormat.length - 1);
        } else if (numberFormat.startsWith('-') &&
            numberFormat.length >= maxLengthNum0 + 1) {
          numberFormat = numberFormat.substring(0, maxLengthNum0 + 1);
        } else if (numberFormat.length > maxLengthNum0) {
          numberFormat = numberFormat.substring(0, maxLengthNum0);
        }
      }
      if (number > pow(10, maxLengthNum0)) {
        if (isCheckError) return "Lỗi";
        numberFormat = '${pow(10, maxLengthNum0)}';
      }
    }

    return NumberFormat.currency(
      locale: isDot ? 'vi_VN' : 'en_US',
      symbol: '',
      decimalDigits: 0,
    )
        .format(formatNumberCurrency(
          numberFormat,
          isDot: isDot,
        ))
        .trim();
  }

  static double formatNumberCurrency(String text,
      {bool isDot = AppConst.isDot}) {
    if (text.isEmpty || text == '-') return 0;
    if (isDot) {
      return double.tryParse(text.replaceAll('.', '').replaceAll(',', '.')) ??
          0;
    }
    return double.tryParse(text.replaceAll(',', '')) ?? 0;
  }

  static double updateTaxValue(double amount, int vatRate) {
    if (vatRate <= 0) return 0;
    amount = amount * vatRate / 100;
    return amount;
  }

  static String formatCurrencyForeign(
    dynamic number, {
    bool isDot = AppConst.isDot,
    bool isCheckError = false,
    int? lastDecimal,
    int? maxLengthNum,
    dynamic customMaxValue,
    bool isConvert = true,
  }) {
    if (number == null || number == '' || number == 0 || number == '0') {
      return "0";
    }
    if (number is double) {
      number = convertDoubleToStringSmart(number);
    }

    String first = number.toString().substring(
        0,
        number.toString().contains(isDot ? ',' : '.')
            ? number.toString().lastIndexOf(isDot ? ',' : '.')
            : null);
    first = formatCurrency(
        formatNumberCurrency(
          first,
          isDot: isDot,
        ),
        isDot: isDot,
        maxLengthNum: maxLengthNum,
        isCheckError: isCheckError,
        customMaxValue: customMaxValue);

    // if (formatNumberCurrency(temp) == 0.0) {
    //   if (first.startsWith('-') && first.length >= maxLength) {
    //     first = first.substring(0, maxLength);
    //   } else if (first.length >= maxLength) {
    //     first = first.substring(0, maxLength - 1);
    //   }
    // }

    String last = number.toString().substring(
        number.toString().contains(isDot ? ',' : '.')
            ? number.toString().lastIndexOf(isDot ? ',' : '.')
            : number.toString().length,
        number.toString().length);
    int numberLast = (lastDecimal ?? 6) + 2;
    if (last.length >= numberLast) {
      last = last.substring(0, numberLast - 1);
    }
    String result = NumberFormat.currency(
          locale: isDot ? 'vi_VN' : 'en_US',
          symbol: '',
          decimalDigits: 0,
        )
            .format(
              formatNumberCurrency(
                first,
                isDot: isDot,
              ),
            )
            .trim() +
        last;
    return result;
  }

  static String formatNumberBarChart(double number) {
    final isNegative = number < 0;

    /// billion number
    double billion = 1000000000;

    /// million number
    double million = 1000000;

    /// kilo (thousands) number
    double kilo = 1000;
    if (isNegative) {
      number = number.abs();
    }

    String resultNumber;
    String symbol;
    if (number >= billion) {
      resultNumber = (number / billion).toStringAsFixed(1);
      symbol = 'Tỷ';
    } else if (number >= million) {
      resultNumber = (number / million).toStringAsFixed(1);
      symbol = 'Tr';
    } else if (number >= kilo) {
      resultNumber = (number / kilo).toStringAsFixed(1);
      symbol = 'K';
    } else {
      resultNumber = number.toStringAsFixed(1);
      symbol = '';
    }

    if (resultNumber.endsWith('.0')) {
      resultNumber = resultNumber.substring(0, resultNumber.length - 2);
    }

    if (isNegative) {
      resultNumber = '-$resultNumber';
    }

    return resultNumber + symbol;
  }
}
