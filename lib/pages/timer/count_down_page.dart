import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_calculator/widgets/timer/count_down.dart';
import 'package:flutter_calculator/widgets/timer/count_down_indicator.dart';

class CountDownPage extends StatefulWidget {
  final Duration duration;
  const CountDownPage({Key? key, required this.duration}) : super(key: key);

  @override
  _CountDownPage createState() => _CountDownPage();
}

class _CountDownPage extends State<CountDownPage> {
  int _countDownSec = 0;
  int _totalSec = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _countDownSec = widget.duration.inSeconds;
    _totalSec = _countDownSec;
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (_countDownSec > 0) {
          setState(() {
            _countDownSec--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Count Down"),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            Center(
              child: countDown(_countDownSec),
            ),
            Center(
              child: countDownIndicator(_totalSec),
            ),
          ],
        ),
      ),
    );
  }
}
