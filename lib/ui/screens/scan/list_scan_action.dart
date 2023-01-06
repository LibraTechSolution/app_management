import 'package:flutter/material.dart';

import '../../../model/app/app_info.dart';
import '../widgets/appbar/appbar.dart';
import '../widgets/utils/colors.dart';

class ListScanActionScreen1 extends StatefulWidget {
  const ListScanActionScreen1({Key? key, required this.listApp}) : super(key: key);
  final List<AppInfoModel> listApp;
  @override
  State<ListScanActionScreen1> createState() => _ListScanActionScreen1State();
}

class _ListScanActionScreen1State extends State<ListScanActionScreen1> {
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
        body: ListView.separated(
          itemCount: widget.listApp.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {

            return ListTile(
              title: Text("hjhj"),
            );
          },
          separatorBuilder:
              (BuildContext context, int index) {
            return const Divider(
              height: 1,
            );
          },
        ),
      ),
    );
  }
}
