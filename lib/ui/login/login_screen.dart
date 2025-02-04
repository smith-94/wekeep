import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:wekeep/core/utils/image_constant.dart';
import 'package:wekeep/core/utils/size_utils.dart';
import 'package:wekeep/theme/custom_button_style.dart';
import 'package:wekeep/theme/custom_text_style.dart';
import 'package:wekeep/theme/theme_helper.dart';
import 'package:wekeep/ui/common/widgets/custom_checkbox_button.dart';
import 'package:wekeep/ui/common/widgets/custom_elevated_button.dart';
import 'package:wekeep/ui/common/widgets/custom_image_view.dart';
import 'package:wekeep/ui/common/widgets/custom_text_form_field.dart';

class LoginScreen extends StatefulWidget {

  @override
  State<LoginScreen> createState() => LoginScreenState();
}
  class LoginScreenState extends State<LoginScreen> {
  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();

  bool keepLoggedIn = true;
  late List<String> jwt = [];
  String appleUserId = '';
  bool loginTryFlag = true;
  FocusNode mf = FocusNode();
  FocusNode mf2 = FocusNode();
  bool keepLoginFlag = true;

  @override
  void dispose() {
    mf.dispose();
    mf2.dispose();
    idController.dispose();
    pwController.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              child: Container(
                color: Color(0xFFFFF59D),
                height: 1040.v,
                width: mediaQueryData.size.width,
                padding: EdgeInsets.symmetric(
                  horizontal: 10.h,
                  vertical: 60.v,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 14.h),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  SizedBox(height: 50.v),
                                  CustomImageView(
                                    fit: BoxFit.fill,
                                    radius: const BorderRadius.all(Radius.circular(10)),
                                    imagePath: ImageConstant.logo,
                                    height: MediaQuery.of(context).size.height * 0.2,
                                    width: MediaQuery.of(context).size.width * 0.5,
                                    alignment: Alignment.center,
                                  ),
                                  SizedBox(height: 36.v),
                                  Text(
                                    "아이디",
                                    style: loginTryFlag
                                        ? CustomTextStyles.titleMediumGray700
                                        : CustomTextStyles.titleMediumRedA700,
                                  ),
                                  SizedBox(height: 6.v),
                                  CustomTextFormField(
                                    fillColor: Colors.white,
                                    textStyle: TextStyle(color: Colors.black),
                                    controller: idController,
                                    focusNode: mf,
                                    hintText: "아이디",
                                    hintStyle: theme.textTheme.bodyLarge!,
                                    borderDecoration: loginTryFlag
                                        ? null
                                        : TextFormFieldStyleHelper.outlineRedA,
                                    fillColor: loginTryFlag ? null : appTheme.gray50,
                                  ),
                                  SizedBox(height: 25.v),
                                  Text("비밀번호",
                                      style: loginTryFlag
                                          ? CustomTextStyles.titleMediumGray700
                                          : CustomTextStyles.titleMediumRedA700),
                                  SizedBox(height: 6.v),
                                  CustomTextFormField(
                                    obscureText: true,
                                    textStyle: TextStyle(color: Colors.black),
                                    controller: pwController,
                                    focusNode: mf2,
                                    hintText: "비밀번호",
                                    hintStyle: theme.textTheme.bodyLarge!,
                                    borderDecoration: loginTryFlag
                                        ? null
                                        : TextFormFieldStyleHelper.outlineRedA,
                                    fillColor: loginTryFlag ? null : appTheme.gray50,
                                    textInputAction: TextInputAction.done,
                                  ),
                                  SizedBox(height: 26.v),
                                  CustomCheckboxButton(
                                    text: "로그인 유지하기",
                                    rightPadding: 2,
                                    value: keepLoginFlag,
                                    padding: EdgeInsets.symmetric(vertical: 1.v),
                                    textStyle: CustomTextStyles.titleMediumGray700Medium,
                                    activeColor: Colors.black,
                                    // decoration: BoxDecoration(
                                    //   color: appTheme.black900,
                                    // ),
                                    onChange: (value) {
                                        if (keepLoginFlag) {
                                          setState(() {
                                          keepLoginFlag = false;
                                          });
                                        } else {
                                          setState(() {
                                          keepLoginFlag = true;
                                          });
                                        }
                                    },
                                  ),
                                  SizedBox(height: 26.v),
                                  CustomElevatedButton(
                                    buttonStyle: CustomButtonStyles.fillOnPrimaryContainer,
                                    text: "로그인",
                                    onTap: (() {
                                    }),
                                  ),
                                  SizedBox(height: 25.v),
                                  SizedBox(height: 30.v),
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
            ),
          ),
        ),
      );
  }
}
