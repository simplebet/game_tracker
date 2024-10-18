import 'package:intl/intl.dart';

extension StringExtension on String? {
  String capitalize() {
    if (this == null) {
      ArgumentError.notNull(this);
    }

    final string = this ?? '';
    if (this!.isEmpty) return string;
    return '${string[0].toUpperCase()}${string.substring(1)}';
  }

  String capitalizeFirstOfEachWord() {
    if (this == null) {
      ArgumentError.notNull(this);
    }

    final string = this ?? '';
    if (this!.isEmpty) return string;
    final List<String> wordList = string.split(' ');

    final String result = wordList
        .map((word) {
          return word.capitalize();
        })
        .toList()
        .join(' ');

    return result;
  }

  bool get isNullEmptyOrWhitespace =>
      this == null || this!.isEmpty || this!.trim().isEmpty;
}

/// format 10000 to 100
extension IntExtension on int? {
  String toDecimalString() {
    if (this == null) {
      return '';
    }

    final String formattedInt = (this! / 100).toStringAsFixed(2);

    return formattedInt;
  }

  String toRoundedString() {
    if (this == null) {
      return '';
    }

    final String formattedInt = (this! / 100).toStringAsFixed(0);

    return formattedInt;
  }

  int toRoundedInt() {
    if (this == null) {
      return 0;
    }

    final int formattedInt = this! ~/ 100;

    return formattedInt;
  }
}

/// Sep 5 4:24 PM
/// Today 4:24 PM
String formatDate(DateTime? date) {
  if (date == null) {
    return '';
  }

  final DateTime localTime = date.toLocal();
  final todayDate =
      '${DateTime.now().month}/${DateTime.now().day}/${DateTime.now().year}';
  final currentDate = DateFormat.yMd().format(localTime);

  if (todayDate == currentDate) {
    return 'TODAY ${formatHourPMAM(date)}';
  }
  return '${DateFormat.MMMd().format(localTime)} ${formatHourPMAM(date)}';
}

/// 4:24 PM
String formatHourPMAM(DateTime? date) {
  if (date == null) {
    return '';
  }

  final DateTime localTime = date.toLocal();
  return DateFormat.jm().format(localTime);
}

/// March 31, 2022
String formatDateMonthDayYear(DateTime? date) {
  if (date == null) {
    return '';
  }

  final DateTime localTime = date.toLocal();
  return DateFormat.yMMMMd().format(localTime);
}

/// 16:24
String formatHourMin(DateTime date) {
  final DateTime localTime = date.toLocal();
  return DateFormat.Hm().format(localTime);
}

/// 03/22
String formatMonYear(DateTime date) {
  final DateTime localTime = date.toLocal();
  return DateFormat('MM/yy').format(localTime);
}

/// 9/5/22
String formatMonthDayYear(DateTime date) {
  final DateTime localTime = date.toLocal();
  return DateFormat('M/d/yy').format(localTime);
}

/// 9/5/2022
String formatMonthDayFullYear(DateTime date) {
  final DateTime localTime = date.toLocal();
  return DateFormat('M/d/yyyy').format(localTime);
}

// 9-5-2022
String formatMonthDayFullYearWithDash(DateTime date) {
  final DateTime localTime = date.toLocal();
  return DateFormat('MM-dd-yyyy').format(localTime);
}

// Mon Sep 5 4:33
// Today 4:33
({String? day, String? hour}) betrMatchDateFormat(DateTime? date) {
  if (date == null) return (day: null, hour: null);
  final DateTime dateInLocalTime = date.toLocal();

  final todayDate = DateFormat.yMd().format(DateTime.now());
  final currentDate = DateFormat.yMd().format(dateInLocalTime);

  final isToday = currentDate == todayDate;
  if (isToday) return getTodayString(dateInLocalTime);

  final dayOfTheWeek = DateFormat.E().add_MMMd().format(dateInLocalTime);

  final hourAmPm = convertToHourAmPmLowerCaseNoSpaces(dateInLocalTime);
  return (day: dayOfTheWeek, hour: hourAmPm);
}

/// 4:33pm
String convertToHourAmPmLowerCaseNoSpaces(DateTime date) =>
    DateFormat.jm().format(date).toLowerCase().replaceAll(' ', '');

/// Today 4:33pm
({String? day, String? hour}) getTodayString(
  DateTime dateInLocalTime,
) {
  final hourWithAmPm = convertToHourAmPmLowerCaseNoSpaces(dateInLocalTime);
  final dayNightPrefix = getDayNightPrefix(dateInLocalTime);
  return (day: dayNightPrefix, hour: hourWithAmPm);
}

/// 19:45: Tonight
/// 07:00 Today
String getDayNightPrefix(DateTime date) {
  final bool isNight = date.hour >= 18;
  return isNight ? 'Tonight' : 'Today';
}

/// from '2022-12-11 21:45:18.000Z' to '2022-12-08 17:04:12.201'
/// 3 (days between)
int getDaysBetween(DateTime from, DateTime to) {
  final from0 = DateTime(from.year, from.month, from.day);
  final to0 = DateTime(to.year, to.month, to.day);

  return (to0.difference(from0).inHours / 24).round();
}

String scoreIntToString(int? score) {
  return score?.toString() ?? '--';
}

String formatOrdinalSuffix(int? number) {
  if (number != null) {
    // TODO: the current logic will only work for English
    if (number >= 11 && number <= 13) {
      return 'th';
    }

    switch (number % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }
  return '';
}

String formatSelectionCode(String? selectionCode) {
  if (selectionCode == null) {
    return '';
  }

  return selectionCode.replaceAll(RegExp(r'[\W_]+'), ' ').capitalize();
}

String formatGameClock(int? gameClockSecs, {String postFix = ''}) {
  if (gameClockSecs == null) {
    return '';
  }

  String gameClock;

  final int minutes = gameClockSecs ~/ 60;
  final int seconds = gameClockSecs % 60;

  if (seconds < 10) {
    gameClock = '$minutes:0$seconds$postFix';
  } else {
    gameClock = '$minutes:$seconds$postFix';
  }

  return gameClock;
}
