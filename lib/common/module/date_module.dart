import 'package:intl/intl.dart';
import 'package:dop_xtel/common/core/base_function.dart';

class DateModule {
  static const String DDMMYYYYHMS = 'dd/MM/yyyy HH:mm:ss';
  static const String YYYYMMDDHMS = 'yyyy/MM/dd HH:mm:ss';

  static String? convertTo(String data, String currentPattern, String toPattern) {
    try {
      return DateFormat(toPattern).format(DateFormat(currentPattern).parse(data));
    } catch (exception) {
      showError(exception.toString());
    }
  }

  static String? format(DateTime currentDate, String toPattern) {
    try {
      return DateFormat(toPattern).format(currentDate);
    } catch (exception) {
      showError(exception.toString());
    }
  }

  static DateTime? parse(String data, String toPattern) {
    try {
      return DateFormat(toPattern).parse(data);
    } catch (exception) {
      showError(exception.toString());
    }
  }
}
