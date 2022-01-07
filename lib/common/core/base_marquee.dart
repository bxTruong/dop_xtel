import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

//marquee: ^2.2.0
class BaseMarquee extends StatelessWidget {
  const BaseMarquee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Marquee(
        text: 'MTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTt',
        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
        scrollAxis: Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.start,
        blankSpace: 500.0,
        velocity: 100.0,
        pauseAfterRound: const Duration(seconds: 0),
        startPadding: 10.0,
        accelerationDuration: const Duration(seconds: 1),
        accelerationCurve: Curves.linear,
        decelerationDuration: const Duration(milliseconds: 500),
        decelerationCurve: Curves.easeOut,
      ),
    );
  }
}
