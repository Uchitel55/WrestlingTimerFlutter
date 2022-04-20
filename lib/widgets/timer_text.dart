import 'package:flutter/material.dart';

class TimerText extends StatelessWidget {
  final int duration;
  const TimerText({Key? key, required this.duration}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final minutes = ((duration / 60) % 60).floor().toString().padLeft(2, '0');
    final seconds = (duration % 60).floor().toString().padLeft(2, '0');
    return Text(
      '$minutes:$seconds',
      style: const TextStyle(
        fontSize: 60,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 17, 43, 192),
      ),
    );
  }
}
