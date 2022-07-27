import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  static const countdownDuration = Duration(minutes: 40);
  Duration duration = Duration();
  Timer? timer;
  bool isCountdown = true;

  @override
  void initState() {
    super.initState();

    //startTimer();
    reset();
  }

  void reset() {
    if (isCountdown) {
      setState(() => duration = countdownDuration);
    } else {
      setState(() => duration = Duration());
    }
  }

  void addTime() {
    final addSeconds = isCountdown ? -1 : 1;

    setState(() {
      final seconds = duration.inSeconds + addSeconds;

      if (seconds < 0) {
        timer?.cancel();
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  void startTimer({bool resets = true}) {
    if (resets) {
      reset();
    }

    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
  }

  void stopTimer({bool resets = true}) {
    if (resets) {
      reset();
    }

    setState(() => timer?.cancel());
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: HexColor('#35408f')),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            'Timer',
            style: GoogleFonts.poppins(
              fontSize: 18,
              color: HexColor('#35408f'),
            ),
          ),
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.grey[300],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildTime(),
              SizedBox(
                height: 80,
              ),
              buildButtons(),
            ],
          ),
        ),
      );

  Widget buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildTimeCard(time: hours, header: 'HOURS'),
        SizedBox(
          width: 8,
        ),
        buildTimeCard(time: minutes, header: 'MINUTES'),
        SizedBox(
          width: 8,
        ),
        buildTimeCard(time: seconds, header: 'SECONDS'),
      ],
    );
  }

  Widget buildTimeCard({required String time, required String header}) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              time,
              style: GoogleFonts.workSans(fontSize: 72, color: Colors.black),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Text(header),
        ],
      );

  Widget buildButtons() {
    final isRunning = timer == null ? false : timer!.isActive;
    final isCompleted = duration.inSeconds == 0;

    return isRunning || !isCompleted
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (isRunning) {
                    stopTimer(resets: false);
                  } else {
                    startTimer();
                  }
                },
                child: isRunning ? Text('STOP') : Text('START'),
                style: ElevatedButton.styleFrom(
                    primary: HexColor('#35408f'),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0))),
              ),
              SizedBox(
                width: 12,
              ),
              ElevatedButton(
                onPressed: () {
                  stopTimer();
                },
                child: Text('CANCEL'),
                style: ElevatedButton.styleFrom(
                  primary: HexColor('#35408f'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
            ],
          )
        : ElevatedButton(
            onPressed: () {
              startTimer();
            },
            child: Text('Start Timer'),
            style: ElevatedButton.styleFrom(
                primary: HexColor('#35408f'),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0))),
          );
  }
}
