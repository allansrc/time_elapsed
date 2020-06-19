library time_elapsed;

class TimeElapsed {
  String fromDateStr(strTime) {
    /// if time is greater than a week {first checks > writtn on memo}
    final int diffDays =
        DateTime.parse(strTime).difference(DateTime.now().toUtc()).inDays;

    if (diffDays <= -7) {
      final int week = (diffDays ~/ -7).toInt();

      /// calcs Week

      return week.toString().replaceAll('-', '') + 'w';
    } else if (diffDays <= -1 && diffDays > -7) {
      /// return days > still same increment on memo
      return diffDays.toString().replaceAll('-', '') + 'd';
    } else {
      final int diffHours =
          DateTime.parse(strTime).difference(DateTime.now().toUtc()).inHours;

      /// if not {third checks > 2° writtn on memo}
      if (diffHours <= -1) {
        return diffHours.toString().replaceAll('-', '') + 'h';
      } else {
        /// if not {last checks > last writtn on memo}
        final int diffMin = DateTime.parse(strTime)
            .difference(DateTime.now().toUtc())
            .inMinutes;
        return diffMin.toString().replaceAll('-', '') + 'm';
      }
    }
  }

  String fromDateTime(DateTime time) {
    /// if time is greater than a week {first checks > writtn on memo}
    final int diffDays = time.difference(DateTime.now().toUtc()).inDays;

    if (diffDays <= -7) {
      final int week = (diffDays ~/ -7).toInt();

      /// calcs Week

      return week.toString().replaceAll('-', '') + 'w';
    } else if (diffDays <= -1 && diffDays > -7) {
      /// return days > still same increment on memo
      return diffDays.toString().replaceAll('-', '') + 'd';
    } else {
      final int diffHours = time.difference(DateTime.now().toUtc()).inHours;

      /// if not {third checks > 2° writtn on memo}
      if (diffHours <= -1) {
        return diffHours.toString().replaceAll('-', '') + 'h';
      } else {
        /// if not {last checks > last writtn on memo}
        final int diffMin = time.difference(DateTime.now().toUtc()).inMinutes;
        return diffMin.toString().replaceAll('-', '') + 'm';
      }
    }
  }
}
