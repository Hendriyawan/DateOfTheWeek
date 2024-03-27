import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

void main(List<String> arguments) async {
  await initializeDateFormatting('id_ID', '');
  var currentDate = DateTime.now();
  print('\nNOW : $currentDate\n');
  var dateWeek = await getDateOfTheWeek(currentDate);
  String green = '\x1B[32m';
  // ANSI escape code for reset color
  String reset = '\x1B[0m';

  for (var item in dateWeek) {
    if (item['date'] == currentDate.day) {
      print('$green$item$reset');
    } else {
      print(item);
    }

  }
}

///GET DATE OF THE WEEK
Future<List<Map<String, dynamic>>> getDateOfTheWeek(
    DateTime currentDate) async {
  var firstWeek = currentDate.subtract(Duration(days: currentDate.weekday % 7));
  var lastWeek = currentDate.add(Duration(days: 6 - currentDate.weekday));
  List<Map<String, dynamic>> result = [];

  for (int i = 0; i <= lastWeek.difference(firstWeek).inDays; i++) {
    var dateTime = firstWeek.add(Duration(days: i));
    var dayName = DateFormat.EEEE('id_ID').format(dateTime);
    result.add(
      {
        "day": dayName,
        "date": dateTime.day,
        "month": dateTime.month,
        "year": dateTime.year,
      },
    );
  }
  return result;
}
