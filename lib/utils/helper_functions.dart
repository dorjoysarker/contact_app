import 'package:intl/intl.dart';

String getFormattedDate(DateTime? dt, {String pattern = 'dd/MM/yyyy'}) {
  if(dt == null) return 'No data choser';
  return DateFormat(pattern).format(dt);
}