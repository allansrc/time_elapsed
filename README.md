# TimeElapsed [![pub package](https://img.shields.io/badge/pub-0.2.6-blue)](https://pub.dev/packages/time_elapsed) ![](https://img.shields.io/pypi/l/billiard)

This package provides a way to facility how you getting elapsed time from a DateTime data. More applied to check how long from now an event happened.

## Default:

It return elapsed time by **Weeks**, **Days**, **Hours** and **Minutes**

## How to use:

The package has a two method to get date time elapsed: `fromDateStr()` and `fromDateTime()`
You can also use a dynamic parsin method: `elapsedTimeDynamic()`

You can pass it as String or DateTime type:

      String timeString = "2020-04-19 03:48:57.063773"; // set a String type var with Date sample
      DateTime timeDate = DateTime.parse("2020-04-19 03:48:57.063773"); // set a DateTime var sample

      // to calculate from String
      String timeStamp = TimeElapsed.fromDateStr(timeString); // returns 8w (cos now days:2020-06-19)

      // to calculate from DateTime
      String timeStamp = TimeElapsed.fromDateTime(timeDate); // returns 8w (cos now days: 2020-06-19)

If you do not know what type data is, (String or DateTime):

      // to calculate from both, DateTime or String
      String timeStamp = TimeElapsed.elapsedTimeDynamic(timeDate); // returns 8w (cos now days: 2020-06-19)

#### both methods will return the time elapsed as String

### Using Custom Markers for Time (Days, weeks, hours etc...)

To adds a custom texts or change the text near to period elapsed you can use `.toCustomTimeElapsed()` method. This method receives an object from CustomTimeElapsed class which contains all period we use.

```
// custom Time String marker
   final customDate = CustomTimeElapsed(
      minutes: 'minutos',
      hours: 'horas',
      days: 'dias',
      now: 'agora',
      seconds: 'segundos',
      weeks: 'semanas',
    );

// Widget that output "76 semanas" instead of "76w"
Text(TimeElapsed.fromDateStr(_timeString).toCustomTimeElapsed(customDate))
```

### \_

In another hand, if you prefer, you can pass as params too using `.toCustomWDHMS()`.

```
toCustomWDHMS(
      minutes: 'minutos',
      hours: 'horas',
      days: 'dias',
      now: 'agora',
      seconds: 'segundos',
      weeks: 'semanas',
    )
```

## Example:

[This example app shows all implementations](https://github.com/allansrc/time_elapsed/tree/master/example)

| App shot                                                                                                                                                                                           |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| <img src="https://github.com/allansrc/time_elapsed/blob/master/example/screens/Simulator%20Screen%20Shot%20-%20iPhone%2011%20Pro%20Max%20-%202020-06-20%20at%2022.23.22.png?raw=true" width="250"> |

Have a Nice Code!
