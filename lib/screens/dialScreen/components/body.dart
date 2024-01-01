import 'package:calling/components/dial_user_pic.dart';
import 'package:calling/components/rounded_button.dart';
import 'package:calling/constants.dart';
import 'package:calling/size_config.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:calling/notification.dart';
import 'dial_button.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late Stopwatch _stopwatch = Stopwatch();
  Timer? _timer;
  String _elapsedTime = '00:00';

  @override
  void initState() {
    super.initState();
    FlutterLocalNotification.init();
    _startTimer();
    Future.delayed(const Duration(seconds: 3),
      FlutterLocalNotification.requestNotificationPermission());
  }

  void _startTimer() {
    _stopwatch.start();
    _timer = Timer.periodic(Duration(milliseconds: 100), (Timer timer) {
      setState(() {
        _elapsedTime = _formatTime(_stopwatch.elapsedMilliseconds);
      });
    });
  }

  String _formatTime(int milliseconds) {
    int seconds = (milliseconds / 1000).truncate();
    int minutes = (seconds / 60).truncate();

    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');

    return '$minutesStr:$secondsStr';
  }

  void _stopTimer() {
    _stopwatch.stop();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              "010-1234-1234",
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(color: Colors.white), // Use ?. here
            ),
            Text(
              _elapsedTime,
              style: TextStyle(color: Colors.white60, fontSize: 20),
            ),
            VerticalSpacing(),
            DialUserPic(image: "assets/images/adotIcon.png"),
            Spacer(),
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              children: [
                DialButton(
                  iconSrc: "assets/icons/Icon Volume.svg",
                  text: "스피커",
                  press: () {},
                ),
                DialButton(
                  iconSrc: "assets/icons/keypad.svg",
                  text: "키패드",
                  press: () {},
                ),
                DialButton(
                  iconSrc: "assets/icons/microphone-sound-off.svg",
                  text: "음소거",
                  press: () {},
                ),
                DialButton(
                  iconSrc: "assets/icons/recording.svg",
                  text: "녹음",
                  press: () {},
                ),
                DialButton(
                  iconSrc: "assets/icons/fishing.svg",
                  text: "보이스피싱",
                  press: () 
                  {
                    FlutterLocalNotification.showNotification();
                  },
                ),
              ],
            ),
            VerticalSpacing(),
            RoundedButton(
              iconSrc: "assets/icons/call_end.svg",
              press: () {_stopTimer();},
              color: kRedColor,
              iconColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
