//
//Add your APP ID in variable appId
//
import 'package:intl/intl.dart';

class Util {
  static String appId = '';

  static String getFormattedDate(DateTime dateString) {
    return DateFormat(" E hh:mm a \n yyyy-MM-dd").format(dateString);
  }

  static String getFormattedDay(DateTime dateString) {
    return DateFormat("E").format(dateString);
  }
}
