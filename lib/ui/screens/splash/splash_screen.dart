import 'dart:async';

import 'package:app_manage/ui/routers/router_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../routers/fluro_navigator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;
  int _start = 3;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          NavigatorUtils.push(context, RouterGenerator.routeHome);
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: appBarCommonV1(context, strTitle: "Splash"),
      body: Center(
        child: FlutterLogo(
          size: 300,
          textColor: Colors.blue,
          style: FlutterLogoStyle.stacked,
        ), //Container
      ),
    );
  }
}
