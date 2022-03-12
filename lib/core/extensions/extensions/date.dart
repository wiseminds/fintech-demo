import 'dart:math';

extension Format on DateTime {
  /// format date as [day]$[delimeter]$[month]$[delimeter]$[year]
  String format([String delimeter = '/', bool invert = false]) {
    var date = toLocal();
    int year = date.year;
    int month = date.month;
    int day = date.day;
    if (invert) return '$year$delimeter$month$delimeter$day';
    return '$day$delimeter$month$delimeter$year';
  }

  String get readableFormat {
    var date = toLocal();
    int year = date.year;
    String month = monthNames[max(min(date.month - 1, 13), 0)];
    int day = date.day;
    return '$month $day $year';
  }

  String get readableFormatMin {
    var date = toLocal();
    // int year = date.year;
    String month = monthNamesMin[max(min(date.month - 1, 13), 0)];
    int day = date.day;
    return '$month $day';
  }

  String readableFormatCompact(DateTime endDate) {
    var date = toLocal();
    // int year = date.year;
    String month1 = monthNamesMin[max(min(date.month - 1, 13), 0)];
    String month2 = monthNamesMin[max(min(endDate.month - 1, 13), 0)];
    int day1 = date.day;
    int day2 = endDate.day;
    if (month1 == month2) return '$day1 - $day2 $month1';
    return '$day1 $month1 - $day2 $month2';
  }

  String get readableFormatNoYear {
    var date = toLocal();
    String month = monthNames[max(min(date.month - 1, 13), 0)];
    int day = date.day;
    return '$month $day';
  }

  /// show Month in full text, show day and time, if date is today,
  /// tommorow or yesterday, it returns the string respectively
  String get readableFormatRefined {
    var now = DateTime.now();
    var midNightToday = DateTime(now.year, now.month, now.day);
    var midNightYesterday = midNightToday.subtract(Duration(days: 1));
    var midNightTommorow = midNightToday.add(Duration(days: 1));
    var afterTommorow = midNightToday.add(Duration(days: 2));
    var _date = this;
    if (_date == null) return '';
    if (_date.year != now.year) return _date.readableFormat;
    if (_date.isAfter(afterTommorow)) return _date.readableFormat;
    if (_date.isAfter(midNightTommorow)) return 'Tommorow';
    if ((_date.isBefore(midNightTommorow) && (_date.isAfter(midNightToday))))
      return 'Today';
    if ((_date.isAfter(midNightYesterday) && (_date.isBefore(midNightToday))))
      return 'Yesterday';
    return _date.readableFormat;
  }

  // bool isToday(DateTime date) {
  //   var _d = DateTime(date.year, date.month, date.day);
  // }

  /// show Month in full text, show day and time, if date is today,
  /// tommorow or yesterday, it returns the string respectively
  String get readableFormatRefinedMin {
    var now = DateTime.now();
    var _date = this;
    if (_date == null) return '';
    if (_date.year != now.year) return _date.readableFormat;
    if (_date.difference(now).inDays > 1) return _date.readableFormatMin;
    if (_date.difference(now).inDays == 1) return 'Tommorow';
    if (_date.difference(now).inDays == 0 && _date.day == now.day)
      return _date.time; //?? 'Today';
    if (_date.difference(now).inDays == 0 && _date.day > now.day)
      return 'Tommorow';
    if (_date.difference(now).inDays == 0 && _date.day < now.day)
      return 'Yesterday';
    if (_date.difference(now).inDays == -1) return 'Yesterday';
    return _date.readableFormatMin;
  }

  /// show Month in full text, show day and time, if date is today,
  /// tommorow or yesterday, it returns the string respectively
  String get readableFormatRefinedNoYear {
    var now = DateTime.now();
    var _date = this;
    if (_date == null) return '';
    if (_date.year != now.year) return _date.readableFormatNoYear;
    if (_date.difference(now).inDays > 1) return _date.readableFormatNoYear;
    if (_date.difference(now).inDays == 1) return 'Tommorow';
    if (_date.difference(now).inDays == 0 && _date.day == now.day)
      return 'Today';
    if (_date.difference(now).inDays == 0 && _date.day > now.day)
      return 'Tommorow';
    if (_date.difference(now).inDays == 0 && _date.day < now.day)
      return 'Yesterday';
    if (_date.difference(now).inDays == -1) return 'Yesterday';
    return _date.readableFormat;
  }

  String get formatWithTime {
    var date = toLocal();
    int year = date.year;
    String month = monthNames[max(min(this.month - 1, 13), 0)];
    int day = date.day;
    int hour = date.hour;
    int minute = this.minute;
    return '$month $day, $year at ${_formatTime(hour, minute)}';
  }

  String _formatTime(int hour, int min) {
    String m = '$min';
    if (min < 10) m = '0$min';
    if (hour < 10)
      return '0$hour:$min AM';
    else if (hour < 13) {
      if (hour == 12 && min == 0) return '$hour:00 NOON';
      if (hour == 12) return '$hour:$min PM';
      return '$hour:$min AM';
    } else
      return '${hour - 12}:$m PM';
  }

  String get time {
    var date = this;
    int hour = date.hour;
    int minute = this.minute;
    return _formatTime(hour, minute);
  }

  String get time24 {
    var date = this;
    int hour = date.hour;
    int minute = this.minute;
    int second = this.second;
    return '$hour:$minute:$second';
  }
}

const List<String> monthNames = <String>[
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December',
];

const List<String> monthNamesMin = const <String>[
  'Jan',
  'Feb',
  'March',
  'April',
  'May',
  'June',
  'July',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec',
];
