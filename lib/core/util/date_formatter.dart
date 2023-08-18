import 'package:intl/intl.dart';

class DateFormatter {
  static String formatDateString(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    DateFormat formatter = DateFormat("d MMM y");
    return formatter.format(dateTime);
  }
}
