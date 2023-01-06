import 'package:app_manage/blocs/app_blocs.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../../../model/app/app_info.dart';
import '../widgets/appbar/appbar.dart';
import '../widgets/language/languages.dart';
import '../widgets/utils/colors.dart';
import '../widgets/utils/common.dart';

class MyAppScreen extends StatefulWidget {
  const MyAppScreen({Key? key}) : super(key: key);

  @override
  State<MyAppScreen> createState() => _MyAppScreenState();
}

class _MyAppScreenState extends State<MyAppScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colours.COLOR_BLUR, Colours.BACKGROUND])),
        child: StreamBuilder(
            stream: appBlocs.appReport,
            builder: (context, AsyncSnapshot<AppInfoModel> snapshot) {
              if (snapshot.hasData) {
                return Scaffold(
                  backgroundColor: Colors.transparent,
                  appBar: appBarCommonV1(context,
                      strTitle: Languages.of(context)!.currentApp),
                  body: Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                            left: 16, right: 16, top: 10, bottom: 10),
                        margin: const EdgeInsets.only(bottom: 50),
                        child: Column(
                          children: [
                            InkWell(
                              child: Common().searchLabel(
                                  hintValue: Languages.of(context)!.search,
                                  icons: const Icon(Icons.search_outlined),
                                  callback: () {
                                    // NavigatorUtils.push(
                                    //     context, RouterGenerator.routeSearch);
                                  }),
                              onTap: () {
                                // NavigatorUtils.push(
                                //     context, RouterGenerator.routeSearch);
                              },
                            ),
                            const SizedBox(height: 20),
                            Expanded(
                                child: ListView.separated(
                              itemCount:
                                  snapshot.data?.packageInfo?.length ?? 0,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                PackageInfo? packageInfo =
                                    snapshot.data?.packageInfo?[index];

                                return Common().myCardApp(
                                    strName: packageInfo?.appName,
                                    packageId: packageInfo?.packageName,
                                    date: packageInfo?.dateInstall.toString(),
                                    origin: "SAMSUNG",
                                    sha: "SHA1",
                                    sdk: packageInfo?.sdkVersion,
                                    isSystem: packageInfo?.isSystem);
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const Divider(
                                  height: 1,
                                );
                              },
                            ))
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }
              appBlocs.getAppInfo();
              return Container();
            }));
  }
}
