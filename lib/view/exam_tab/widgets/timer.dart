import 'dart:async';

import 'package:chahele_project/utils/constant_colors/constant_colors.dart';
import 'package:flutter/material.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget(
      {super.key, required this.maxTimeAllowed, required this.onTimerFinish});
  final int maxTimeAllowed;
  final VoidCallback? onTimerFinish;

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late int seconds;
  Timer? timer;

  @override
  void initState() {
    seconds = widget.maxTimeAllowed;
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    stopTimer();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (seconds > 0) {
        setState(() {
          seconds--;
        });
      } else {
        stopTimer();
        if (widget.onTimerFinish != null) {
          widget.onTimerFinish!();
        }
      }
    });
  }

  void stopTimer() {
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    // final isRunning = timer!.isActive;
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 50,
          width: 50,
          child: CircularProgressIndicator(
            strokeWidth: 6,
            value: seconds / widget.maxTimeAllowed,
            backgroundColor:
                seconds <= 10 ? Colors.red : ConstantColors.headingBlue,
            valueColor:
                const AlwaysStoppedAnimation(ConstantColors.mainBlueTheme),
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$seconds",
                style: TextStyle(
                  color:
                      seconds <= 10 ? Colors.red : ConstantColors.headingBlue,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "sec",
                style: TextStyle(
                  color:
                      seconds <= 10 ? Colors.red : ConstantColors.headingBlue,
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
