import 'package:costbridge/common/const/const.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

showErrorDialog({
  required BuildContext context,
  String middleText = "서버와의 통신 중 오류가 발생했습니다.",
}) {
  showDialog(
    // useRootNavigator: false,
    context: context, 
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width.toInt() * 0.8 + 1,
          height: 161,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  height: 110,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          middleText,
                          style: CustomText.body1,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 1,
                color: CustomColor.lightGray,
              ),
              Container(
                width: MediaQuery.of(context).size.width.toInt() * 0.8 + 1,
                height: 50,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16))
                ),
                child: InkWell(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  onTap: () {
                    context.pop();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "닫기",
                        style: TextStyle(
                        fontSize: CustomText.body7.fontSize,
                        fontWeight: CustomText.body7.fontWeight,
                        fontFamily: CustomText.body7.fontFamily,
                        color: CustomColor.extraDarkGray),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  });
}
