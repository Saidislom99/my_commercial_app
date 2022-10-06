import 'package:flutter/material.dart';
import 'package:my_commercial_app/screens/tabs/tab_box.dart';
import 'package:my_commercial_app/screens/task_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TabBox(),
    );
  }
}

