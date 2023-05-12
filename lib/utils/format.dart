import 'package:intl/intl.dart';

String formatCurrency({
  required double price,
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

String formatDateTime({
  required DateTime dateTime,
  required String mode,
}) {
  DateFormat f = DateFormat(
    mode,
    'en_US',
  );
  return f.format(dateTime);
}
