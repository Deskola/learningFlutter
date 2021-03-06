import 'package:flutter/material.dart';

//Local files
import 'package:tutorial/chaps/chap2.dart';
import 'package:tutorial/chaps/Productivity_timer.dart';
import 'package:tutorial/chaps/pingponggame/pingpong.dart';
import 'package:tutorial/chaps/tmdb/movies.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        '/chap2': (BuildContext context) => Chapter2(),
        '/timer': (BuildContext context) => ProductivityTimer(),
        '/pong': (BuildContext context) => Pingpong(),
        '/movies': (BuildContext context) => Movies(),
      },
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blueGrey,
      ),
      home: Movies(),
    );
  }
}
