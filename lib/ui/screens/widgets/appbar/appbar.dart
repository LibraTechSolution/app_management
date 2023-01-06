import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/text_styles.dart';

PreferredSize appBarCommonV1(BuildContext context,
    {String? strTitle, TextEditingController? textController, FocusNode? fn}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(60),
    child: Container(
      color: Colours.COLOR_BLUR.withOpacity(0.5),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  strTitle ?? "",
                  textAlign: TextAlign.center,
                  style: TextStyles.textSize24,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
