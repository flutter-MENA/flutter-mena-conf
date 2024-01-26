import 'package:intl/intl.dart';

class Utils {

  /// Format date to EEE, MMM d format
  static String formatToEEEMMMdDate(DateTime date) {
    return DateFormat('EEE, MMM d').format(date).toString();
  }


  /// Format date to HH:mm format
  static String formatToHHmmDate(DateTime date) {
    return DateFormat('HH:mm').format(date).toString();
  }




}