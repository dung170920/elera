import 'package:intl/intl.dart';

String formatCurrency({
  required double price,
  // required BuildContext context,
  int? decimalDigits,
  String? symbol,
}) {

  NumberFormat f = NumberFormat.currency(
    locale: 'en_US',
    decimalDigits: decimalDigits ?? 0,
    symbol: symbol ?? "",
  );
  return f.format(price);
}
