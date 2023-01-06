import 'package:flutter/material.dart';

class AnimatedRocket extends AnimatedWidget {
  const AnimatedRocket({Key? key, required Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable as Animation<double>;
    return Container(
        margin: EdgeInsets.only(bottom: animation.value),
        width: 150,
        height: 150,
        child: Image.asset('assets/images/rocket.png'));
  }
}

class AnimatedSteam extends AnimatedWidget {
  const AnimatedSteam({Key? key, required Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable as Animation<double>;
    return Container(
        width: 150,
        height: 100,
        margin: EdgeInsets.only(top: animation.value),
        child: Image.asset('assets/images/launch_steam.png',));
  }
}
