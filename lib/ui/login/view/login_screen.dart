import 'dart:convert';
import 'dart:io';

import 'package:costbridge/provider/member_provider.dart';
import 'package:costbridge/routes/routes.dart';
import 'package:costbridge/vo/member/member.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:costbridge/core/app_export.dart';
import 'package:costbridge/localstorage/local_storage.dart';
import 'package:costbridge/ui/common/toast/toast_util.dart';
import 'package:costbridge/ui/common/widgets/custom_checkbox_button.dart';
import 'package:costbridge/ui/common/widgets/custom_elevated_button.dart';
import 'package:costbridge/ui/common/widgets/custom_image_view.dart';
import 'package:costbridge/ui/common/widgets/custom_text_form_field.dart';
import 'package:costbridge/ui/login/api/login_api.dart';
import 'package:costbridge/ui/login/model/login_view_model.dart';

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
    final memberProvider = context.read<MemberProvider>();
    mediaQueryData = MediaQuery.of(context);
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (BuildContext context, LoginViewModel model, Widget? child) => GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
      child: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              child: Container(
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
                                    height: MediaQuery.of(context).size.height * 0.06,
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
                                    buttonStyle: CustomButtonStyles.fillBlack,
                                    text: "로그인",
                                    onTap: (() {
                                      //TODO 임시 홈화면 진입 필요
                                      model.doLogin(idController.text.toString(), pwController.text.toString()).then((value) => {
                                        if(model.getMember()!=null){
                                          if(keepLoginFlag){
                                            model.setAutoLogin(model.getMember()!)
                                          },
                                        memberProvider.updateMember(model.getMember()!),
                                        Navigator.pushNamedAndRemoveUntil(context, Routes.main, (route) => false)
                                        }
                                        else{
                                          showToast(context,"아이디 혹은 비밀번호를 확인해주세요")
                                        }
                                      });
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
      ),)
    );

  }
}
