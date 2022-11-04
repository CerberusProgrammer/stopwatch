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
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.history),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return Scaffold(
                      appBar: AppBar(
                        title: const Text('History'),
                      ),
                      body: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Center(
                          child: StreamBuilder<List<StopWatchRecord>>(
                            stream: stopwatch.records,
                            initialData: const [],
                            builder: (context, snap) {
                              final value = snap.data;
                              return ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int index) {
                                  final data = value![index];
                                  return Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          '${index + 1} ${data.displayTime}',
                                          style: const TextStyle(
                                              fontSize: 17,
                                              fontFamily: 'Helvetica',
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      const Divider(
                                        height: 1,
                                      )
                                    ],
                                  );
                                },
                                itemCount: value?.length,
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ));
              },
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
              child: Column(
            children: [
              const Spacer(),
              StreamBuilder<int>(
                stream: stopwatch.rawTime,
                initialData: 0,
                builder: ((context, snapshot) {
                  final value = snapshot.data;
                  final displayTime = StopWatchTimer.getDisplayTime(value!);

                  return Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: OutlinedButton(
                          onPressed: () {
                            stopwatch.onAddLap();
                          },
                          child: Text(
                            displayTime,
                            style: const TextStyle(
                                fontSize: 50,
                                color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
              onPlay
                  ? const Text('')
                  : OutlinedButton(
                      onPressed: () {
                        stopwatch.onResetTimer();
                      },
                      child: const Text('Clear')),
              const Spacer(),
              const Spacer(),
            ],
          )),
        ),
        floatingActionButton: playAnimationButton(onPlay));
  }

  FloatingActionButton playAnimationButton(bool onPlay) {
    return FloatingActionButton(
      tooltip: onPlay ? 'Stop' : 'Start',
      onPressed: () {
        setState(() {
          if (onPlay) {
            stopwatch.onStopTimer();
            this.onPlay = false;
          } else {
            stopwatch.onStartTimer();
            this.onPlay = true;
          }
        });
      },
      backgroundColor: onPlay
          ? const Color.fromARGB(255, 157, 6, 6)
          : const Color.fromARGB(255, 54, 170, 5),
      child: Icon(onPlay ? Icons.pause : Icons.play_arrow),
    );
  }
}
