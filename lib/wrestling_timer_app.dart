import 'package:flutter/material.dart';

import 'ui/pages/home_page.dart/home_page.dart';

class WrestlingTimerApp extends StatelessWidget {
  const WrestlingTimerApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wrestling Timer',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(primary: Color(0xFFF58220)),
      ),
      home: HomePage(),
    );
  }
}
