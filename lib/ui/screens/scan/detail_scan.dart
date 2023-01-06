import 'dart:math';

import 'package:app_manage/ui/screens/widgets/utils/constants.dart';
import 'package:flutter/material.dart';

import '../widgets/appbar/appbar.dart';
import '../widgets/circle/circle.dart';
import '../widgets/utils/ClipShadowPath.dart';
import '../widgets/utils/colors.dart';
import '../widgets/utils/custom_shape_border.dart';
import '../widgets/utils/text_styles.dart';

class DetailScanScreen extends StatefulWidget {
  const DetailScanScreen({Key? key}) : super(key: key);

  @override
  State<DetailScanScreen> createState() => _DetailScanScreenState();
}

class _DetailScanScreenState extends State<DetailScanScreen>
    with TickerProviderStateMixin {
  late AnimationController _primaryAnimController;
  late AnimationController _secondaryAnimController;
  int _sliderAmount = 75;
  int _division = 15;



  @override
  void initState() {
    super.initState();

    _primaryAnimController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
      value: 0.8,
    );

    _secondaryAnimController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
      value: 0.8,
    );


  }

  @override
  void dispose() {


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
          appBar: appBarCommonV1(context, strTitle: "Scan app"),
          backgroundColor: Colors.transparent,
          body: Container(
            alignment: Alignment.center,
            child: Stack(
              children: [
                Stack(
                  alignment: Alignment.topCenter,
                  children: [

                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        gradient: RadialGradient(
                          colors: [Colors.black87, Colors.black12],
                          center: Alignment.bottomCenter,
                          radius: 1.5,
                        ),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black45,
                            blurRadius: 16.0,
                            offset: Offset(8.0, 8.0),
                          )
                        ],
                      ),
                      child: AnimatedBuilder(
                        animation: _primaryAnimController,
                        builder: (context, child) {
                          return AnimatedBuilder(
                            animation: _secondaryAnimController,
                            builder: (context, child) {
                              final celsius =
                                  (300 * _primaryAnimController.value)
                                      .toStringAsFixed(0);
                              return AdvancedProgress(
                                levelAmount: _sliderAmount,
                                division: _division,
                                primaryValue: Tween<double>(
                                  begin: 0.0,
                                  end: 1.0,
                                ).evaluate(_primaryAnimController),
                                secondaryValue: Tween<double>(
                                  begin: 0.0,
                                  end: 1.0,
                                ).evaluate(_secondaryAnimController),
                                radius: 100.0,
                                levelLowHeight: 16,
                                levelHighHeight: 20,
                                primaryColor: Colors.yellow,
                                secondaryColor: Colors.red,
                                tertiaryColor: Colors.grey.withOpacity(0.25),
                                child: Stack(
                                  children: [
                                    Center(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            '$celsius°',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 36,
                                            ),
                                          ),
                                          const Text(
                                            'PREHEATING',
                                            style: TextStyle(
                                              height: 2,
                                              color: Colors.red,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            '35:00',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Text(
                                            'Time left',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.2),
                      color: Colors.transparent,
                      child: ClipShadowPath(
                        clipper: MyClipper(250),
                        shadow: Shadow(
                          blurRadius: 1,
                          color: Colours.BG_CURVE.withOpacity(0.6),
                          offset: const Offset(0, 3),
                        ),
                        child: Container(
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                Colours.COLOR_BLUR,
                                Colours.BACKGROUND
                              ])),
                          height: MediaQuery.of(context).size.height * 0.7,
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.95,
                                  height: 68,
                                  margin: const EdgeInsets.only(top: 80),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                        color: Colours.NAV, // Set border color
                                        width: 1), // Set border width
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(
                                            10.0)), // Set rounded corner radius
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CircleAvatar(
                                        radius: 24,
                                        backgroundImage: NetworkImage(
                                            Constants.AVATAR_DEFAULT),
                                      ),
                                      const SizedBox(width: 5),
                                      Flexible(
                                          child: Text(
                                        "Ứng dụng nguy hiểm asd a dad as",
                                        style: TextStyles.textSize16Text,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      )),
                                      const SizedBox(width: 5),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 20),
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          border: Border.all(
                                              color: Colours.NAV,
                                              // Set border color
                                              width: 1), // Set border width
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(
                                                  10.0)), // Set rounded corner radius
                                        ),
                                        child: Text(
                                          "10",
                                          style: TextStyles.textSize16Text,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.95,
                                  height: 68,
                                  margin: const EdgeInsets.only(top: 10),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                        color: Colours.NAV, // Set border color
                                        width: 1), // Set border width
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(
                                            10.0)), // Set rounded corner radius
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CircleAvatar(
                                        radius: 24,
                                        backgroundImage: NetworkImage(
                                            Constants.AVATAR_DEFAULT),
                                      ),
                                      const SizedBox(width: 5),
                                      Flexible(
                                          child: Text(
                                        "Ứng dụng nguy hiểm asd a dad as",
                                        style: TextStyles.textSize16Text,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      )),
                                      SizedBox(width: 5),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 20),
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          border: Border.all(
                                              color: Colours.NAV,
                                              // Set border color
                                              width: 1), // Set border width
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(
                                                  10.0)), // Set rounded corner radius
                                        ),
                                        child: Text(
                                          "10",
                                          style: TextStyles.textSize16Text,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.95,
                                  height: 68,
                                  margin: const EdgeInsets.only(top: 10),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                        color: Colours.NAV, // Set border color
                                        width: 1), // Set border width
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(
                                            10.0)), // Set rounded corner radius
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CircleAvatar(
                                        radius: 24,
                                        backgroundImage: NetworkImage(
                                            Constants.AVATAR_DEFAULT),
                                      ),
                                      const SizedBox(width: 5),
                                      Flexible(
                                          child: Text(
                                        "Ứng dụng nguy hiểm asd a dad as",
                                        style: TextStyles.textSize16Text,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      )),
                                      SizedBox(width: 5),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 20),
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          border: Border.all(
                                              color: Colours.NAV,
                                              // Set border color
                                              width: 1), // Set border width
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(
                                                  10.0)), // Set rounded corner radius
                                        ),
                                        child: Text(
                                          "10",
                                          style: TextStyles.textSize16Text,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: startButton(context),
                )
              ],
            ),
          ),
        ));
  }

  void _handleDemoPressed() {
    _primaryAnimController.value = 0.0;
    _primaryAnimController.animateTo(
      0.9,
      duration: const Duration(milliseconds: 5000),
      curve: Curves.linearToEaseOut,
    );
    _secondaryAnimController.value = 0.0;
    _secondaryAnimController.animateTo(
      0.9,
      duration: const Duration(milliseconds: 10000),
      curve: Curves.linearToEaseOut,
    );
  }

  Widget startButton(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(top: 250.0),
      height: 150,
      child: Stack(
        children: <Widget>[
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildSideButtons(context, Icons.settings, Colors.yellow,
                    const EdgeInsets.only(right: 30.0, left: 10)),
                _buildSideButtons(context, Icons.lightbulb_outline,
                    Colors.green, const EdgeInsets.only(left: 30.0, right: 10)),
              ],
            ),
          ),
          Center(
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.35,
                  height: MediaQuery.of(context).size.height,
                  child: const DecoratedBox(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Colors.yellow, Colors.green])),
                  ))),
          Center(
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.275,
                  height: MediaQuery.of(context).size.height,
                  child: Card(
                    color: Colors.white,
                    shape: const CircleBorder(),
                    child: Center(
                      child: InkWell(
                        child: Text(
                          "START",
                          style: TextStyle(
                              fontFamily: "Bebas Neue",
                              fontSize: 25.0,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          _handleDemoPressed();
                        },
                      ),
                    ),
                  )))
        ],
      ),
    );
  }

  Widget _buildSideButtons(
      BuildContext context, IconData icon, Color coverColor, EdgeInsets pad,
      {VoidCallback? navigate}) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.06,
      child: Card(
        elevation: 5.0,
        // onPressed: () {},
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50.0))),
        child: Container(
          child: Padding(
            padding: pad,
            child: Icon(icon, color: Colors.black),
          ),
        ),
        color: coverColor,
        // textColor: Colors.white,
      ),
    );
  }
}
