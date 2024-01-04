import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:emotion_tracker/core/src_core.dart';
class CountdownTimer extends StatefulWidget {
  const CountdownTimer({
    super.key,
    required this.timer,
  });
  //seconds
  final int timer;
  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  DateTimeFormat dateFormat = DateTimeFormat();

  late Timer timer;

  static const String endTimeTile = "Kết thúc sau";

  @override
  void initState() {
    super.initState();
    runLoopTime();
  }

  @override
  void didUpdateWidget(CountdownTimer oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void runLoopTime() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {});
        if (isEndSale) {
          timer.cancel();
        }
      }
    });
  }

  String get hours => twoDigits(_countDownTimer().inHours.remainder(24));

  String get second => twoDigits(_countDownTimer().inSeconds.remainder(60));

  String get minutes => twoDigits(_countDownTimer().inMinutes.remainder(60));

  DateTime get timeEnd => dateFormat.convertTimeStampToDate(widget.timer);

  String twoDigits(int n) => n.toString().padLeft(2, "0");

  bool get isEndSale => DateTime.now().isBefore(timeEnd);

  Duration _countDownTimer() => DateTime.now().difference(timeEnd);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isEndSale,
      child: Row(
        children: [
          TextBuild(
            title: endTimeTile,
            style: Get.textTheme.subtitle1,
          ),
          _buildTimeInfo(hours),
          _buildTimeInfo(minutes),
          _buildTimeInfo(second),
        ],
      ),
    );
  }

  Widget _buildTimeInfo(String time) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppDimens.paddingSmallest),
      padding:
          const EdgeInsets.symmetric(horizontal: AppDimens.paddingSmallest),
      color: Colors.black,
      child: TextBuild(
        title: time.toString(),
        style: Get.textTheme.subtitle1!.copyWith(color: Colors.white),
      ),
    );
  }
}
