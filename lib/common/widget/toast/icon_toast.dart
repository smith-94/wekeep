import 'package:wekeep/common/const/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

void iconToast(context, message, imgPath, {double bottom = 50}) {
  FToast fToast = FToast();
  fToast.init(context);

  Widget toast = SizedBox(
    width: MediaQuery.of(context).size.width,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 45,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: CustomColor.lightBlack,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              imgPath,
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 12.0,),
            Text(
              '$message',
              style: TextStyle(
                fontSize: CustomText.button.fontSize,
                fontWeight: CustomText.button.fontWeight,
                fontFamily: CustomText.button.fontFamily,
                color: CustomColor.white
              ),
            ),
            const SizedBox(
              width: 12.0,
            ),
          ],
        ),
      ),
    ),
  );

}
