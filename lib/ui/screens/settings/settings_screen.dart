import 'dart:io';

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../widgets/appbar/appbar.dart';
import '../widgets/language/languages.dart';
import '../widgets/utils/colors.dart';
import '../widgets/utils/text_styles.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
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
          appBar: appBarCommonV1(context,
              strTitle: "Settings"),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                // ListTile(
                //   title: Text("Account"),
                //   leading: Icon(Icons.account_circle_outlined),
                // ),
                ListTile(
                  title: Text("Settings",
                      style: TextStyles.textSize16Text),
                  leading: Icon(Icons.settings, color: Colors.white),
                  onTap: () {

                  },
                ),
                Visibility(
                  child: ListTile(
                    title: Text("Hướng dẫn",
                        style: TextStyles.textSize16Text),
                    leading:
                        Icon(Icons.help_center_outlined, color: Colors.white),
                    onTap: () {
                    },
                  ),
                  visible: Platform.isIOS,
                ),

                ListTile(
                  title: Text("Ngôn ngữ",
                      style: TextStyles.textSize16Text),
                  leading: Icon(Icons.language_outlined,
                      color: Colors.white),
                  onTap: () {

                  },
                ),
                ListTile(
                  title: Text("Share",
                      style: TextStyles.textSize16Text),
                  leading: Icon(Icons.share_outlined, color: Colors.white),
                  onTap: () {
                    if (Platform.isIOS) {
                      Share.share(
                          'https://apps.apple.com/us/app/ch%E1%BA%B7n-l%E1%BB%ABa-%C4%91%E1%BA%A3o/id6444795935');
                    } else {
                      Share.share(
                          'https://play.google.com/store/apps/details?id=com.mrblank.master_check');
                    }
                  },
                ),

                ListTile(
                  title: Text("Policy",
                      style: TextStyles.textSize16Text),
                  leading: Icon(Icons.security_outlined, color: Colors.white),
                  onTap: () {
                  },
                ),
                ListTile(
                  title: Text("About",
                      style: TextStyles.textSize16Text),
                  leading:
                      Icon(Icons.info_outline_rounded, color: Colors.white),
                  onTap: () {
                  },
                ),
              ],
            ),
          )),
    );
  }
}
