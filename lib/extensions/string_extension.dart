import 'package:intl/intl.dart';

extension StringExtension on String {
  double parseDouble() =>
      double.tryParse(this) ?? int.tryParse(this)?.toDouble() ?? 0;

  int parseInt() => int.tryParse(this) ?? 0;

  DateTime parseDateTime() {
    if (isEmpty) {
      return DateTime.now();
    }
    return DateFormat('yyyy-MM-ddTHH:mm:ss').parse(this);
  }

  String enumToString() => split('.')[1];

  String capitalizeFirstLetter() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
