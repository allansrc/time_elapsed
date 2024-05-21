import 'package:test/test.dart';
import 'package:time_elapsed/time_elapsed.dart';

void main() {
  group('TimeElapsed', () {
    // TODO: Get this test better
    test('fromDateStr() should return the correct time elapsed string', () {
      // Test case 1: Test for a date older than a week
      var timeElapsed = TimeElapsed.fromDateStr('2024-05-01');
      expect(timeElapsed, equals('2w'));

      // Test case 2: Test for a date older than a day but less than a week
      timeElapsed = TimeElapsed.fromDateStr('2024-05-17');
      expect(timeElapsed, equals('4d'));

      // Test case 3: Test for a date older than an hour but less than a day
      timeElapsed = TimeElapsed.fromDateStr('2024-05-20 23:00:00');
      expect(timeElapsed, equals('13h'));

      // Test case 4: Test for a date older than a minute but less than an hour
      timeElapsed = TimeElapsed.fromDateStr('2024-05-21 12:39:00');
      expect(timeElapsed, equals('9m'));

      // Test case 5: Test for a date within the current minute
      timeElapsed = TimeElapsed.fromDateStr(DateTime.now().toUtc().toString());
      expect(timeElapsed, equals('Now'));
    });

    // TODO: Get this test better
    test('fromDateTime() should return the correct time elapsed string', () {
      // Test case 1: Test for a date older than a week
      var timeElapsed = TimeElapsed.fromDateTime(DateTime(2024, 5, 1));
      expect(timeElapsed, equals('2w'));

      // Test case 2: Test for a date older than a day but less than a week
      timeElapsed = TimeElapsed.fromDateTime(DateTime(2024, 5, 17));
      expect(timeElapsed, equals('4d'));

      // Test case 3: Test for a date older than an hour but less than a day
      timeElapsed = TimeElapsed.fromDateTime(DateTime(2024, 5, 20, 23));
      expect(timeElapsed, equals('13h'));

      // Test case 4: Test for a date older than a minute but less than an hour
      timeElapsed = TimeElapsed.fromDateTime(DateTime(2024, 5, 21, 12, 50));
      expect(timeElapsed, equals('5m'));

      // Test case 5: Test for a date within the current minute
      timeElapsed = TimeElapsed.fromDateTime(DateTime.now().toUtc());
      expect(timeElapsed, equals('Now'));
    });

    // TODO: Get this test better
    test('elapsedTime() should return the correct time elapsed string', () {
      // Test case 1: Test for a DateTime object
      expect(TimeElapsed.elapsedTime(DateTime(2024, 5, 17)), equals('4d'));
      expect(TimeElapsed.elapsedTime(DateTime(2024, 5, 13)), equals('1w'));

      // Test case 2: Test for a date string
      expect(TimeElapsed.elapsedTime('2024-05-17'), equals('4d'));
      expect(TimeElapsed.elapsedTime('2024-05-13'), equals('1w'));
    });

    // TODO: Get this test better
    test('toCustomTimeElapsed() should return the custom time elapsed string',
        () {
      final customTime = CustomTimeElapsed(
        now: 'Agora',
        seconds: 'Segundos',
        minutes: 'Minutos',
        hours: 'Horas',
        days: 'Dias',
        weeks: 'Semanas',
      );

      // Test case 1: Test for 'w'/'week' format
      var timeElapsed = TimeElapsed.elapsedTime(DateTime(2024, 5, 3));
      expect(timeElapsed.toCustomTimeElapsed(customTime), equals('2 Semanas'));

      // Test case 2: Test for 'd'/'days' format
      timeElapsed = TimeElapsed.elapsedTime(DateTime(2024, 5, 17));
      expect(timeElapsed.toCustomTimeElapsed(customTime), equals('4 Dias'));

      // Test case 3: Test for 'h'/'hours' format
      timeElapsed = TimeElapsed.elapsedTime(DateTime(2024, 5, 21, 8));
      expect(timeElapsed.toCustomTimeElapsed(customTime), equals('5 Horas'));

      // Test case 4: Test for 'm'/'minutes' format
      timeElapsed = TimeElapsed.elapsedTime(DateTime(2024, 5, 21, 13));
      expect(timeElapsed.toCustomTimeElapsed(customTime), equals('8 Minutos'));

      // Test case 6: Test for other formats
      timeElapsed = TimeElapsed.elapsedTime(DateTime.now());
      expect(timeElapsed.toCustomTimeElapsed(customTime), equals('Agora'));
    });
  });
}
