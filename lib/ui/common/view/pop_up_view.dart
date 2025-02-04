import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:costbridge/core/utils/size_utils.dart';
import 'package:costbridge/theme/app_decoration.dart';
import 'package:costbridge/theme/custom_text_style.dart';
import 'package:costbridge/theme/theme_helper.dart';

Widget popupViewWidget(BuildContext context, String questionText,String cancleText,String okText){
  return Container(
    width: 400.h,
    padding:
    EdgeInsets.symmetric(horizontal: 34.h),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 5.v),
        Column(
          children: [
            Container(
              width: 400.h,
              padding: EdgeInsets.symmetric(
                horizontal: 82.h,
                vertical: 33.v,
              ),
              decoration:
              AppDecoration.white.copyWith(
                borderRadius: BorderRadiusStyle
                    .customBorderTL20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment:
                MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10.v),
                  Text(
                    questionText,
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.titleMediumPretendardBlack900,
                  ),
                ],
              ),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              elevation: 0,
              margin: EdgeInsets.all(0),
              color: appTheme.whiteA700,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusStyle
                    .customBorderBL20,
              ),
              child: Container(
                height: 60.v,
                width: 400.h,
                decoration:
                AppDecoration.white.copyWith(
                  borderRadius: BorderRadiusStyle
                      .customBorderBL20,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding:
                        EdgeInsets.symmetric(
                            horizontal: 73.h,
                            vertical: 20.v),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment
                              .spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context, 'Y');
                              },
                              child: Text(
                                okText,
                                style: CustomTextStyles.titleMediumBlack900_1,
                              ),
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.pop(context, 'N');
                                },
                                child: Text(
                                  cancleText,
                                style: CustomTextStyles.titleMediumBluegray400,
                                )),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: 60.v,
                        width: 352.h,
                        child: Stack(
                          alignment:
                          Alignment.center,
                          children: [
                            Align(
                              alignment: Alignment
                                  .topCenter,
                              child: SizedBox(
                                width: 352.h,
                                child: Divider(
                                  color: appTheme
                                      .gray40001,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment
                                  .center,
                              child: SizedBox(
                                height: 60.v,
                                child:
                                VerticalDivider(
                                  width: 10.h,
                                  thickness: 1.v,
                                  color: appTheme
                                      .gray40001,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
