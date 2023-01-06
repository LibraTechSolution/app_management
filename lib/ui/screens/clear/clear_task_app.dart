import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../widgets/anima/animated_animation.dart';
import '../widgets/appbar/appbar.dart';
import '../widgets/utils/colors.dart';

class ClearTaskAppScreen extends StatefulWidget {
  const ClearTaskAppScreen({Key? key}) : super(key: key);

  @override
  State<ClearTaskAppScreen> createState() => _ClearTaskAppScreenState();
}

class _ClearTaskAppScreenState extends State<ClearTaskAppScreen>
    with TickerProviderStateMixin {
  late AnimationController rocketController, steamController;
  late Animation<double> rocketAnimation, steamAnimation;

  late ConfettiController _controllerCenter;

  bool isFly = false;

  @override
  void initState() {
    // Rocket animation
    rocketController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);

    final CurvedAnimation curve =
        CurvedAnimation(parent: rocketController, curve: Curves.easeInOut);

    rocketAnimation = Tween(begin: 30.0, end: 0.0).animate(curve);

    rocketAnimation.addStatusListener((status) {

      if (status == AnimationStatus.completed) {
        rocketController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        rocketController.forward();
      }
    });

    rocketController.forward();

    // Steam animation
    steamController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);

    final CurvedAnimation curveSteam =
        CurvedAnimation(parent: steamController, curve: Curves.linear);

    steamAnimation = Tween(begin: 55.0, end: 78.0).animate(curveSteam);
    steamController.repeat();
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 10));

    super.initState();
  }

  @override
  void dispose() {
    rocketController.dispose();
    steamController.dispose();
    _controllerCenter.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colours.COLOR_BLUR, Colours.BACKGROUND])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: appBarCommonV1(context, strTitle: "Settings"),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            SizedBox(
                child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: ConfettiWidget(
                    confettiController: _controllerCenter,
                    blastDirectionality: BlastDirectionality
                        .explosive, // don't specify a direction, blast randomly
                    shouldLoop:
                    true, // start again as soon as the animation is finished
                    colors: const [
                      Colors.green,
                      Colors.blue,
                      Colors.pink,
                      Colors.orange,
                      Colors.purple
                    ], // manually specify the colors to be used
                    createParticlePath: drawStar, // define a custom shape/path.
                  ),
                ),
                Center(
                  child: Container(
                      margin: const EdgeInsets.only(bottom: 30),
                      // alignment: const Alignment(1.0, -2.0),
                      // padding: const EdgeInsets.only(right: 106.0),
                      child: AnimatedSteam(
                        animation: steamAnimation,
                      )),
                ),
                Center(
                  child: GestureDetector(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 60),
                      // alignment: const Alignment(1.0, -1.0),
                      // padding: const EdgeInsets.only(right: 85.0),
                      child: AnimatedRocket(
                        animation: rocketAnimation,
                      ),
                    ),
                    onLongPress: () {
                      Logger().i("Longkaka");
                    },
                    onTap: () {
                      if(!isFly) {
                        setState(() {
                          // rocketController.reverse();
                          rocketController = AnimationController(
                              duration: const Duration(milliseconds: 4000),
                              vsync: this);

                          final CurvedAnimation curve = CurvedAnimation(
                              parent: rocketController, curve: Curves.easeInOut);

                          rocketAnimation = Tween(
                              begin: 30.0,
                              end: MediaQuery.of(context).size.height * 0.6)
                              .animate(curve);

                          rocketAnimation.addStatusListener((status) {
                            if (status == AnimationStatus.completed) {
                              isFly = true;
                              _controllerCenter.play();
                              Future.delayed(const Duration(seconds: 3), () {
                                _controllerCenter.stop();
                                isFly = false;
                                setState(() {
                                  rocketAnimation = Tween(begin: 30.0, end: 0.0).animate(curve);
                                });
                                rocketController.stop();
                              });
                            } else if (status == AnimationStatus.dismissed) {
                              // rocketController.stop();
                              rocketController.forward();
                            }
                          });
                        });

                        rocketController.forward();
                      }

                    },
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }

  /// A custom Path to paint stars.
  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }
}
