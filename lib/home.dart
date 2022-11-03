import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  final StopWatchTimer stopwatch = StopWatchTimer(
    mode: StopWatchMode.countUp,
  );

  bool onPlay = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
              child: Column(
            children: const [
              Center(
                child: Text('00:00:00'),
              ),
            ],
          )),
        ),
        floatingActionButton: playAnimationButton(onPlay));
  }

  FloatingActionButton playAnimationButton(bool onPlay) {
    return FloatingActionButton(
      tooltip: 'Start',
      onPressed: () {
        setState(() {
          if (onPlay) {
            this.onPlay = false;
          } else {
            this.onPlay = true;
          }
        });
      },
      child: Icon(onPlay ? Icons.pause : Icons.play_arrow),
    );
  }

  void startTimer() {}

  void stopTimer() {}
}
