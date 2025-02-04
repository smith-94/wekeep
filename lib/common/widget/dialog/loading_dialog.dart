
import 'package:costbridge/common/const/color.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

showLoadingDialog({
  required BuildContext context,
}) {
  showDialog(
    // useRootNavigator: false,
    context: context, 
    barrierDismissible: false,
    barrierColor: CustomColor.backGround.withOpacity(0.0),
    builder: (context) {
      return const Center(
        child: CircularProgressIndicator(
          color: CustomColor.primaryBlue100,
        ),
      );
  });
}

void hideLoadingDialog(BuildContext context) {
  context.pop();
}
