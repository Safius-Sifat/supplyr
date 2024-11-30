import 'package:intl/intl.dart';

String formatTime(String time) {
  final String timeStamp24HR = '2020-07-20T$time';
  final dateTime = DateTime.parse(timeStamp24HR);
  return DateFormat.jm().format(dateTime);
}
