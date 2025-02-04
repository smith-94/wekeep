import 'package:costbridge/localstorage/local_storage.dart';
import 'package:costbridge/ui/costbilling/dto/costbilling.dart';
import 'package:costbridge/vo/member/member.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:costbridge/core/utils/image_constant.dart';
import 'package:costbridge/core/utils/size_utils.dart';
import 'package:costbridge/routes/routes.dart';
import 'package:costbridge/theme/app_decoration.dart';
import 'package:costbridge/theme/custom_text_style.dart';
import 'package:costbridge/theme/theme_helper.dart';
import 'package:costbridge/ui/common/widgets/app_bar/appbar_image.dart';
import 'package:costbridge/ui/common/widgets/app_bar/appbar_subtitle.dart';
import 'package:costbridge/ui/common/widgets/app_bar/custom_app_bar.dart';
import 'package:costbridge/ui/common/widgets/custom_image_view.dart';
import 'package:costbridge/ui/login/view/login_screen.dart';

import '../../common/widgets/custom_icon_button.dart';

class MypageWidget extends StatelessWidget {

  final Member member;
  final List<CostBilling> billings;

  const MypageWidget({super.key, required this.member, required this.billings});

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SafeArea(
            child: Scaffold(
              body: SizedBox(
                width: 450.h,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 22.v),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(height: 23.v),
                          CustomAppBar(
                            backgroundColor: Theme.of(context).primaryColor,
                            height: 34.v,
                            title: AppbarSubtitle(
                              text: "마이페이지",
                              margin: EdgeInsets.only(left: 24.h),
                            ),
                            actions: [
                              InkWell(
                                child: AppbarImage(
                                  svgPath: ImageConstant.imgGroup6351,
                                  margin: EdgeInsets.symmetric(horizontal: 24.h),
                                  onTap: (() {
                                    // setState(() {
                                    //   Navigator.pushNamed(
                                    //       context, Routes.alarm_screen);
                                    // });
                                  }),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 24.h,
                              top: 43.v,
                            ),
                            child: Row(
                              children: [
                                CustomIconButton(
                                  height: 70.adaptSize,
                                  width: 70.adaptSize,
                                  padding: EdgeInsets.all(0.h),
                                  decoration: IconButtonStyleHelper.outlineGray,
                                  child: Container(
                                    height: 70.adaptSize,
                                    width: 70.adaptSize,
                                    child: Icon(Icons.person,),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 18.h,
                                    top: 9.v,
                                    bottom: 5.v,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: ((){
                                          Navigator.pushNamed(context,
                                              Routes.mypage_edit).then((value) => {
                                          });
                                        }),
                                        child: Row(
                                          children: [
                                            Text(member.name!,
                                              style: CustomTextStyles.titleLargeWhiteA700,),
                                            CustomImageView(
                                              svgPath:
                                              ImageConstant.imgArrowrightGray50001,
                                              height: 20.v,
                                              width: 10.h,
                                              margin: EdgeInsets.only(
                                                left: 12.h,
                                                top: 7.v,
                                                bottom: 5.v,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 12.v),
                                      Text(member.phone ?? '',style: CustomTextStyles.titleLargeWhiteA70022,),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 24.v),
                          Align(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                Card(
                                  clipBehavior: Clip.antiAlias,
                                  elevation: 0,
                                  color: appTheme.whiteA700,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadiusStyle.roundedBorder20,
                                  ),
                                  child: Container(
                                    height: 80.v,
                                    width: 372.h,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 22.h,
                                      vertical: 17.v,
                                    ),
                                    decoration: AppDecoration.white.copyWith(
                                      borderRadius: BorderRadiusStyle.roundedBorder20,
                                    ),
                                    child: Column(
                                      children: [
                                        Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Align(
                                              alignment: Alignment.center,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        // Navigator.pushNamed(context,
                                                        //     Routes.reservation_mypage_screen);
                                                      },
                                                      child: Column(
                                                        children: [
                                                          RichText(
                                                            text: TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                  text: ' 0',
                                                                  style: CustomTextStyles
                                                                      .titleSmallRobotoPrimarySemiBold,
                                                                ),
                                                              ],
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                          SizedBox(height: 10.v),
                                                          RichText(
                                                            text: TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                  text: "대기",
                                                                  style: CustomTextStyles
                                                                      .titleSmallRobotoPrimaryContainerSemiBold,
                                                                ),
                                                              ],
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 42.v,
                                                    child: VerticalDivider(
                                                      width: 1.h,
                                                      thickness: 1.v,
                                                    ),
                                                  ),
                                                  Expanded(
                                                      flex: 1,
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          // Navigator.pushNamed(context,
                                                          //     Routes.ticket_mypage_screen);
                                                        },
                                                        child: Column(
                                                          children: [
                                                            RichText(
                                                              text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                    text: ' 0',
                                                                    style: CustomTextStyles
                                                                        .titleSmallRobotoPrimarySemiBold,
                                                                  ),
                                                                ],
                                                              ),
                                                              textAlign: TextAlign.left,
                                                            ),
                                                            SizedBox(height: 10.v),
                                                            RichText(
                                                              text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                    text: "승인 ",
                                                                    style: CustomTextStyles
                                                                        .titleSmallRobotoPrimaryContainerSemiBold,
                                                                  ),
                                                                ],
                                                              ),
                                                              textAlign: TextAlign.left,
                                                            ),
                                                          ],
                                                        ),
                                                      )),
                                                  SizedBox(
                                                    height: 42.v,
                                                    child: VerticalDivider(
                                                      width: 1.h,
                                                      thickness: 1.v,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        // Navigator.pushNamed(context,
                                                        //     Routes.reservation_mypage_screen);
                                                      },
                                                      child: Column(
                                                        children: [
                                                          RichText(
                                                            text: TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                  text: ' 0',
                                                                  style: CustomTextStyles
                                                                      .titleSmallRobotoPrimarySemiBold,
                                                                ),
                                                              ],
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                          SizedBox(height: 10.v),
                                                          RichText(
                                                            text: TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                  text: "반려",
                                                                  style: CustomTextStyles
                                                                      .titleSmallRobotoPrimaryContainerSemiBold,
                                                                ),
                                                              ],
                                                            ),
                                                            textAlign: TextAlign.left,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 24.h,
                                vertical: 10.v,
                              ),
                              decoration: AppDecoration.white,
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "결재 기록".tr,
                                  style: CustomTextStyles
                                      .titleSmallRobotoGray50001SemiBold,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (() {
                                // Navigator.pushNamed(
                                //     context, Routes.notice_list_screen);
                              }),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 24.h,
                                  vertical: 20.v,
                                ),
                                decoration: AppDecoration.white,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 1.v),
                                      child: Text(
                                        "결재 기록 관리".tr,
                                        style: CustomTextStyles
                                            .bodyLargePrimaryContainer18,
                                      ),
                                    ),
                                    CustomImageView(
                                      svgPath: ImageConstant.imgArrowright,
                                      height: 24.adaptSize,
                                      width: 24.adaptSize,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 10.v),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 24.h,
                                vertical: 10.v,
                              ),
                              decoration: AppDecoration.white,
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "공지사항 및 설정".tr,
                                  style: CustomTextStyles
                                      .titleSmallRobotoGray50001SemiBold,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (() {
                                Navigator.pushNamed(context, Routes.setting);
                              }),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 24.h,
                                  vertical: 20.v,
                                ),
                                decoration: AppDecoration.white,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 1.v),
                                      child: Text(
                                        "설정".tr,
                                        style: CustomTextStyles
                                            .bodyLargePrimaryContainer18,
                                      ),
                                    ),
                                    CustomImageView(
                                      svgPath: ImageConstant.imgArrowright,
                                      height: 24.adaptSize,
                                      width: 24.adaptSize,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (() {
                                Navigator.pushNamed(context, Routes.notice_list);
                              }),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 24.h,
                                  vertical: 20.v,
                                ),
                                decoration: AppDecoration.white,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 1.v),
                                      child: Text(
                                        "공지 사항".tr,
                                        style: CustomTextStyles
                                            .bodyLargePrimaryContainer18,
                                      ),
                                    ),
                                    CustomImageView(
                                      svgPath: ImageConstant.imgArrowright,
                                      height: 24.adaptSize,
                                      width: 24.adaptSize,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (() {
                                showDialog(
                                    context: context,
                                    barrierDismissible: true,
                                    // 바깥 영역 터치시 닫을지 여부
                                    builder: (BuildContext context) {
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
                                                        "로그아웃 \n 하시겠습니까?",
                                                        textAlign: TextAlign.center,
                                                        style: CustomTextStyles
                                                            .titleMediumPretendardBlack900,
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
                                                                    Navigator.of(context).pop();
                                                                  },
                                                                  child: Text(
                                                                    "취소",
                                                                    style: CustomTextStyles
                                                                        .titleMediumBluegray400,
                                                                  ),
                                                                ),
                                                                GestureDetector(
                                                                    onTap: () {
                                                                      LocalStorage.removeUser();
                                                                      Navigator.pushAndRemoveUntil(
                                                                          context,
                                                                          MaterialPageRoute(builder: (BuildContext context) => LoginScreen()),
                                                                              (Route<dynamic> route) => false
                                                                      );
                                                                    },
                                                                    child: Text(
                                                                      "로그아웃",
                                                                      style: CustomTextStyles
                                                                          .titleMediumBlack900_1,
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
                                    });
                              }),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 24.h,
                                  vertical: 21.v,
                                ),
                                decoration: AppDecoration.white,
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    "로그아웃".tr,
                                    style:
                                    CustomTextStyles.bodyLargePretendardRedA700,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
            ))));
  }
}
