import 'dart:developer';

import 'package:time_elapsed/time_elapsed.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // date current as String
    String _timeString = "2020-04-19 03:48:57.063773";

    // date current as DateTime
    DateTime _timeDate = DateTime.parse(_timeString);

    // date current as String
    String _timeStamp = DateTime.now().toString();

    // onject that contains Custom Strings Data format
    final customDate = CustomTimeElapsed(
      minutes: 'minutos',
      hours: 'horas',
      days: 'dias',
      now: 'agora',
      seconds: 'segundos',
      weeks: 'semanas',
    );

    // to calculate from String
    _timeString = TimeElapsed.fromDateStr(_timeString);
    // to calculate from DateTime
    _timeStamp = TimeElapsed.fromDateTime(_timeDate);

    log(_timeString.toString());
    log(_timeStamp.toString());

    log(DateTime.now().toString());

    final localizedString = CustomTimeElapsed(
      now: 'agora',
      seconds: 'segundos',
      minutes: 'minutos',
      hours: 'horas',
      days: 'dias',
      weeks: 'semanas',
    );

    log(_timeString.toCustomTimeElapsed(localizedString));
    log(_timeStamp.toCustomTimeElapsed(localizedString));

    return Scaffold(
      appBar: AppBar(title: Text('Time Elapsed Demo')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            // color: Theme.of(context).primaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                  color: Colors.amber[200],
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "from string: " +
                          TimeElapsed.fromDateStr(_timeString)
                              .toCustomTimeElapsed(customDate),
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
                Card(
                  color: Colors.amber[200],
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "from date type: " + TimeElapsed.fromDateTime(_timeDate),
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                Card(
                  color: Theme.of(context).primaryColor,
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "date now: \n" + _timeStamp,
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                ),
                Card(
                  color: Theme.of(context).primaryColor,
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "date passed: \n" + _timeString,
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                Card(
                  color: Colors.green[300],
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      // current time : 2020-06-20 21:56:50.252522
                      "just now: " +
                          TimeElapsed.fromDateStr("2020-06-20 22:23:14.194374"),
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
                Card(
                  color: Colors.green[300],
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      // current time : 2020-06-20 21:56:50.252522
                      "minutes: " +
                          TimeElapsed.fromDateStr("2020-06-20 21:56:50.252522"),
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
                Card(
                  color: Colors.green[300],
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "hours: " +
                          TimeElapsed.fromDateStr("2020-06-20 20:56:50.252522"),
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
                Card(
                  color: Colors.green[300],
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "days: " +
                          TimeElapsed.fromDateStr("2020-06-18 20:56:50.252522"),
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
                Card(
                  color: Colors.green[300],
                  child: Container(
                    padding: EdgeInsets.all(16),
                    // base time: 2020-06-20 20:56:50.252522
                    child: Text(
                      "week: " +
                          TimeElapsed.fromDateStr("2020-06-02 20:56:50.252522"),
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
