import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:costbridge/core/utils/size_utils.dart';


void showToast(BuildContext context, String message) {
  mediaQueryData = MediaQuery.of(context);

  FToast fToast;
  fToast = FToast();
  fToast.init(context);

  fToast.showToast(
    child: Container(
        width: mediaQueryData.size.width - 24.h,
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(11.h),
        ),
        padding: EdgeInsets.symmetric(vertical: 14.v, horizontal: 38.h),
        margin:EdgeInsets.only(bottom: 80.v),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$message',
                style: TextStyle(color: Colors.white, fontSize: 15.fSize))
          ],
        )),
    gravity: ToastGravity.BOTTOM,
    toastDuration: Duration(seconds: 2),
  );
}

void showButtonToast(
    BuildContext context, String message, String buttonMessage) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: Text(message),
      action: SnackBarAction(
          label: buttonMessage, onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}
