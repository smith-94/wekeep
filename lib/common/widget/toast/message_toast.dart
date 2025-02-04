import 'package:costbridge/common/const/const.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void messageToast(context, message, {double bottom = 50}) {
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
          children: [
            const SizedBox(
              width: 12.0,
            ),
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


  FToast().showToast(
    child: toast,
    gravity: ToastGravity.BOTTOM,
    toastDuration: const Duration(seconds: 2),
    // toast - RootScreen bottomNavigation 유무에 따라 달라지는 현상을 위한 조치
    positionedToastBuilder: (context, child) {
      return Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: bottom, 
            child: child,
          ),
        ], 
      );
    }
  );
}
