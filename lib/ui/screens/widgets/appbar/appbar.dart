import 'package:flutter/material.dart';

PreferredSize appBarCommonV1(BuildContext context,
    {String? strTitle, TextEditingController? textController, FocusNode? fn}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(70),
    child: Container(
      color: Colors.blue,
      margin: EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: const Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(Icons.arrow_back, color: Colors.white,),
                ),
                onTap: () => Navigator.of(context).pop(),
              ),
              Text(
                strTitle ?? "",
                // style: TextStyles.textSize24,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                width: 50,
              )
            ],
          )
        ],
      ),
    ),
  );
}
