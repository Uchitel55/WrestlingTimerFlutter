import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CircularCountDownTimer(
        autoStart: false,
        controller: CountDownController(),
        isReverse: true,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        duration: 30,
        fillColor: const Color(0xFF04003F),
        ringColor: Colors.transparent,
        backgroundColor: const Color(0xFFF58220),
        textFormat: 'mm:ss',
        textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
      ),
    );
  }
}
