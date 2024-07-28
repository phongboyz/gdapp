import 'package:easy_localization/easy_localization.dart';
import 'package:gd/generated/locale_keys.g.dart';

class FixMoney {
  static double money(double num) {
    return double.parse(num.toStringAsFixed(2).toString());
  }


  static String formateMoneyTHB(double double) {
    var oCcy = NumberFormat.currency(
        name: 'EURO',
        // customPattern: '#.### \u00a4',
        symbol: '',
        decimalDigits: 2);
    String value = oCcy.format(double);
    return '฿$value';
  }

  static String formateMoneyCNY(double double) {
    var oCcy =
        NumberFormat.currency(name: 'EURO', symbol: '', decimalDigits: 2);
    String value = oCcy.format(double);
    return '¥$value';
  }

  static String formateMoneyKIB(double double) {
    var oCcy =
        NumberFormat.currency(name: 'EURO', symbol: '', decimalDigits: 2);
    String value = oCcy.format(double);
    return '$value ${LocaleKeys.kKip.tr()}';
  }

  static String fixDouble(double double) {
    var oCcy =
        NumberFormat.currency(name: 'EURO', symbol: '', decimalDigits: 2);
    String value = oCcy.format(double);
    return value;
  }

  static double fixDoubleNotPoint(double num) {
    return double.parse(num.toStringAsFixed(2).toString());
  }
}