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
      home: HomePage(title: 'Time Elapsed Demo'),
    );
  }
}

class HomePage extends StatelessWidget {
  final String title;

  const HomePage({Key key, this.title}) : super(key: key);
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

    void _incrementCounter() {
      _timeString = TimeElapsed.fromDateStr(_timeString); // to calculate from String
      _timeStamp = TimeElapsed.fromDateTime(_timeDate); // to calculate from DateTime

      print(_timeString.toString());
      print(_timeStamp.toString());
    }

    print(DateTime.now());

    return Scaffold(
      appBar: AppBar(title: Text(title)),
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
                      "from string: " + TimeElapsed.fromDateStr(_timeString).toCustomTimeElapsed(customDate),
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
                      "just now: " + TimeElapsed.fromDateStr("2020-06-20 22:23:14.194374"),
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
                      "minutes: " + TimeElapsed.fromDateStr("2020-06-20 21:56:50.252522"),
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
                Card(
                  color: Colors.green[300],
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "hours: " + TimeElapsed.fromDateStr("2020-06-20 20:56:50.252522"),
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
                Card(
                  color: Colors.green[300],
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "days: " + TimeElapsed.fromDateStr("2020-06-18 20:56:50.252522"),
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
                      "week: " + TimeElapsed.fromDateStr("2020-06-02 20:56:50.252522"),
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
