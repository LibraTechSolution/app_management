import 'dart:typed_data';

import 'package:drawable/drawable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'assets_utils.dart';
import 'colors.dart';
import 'constants.dart';
import 'dimens.dart';
import 'text_styles.dart';

class Common {
  cardNews() {
    return ClipRect(

      child: Image.network(Constants.AVATAR_DEFAULT, fit: BoxFit.cover,),
    );
  }

  myCardApp(
      {String? strName,
      String? packageId,
      String? date,
      String? origin,
      String? version,
      bool? isSystem,
      String? sdk,
      String? sha,
      Uint8List? icon}) {
    return Card(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 48,
                  height: 48,
                  child: CircleAvatar(
                    backgroundColor: Colours.SHADOWN,
                    child: Container(
                        padding: const EdgeInsets.all(8),
                        child: CircleAvatar(
                          radius: 20,
                          child: Image.network(Constants.AVATAR_DEFAULT),
                        )),
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      strName ?? "",
                      style: TextStyles.textSize16Title,
                    ),
                    SizedBox(height: 2),
                    Text(
                      packageId ?? "",
                      style: TextStyles.textSize12,
                    ),
                    SizedBox(height: 2),
                    Text(
                      date ?? "",
                      style: TextStyles.textSize12,
                    ),
                    SizedBox(height: 2),
                    Text(
                      origin ?? "",
                      style: TextStyles.textSize14,
                    )
                  ],
                )
              ],
            ),
            Column(
              children: [
                Text(version ?? "", style: TextStyles.textSize12),
                SizedBox(height: 2),
                Text(isSystem! ? "System" : "User",
                    style: TextStyles.textSize12),
                SizedBox(height: 2),
                Text(sdk ?? "", style: TextStyles.textSize16Title),
                SizedBox(height: 2),
                Text(sha ?? "", style: TextStyles.textSize12)
              ],
            )
          ],
        ),
      ),
    );
  }

  TextFormField searchLabel(
      {String labelValue = "",
      String hintValue = "",
      bool? validation,
      TextEditingController? controller,
      TextInputType keyboardType = TextInputType.text,
      TextStyle? textStyle,
      String? validationErrorMsg,
      bool obscureText = false,
      bool isReadOnly = false,
      Widget? icons,
      FocusNode? fn,
      VoidCallback? callback}) {
    TextFormField textFormField = TextFormField(
      keyboardType: keyboardType,
      style: textStyle,
      controller: controller,
      obscureText: obscureText,
      readOnly: true,
      focusNode: fn,
      enableInteractiveSelection: true,
      validator: (String? value) {
        if (validation!) {
          if (value!.isEmpty) {
            return validationErrorMsg;
          }
        }
      },
      decoration: InputDecoration(
          labelText: labelValue,
          hintText: hintValue,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 10.0),
          fillColor: Colours.NAV,
          filled: true,
          prefixIcon: icons != null
              ? IconButton(
                  icon: icons,
                  color: Colors.white,
                  onPressed: () {},
                )
              : null,
          labelStyle: TextStyle(
              fontSize: Dimens.font_sp16,
              color: Colors.white,
              fontFamily: "OpenSan"),
          hintStyle: TextStyle(
              fontSize: Dimens.font_sp14,
              color: Colors.white,
              fontFamily: "OpenSan"),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: const BorderSide(
              color: Colors.white,
              width: 0.5,
            ),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always),
      onTap: () {
        callback!();
      },
    );
    return textFormField;
  }
}
