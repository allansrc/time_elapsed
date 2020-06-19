import 'package:time_elapsed/time_elapsed.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _timeString = "2020-04-19 03:48:57.063773"; // date current as String

  String _timeStamp = ""; // date current as String

  DateTime _timeDate =
      DateTime.parse("2020-04-19 03:48:57.063773"); // date current as DateTime
  void _incrementCounter() {
    setState(() {
      _timeString =
          TimeElapsed().fromDateStr(_timeString); // to calculate from String
      _timeStamp =
          TimeElapsed().fromDateTime(_timeDate); // to calculate from DateTime
    });
    print(_timeString.toString());
    print(_timeStamp.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text(
          '$_timeStamp and $_timeString',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
