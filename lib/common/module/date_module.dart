import 'package:intl/intl.dart';
import 'package:shop_all_fe/common/core/base_function.dart';

class DateModule {
  static const String DDMMYYYYHMS = 'dd/MM/yyyy HH:mm:ss';
  static const String YYYYMMDDHMS = 'yyyy/MM/dd HH:mm:ss';

  static String? convertTo(String currentDate, String currentPattern, String toPattern) {
    try {
      return DateFormat(toPattern).format(DateFormat(currentPattern).parse(currentDate));
    } catch (exception) {
      showError(exception.toString());
      return null;
    }
  }

  static String? parseTo(DateTime currentDate, String toPattern) {
    try {
      return DateFormat(toPattern).format(currentDate);
    } catch (exception) {
      showError(exception.toString());
      return null;
    }
  }
}
