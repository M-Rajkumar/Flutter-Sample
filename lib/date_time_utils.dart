import 'package:intl/intl.dart';

class DateTimeUtils {
  static String dateFormat1 = 'MMM dd, yyyy';
  static String dateFormat2 = 'dd-MM-yyyy';
  static String dateFormat3 = 'MMM dd yyyy, h:mm a';
  static String dateFormat4 = 'yyyy-MM-dd HH:mm:ss';

  static String currentDateConversion(String dateFormat) {
    String formattedDate = '';
    try {
      DateTime now = DateTime.now();
      return formattedDate = DateFormat(dateFormat).format(now);
    } catch (error) {
      print('Date Conversion Error --> $error');
    }
    return formattedDate;
  }

  static String dateStringFormat(String dateFormat, DateTime dateTime) {
    String formattedDate = '';
    if (dateTime != null && dateFormat != null) {
      try {
        return formattedDate = DateFormat(dateFormat).format(dateTime);
      } catch (error) {
        print('Date Format Error --> $error');
      }
    }
    return formattedDate;
  }

  static DateTime dateTimeFormat(String dateFormat, String dateTime) {
    DateTime formattedDate;
    if (dateTime != null && dateFormat != null) {
      try {
        DateFormat date = DateFormat(dateFormat);
        return formattedDate = date.parse(dateTime);
      } catch (error) {
        print('Date Format Error --> $error');
      }
    }
    print('Date Time Format value -->${formattedDate.toString()}');
    return formattedDate;
  }

  static bool dateComparison(String dateFormat, String startDate, String endDate) {
    if (startDate != null && startDate != '' && endDate != null && endDate != '') {
      try {
        DateFormat date = DateFormat(dateFormat);
        var date1 = date.parse(startDate);
        var date2 = date.parse(endDate);
        print('Date comparsion --> ${date1.isBefore(date2)}');
        return date1.isBefore(date2);
      } catch (error) {
        print('Date Comparsion Error --> $error');
      }
    }
    return false;
  }
}
