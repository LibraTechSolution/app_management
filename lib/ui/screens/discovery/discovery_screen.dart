import 'package:app_manage/ui/screens/widgets/appbar/appbar.dart';
import 'package:app_manage/ui/screens/widgets/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../routers/fluro_navigator.dart';
import '../../routers/router_generator.dart';
import '../widgets/utils/assets_utils.dart';
import '../widgets/utils/constants.dart';
import '../widgets/utils/text_styles.dart';

class DiscoveryScreen extends StatefulWidget {
  const DiscoveryScreen({Key? key}) : super(key: key);

  @override
  State<DiscoveryScreen> createState() => _DiscoveryScreenState();
}

class _DiscoveryScreenState extends State<DiscoveryScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarCommonV1(context, strTitle: "All app"),
        backgroundColor: Colors.transparent,
        body: Container(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 80),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 150,
                    child: ListView.separated(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: const EdgeInsets.all(10),
                          width: 150.0,
                          height: 150.0,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10.0)),
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  stops: const [
                                    0.3,
                                    1
                                  ],
                                  colors: [
                                    const Color(0xFF4B70FF).withOpacity(0.6),
                                    const Color(0xFF454563).withOpacity(0.6)
                                  ])),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.network(
                              Constants.AVATAR_DEFAULT,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider(
                          height: 1,
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Market Statistics",
                        textAlign: TextAlign.center,
                        style: TextStyles.textSize16Title,
                      ),
                      Text(
                        "All >",
                        textAlign: TextAlign.center,
                        style: TextStyles.textSize16Title,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                      child: ListView.separated(
                    itemCount: 20,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            Constants.AVATAR_DEFAULT,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text("IBLOCK", style: TextStyles.textSize16Text,),
                        subtitle: Text("30/12/2022", style: TextStyles.textSize12,),
                        onTap: (){
                          NavigatorUtils.push(context, RouterGenerator.routeDetailScan);

                        },
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(
                        height: 1,
                      );
                    },
                  ))
                ],
              ),
            ],
          ),
        ));
  }
}
