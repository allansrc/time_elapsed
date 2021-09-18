library time_elapsed;

/// Method [fromDateStr()] returns a [date] calculated by a provided [date type as String]
/// its return is like this provided date until [DateTime.now()], output '9m' // 9 minutes ago,
/// - If provided date is older [fromDateStr] will check and return as Week, Day(s),
///  Hour(s), or minute(s)
/// - If you want pass [date] as DateTime format, you should use [fromDateTime()] method
/// - If you don't know what type is your data, or if your date is dynamic [String and  DateType],
///  you can use [elapsedTimeDynamic()] method to pick time elapsed.

class TimeElapsed {
  external String fromCustomWDHMS(
    String weekStr,
    String dayStr,
    String hourStr,
    String minuteStr,
    String secondStr,
    String nowStr,
  );
  static String fromDateStr(String strTime) {
    /// if time is greater than a week {first checks > writtn on memo}
    final diffDays = DateTime.parse(strTime).difference(DateTime.now().toUtc()).inDays;

    if (diffDays <= -7) {
      final week = (diffDays ~/ -7).toInt();

      /// calcs Week

      return week.toString().replaceAll('-', '') + 'w';
    } else if (diffDays <= -1 && diffDays > -7) {
      /// return days > still same increment on memo
      return diffDays.toString().replaceAll('-', '') + 'd';
    } else {
      final diffHours = DateTime.parse(strTime).difference(DateTime.now().toUtc()).inHours;

      /// if not {third checks > 2° writtn on memo}
      if (diffHours <= -1) {
        return diffHours.toString().replaceAll('-', '') + 'h';
      } else {
        /// if not {last checks > last writtn on memo}
        final diffMin = DateTime.parse(strTime).difference(DateTime.now().toUtc()).inMinutes;
        if (diffMin <= -1) {
          return diffMin.toString().replaceAll('-', '') + 'm';
        } else {
          return 'Now';
        }
      }
    }
  }

  static String fromDateTime(DateTime time) {
    /// if time is greater than a week {first checks > writtn on memo}
    final diffDays = time.difference(DateTime.now().toUtc()).inDays;

    if (diffDays <= -7) {
      final week = (diffDays ~/ -7).toInt();

      /// calcs Week

      return week.toString().replaceAll('-', '') + 'w';
    } else if (diffDays <= -1 && diffDays > -7) {
      /// return days > still same increment on memo
      return diffDays.toString().replaceAll('-', '') + 'd';
    } else {
      final diffHours = time.difference(DateTime.now().toUtc()).inHours;

      /// if not {third checks > 2° writtn on memo}
      if (diffHours <= -1) {
        return diffHours.toString().replaceAll('-', '') + 'h';
      } else {
        /// if not {last checks > last writtn on memo}
        final diffMin = time.difference(DateTime.now().toUtc()).inMinutes;
        if (diffMin <= -1) {
          return diffMin.toString().replaceAll('-', '') + 'm';
        } else {
          return 'Now';
        }
      }
    }
  }

  /// Method to parse data even if it is String or DateTime
  /// TimeElapsed().elapsedTimeDynamic(yourDate);
  static String elapsedTimeDynamic(dynamic date) {
    if (date!.runtimeType == DateTime) {
      return fromDateTime(date);
    } else {
      return fromDateStr(date);
    }
  }
}
