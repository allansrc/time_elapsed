TimeElapsed
====

This package provides a way to facility how you getting elapsed time from a DateTime data. More applied to check how long from now an event happened.

## Default:
It return elapsed time by **Weeks**, **Days**, **Hours** and **Minutes**


## How to use:

The package has a two method to get date time elapsed: ```fromDateStr()``` and ```fromDateTime()```
You can also use a dynamic parsin method: ```elapsedTimeDynamic()```

You can pass it as String or DateTime type:


      String timeString = "2020-04-19 03:48:57.063773"; // set a String type var with Date sample
      DateTime timeDate = DateTime.parse("2020-04-19 03:48:57.063773"); // set a DateTime var sample

      // to calculate from String
      String timeStamp = TimeElapsed().fromDateStr(timeString); // returns 8w (cos now days:2020-06-19)
      
      // to calculate from DateTime
      String timeStamp = TimeElapsed().fromDateTime(timeDate); // returns 8w (cos now days: 2020-06-19)


If you do not know what type data is, (String or DateTime):

      // to calculate from both, DateTime or String
      String timeStamp = TimeElapsed().elapsedTimeDynamic(timeDate); // returns 8w (cos now days: 2020-06-19)

      
      
### both methods will return the time elapsed as String 
        

## Example:
[Example app](https://github.com/allansrc/time_elapsed/tree/master/example)
 it run Time elapsed by clicking FAB.

pay attemtion on indent pubspec
