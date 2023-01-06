import 'package:app_manage/ui/screens/widgets/appbar/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../app/my_app_screen.dart';
import '../clear/clear_task_app.dart';
import '../discovery/discovery_screen.dart';
import '../settings/settings_screen.dart';
import '../widgets/language/languages.dart';
import '../widgets/utils/assets_utils.dart';
import '../widgets/utils/colors.dart';
import '../widgets/utils/text_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _selectedTab = _SelectedTab.home;

  late List<Widget> listScreen = <Widget>[];

  @override
  Widget build(BuildContext context) {
    listScreen.clear();
    listScreen = [
      _bodyHome(),
      const MyAppScreen(),
      const ClearTaskAppScreen(),
      const SettingScreen()
    ];
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colours.COLOR_BLUR, Colours.BACKGROUND])),
        child: Scaffold(
          extendBody: true,
          backgroundColor: Colors.transparent,
          body: Container(
            child: listScreen[_selectedTab.index],
          ),
          bottomNavigationBar: bottomNavigationBar,
        ));
  }

  Widget get bottomNavigationBar {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(7),
        topLeft: Radius.circular(7),
      ),
      child: Container(
          decoration: const BoxDecoration(
            color: Colors.transparent,
            // borderRadius: BorderRadius.only(
            //   topLeft: Radius.circular(10),
            //   topRight: Radius.circular(10),
            // ),
          ),
          child: SalomonBottomBar(
            currentIndex: _SelectedTab.values.indexOf(_selectedTab),
            // dotIndicatorColor: Colors.transparent,
            itemPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            // marginR: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
            // paddingR:
            //     const EdgeInsets.only(bottom: 0, top: 10, left: 10, right: 10),
            // borderRadius: 30,
            // backgroundColor: Colors.white,
            // dotIndicatorColor: Colors.white,
            onTap: _handleIndexChanged,
            items: [
              /// Home
              SalomonBottomBarItem(
                  icon: SvgPicture.asset(
                    SVGUtils.HOME,
                  ),
                  title: Text(
                    Languages.of(context)!.home,
                    style: TextStyles.textSize16TextMain,
                  ),
                  selectedColor: Colours.MAIN_COLOR,
                  unselectedColor: Colours.UN_SELECTED),

              /// Likes
              SalomonBottomBarItem(
                  icon: SvgPicture.asset(
                    SVGUtils.PORTFOLIO,
                  ),
                  title: Text(
                    Languages.of(context)!.portfolio,
                    style: TextStyles.textSize16TextMain,
                  ),
                  selectedColor: Colours.MAIN_COLOR,
                  unselectedColor: Colours.UN_SELECTED),

              /// Search
              // SalomonBottomBarItem(
              //   icon: Icon(Icons.confirmation_num_outlined),
              //   title: Text("Yêu cầu"),
              //   selectedColor: Colors.orange,
              // ),
              SalomonBottomBarItem(
                  icon: SvgPicture.asset(
                    SVGUtils.PRICES,
                  ),
                  title: Text(
                    Languages.of(context)!.prices,
                    style: TextStyles.textSize16TextMain,
                  ),
                  selectedColor: Colours.MAIN_COLOR,
                  unselectedColor: Colours.UN_SELECTED),

              /// Profile
              SalomonBottomBarItem(
                  icon: SvgPicture.asset(
                    SVGUtils.SETTINGS,
                  ),
                  title: Text(
                    Languages.of(context)!.settings,
                    style: TextStyles.textSize16TextMain,
                  ),
                  selectedColor: Colours.MAIN_COLOR,
                  unselectedColor: Colours.UN_SELECTED),
            ],
          )),
    );
  }

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  Widget _bodyHome() {
    return const DiscoveryScreen();
  }
}

enum _SelectedTab { home, portfolio, prices, settings }
